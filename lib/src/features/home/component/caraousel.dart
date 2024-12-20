import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/src/utils/extensions/list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel>
    with SingleTickerProviderStateMixin {
  final carousels = [
    "https://sesa.id/cdn/shop/files/Web_Banner_3_460x@2x.jpg?v=1689585568",
    "https://sesa.id/cdn/shop/files/Web_Banner_2_1024x1024.jpg?v=168958558",
    "https://sesa.id/cdn/shop/files/Web_Banner_4_2_1024x1024.jpg?v=1689587974"
  ];

  late List<Widget> _children;

  late PageController _pageController;
  int _currentPage = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    _children = carousels.mapIndexed((i, e) {
      return Padding(
        padding: EdgeInsets.only(left: i != carousels.length? 14 : 0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: e,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }).toList();

    _pageController =
        PageController(viewportFraction: 0.88, initialPage: _currentPage);
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reset(); //Reset the controller
        if (_currentPage == carousels.length - 1) {
          _currentPage = 0;
        } else {
          _currentPage++;
        }

        _pageController.animateToPage(_currentPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInSine);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _animationController.forward();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: PageView.builder(
            pageSnapping: true,
            padEnds: false,
            controller: _pageController,
            itemBuilder: (context, index) {
              return _children.loop(index);
              // return _children[index];
            },
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
                // _animationController.forward();
              });
            },
          ),
        ),
        const SpaceVertical(size: 8),
        DotIndicator(count: _children.length, index: _currentPage)
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.count, required this.index});

  final int count;
  final int index;

  @override
  Widget build(BuildContext context) {
    List<Widget> childrens = List.empty(growable: true);
    for (int i = 0; i < count; i++) {
      childrens.add(AnimatedContainer(
        width: index % count == i ? 18 : 6,
        height: 6,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: index % count == i
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.outline,
        ),
        duration: const Duration(milliseconds: 200),
      ));
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: childrens,
    );
  }
}
