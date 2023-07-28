import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/src/utils/log.dart';
import 'package:balanjo_app/theme/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final SearchController _controller = SearchController();
  ScrollNotificationObserverState? _scrollNotificationObserver;
  bool _scrolledUnder = false;

  @override
  void didChangeDependencies() {
    _scrollNotificationObserver?.removeListener(_handleScrollNotification);
    _scrollNotificationObserver = ScrollNotificationObserver.maybeOf(context);
    _scrollNotificationObserver?.addListener(_handleScrollNotification);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    if (_scrollNotificationObserver != null) {
      _scrollNotificationObserver!.removeListener(_handleScrollNotification);
      _scrollNotificationObserver = null;
    }
    super.dispose();
  }

  void _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification &&
        defaultScrollNotificationPredicate(notification)) {
      final bool oldScrolledUnder = _scrolledUnder;
      final ScrollMetrics metrics = notification.metrics;
      // logDebug("axis", metrics.extentBefore);
      switch (metrics.axisDirection) {
        case AxisDirection.up:
          // Scroll view is reversed
          _scrolledUnder = metrics.extentAfter > 0;
        case AxisDirection.down:
          _scrolledUnder = metrics.extentBefore > 0;
        case AxisDirection.right:
        case AxisDirection.left:
          // Scrolled under is only supported in the vertical axis, and should
          // not be altered based on horizontal notifications of the same
          // predicate since it could be a 2D scroller.
          break;
      }

      if (_scrolledUnder != oldScrolledUnder) {
        setState(() {
          // React to a change in MaterialState.scrolledUnder
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      searchController: _controller,
      builder: (context, controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Stack(
            children: [
              SearchBar(
                padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 0)),
                shape: const MaterialStatePropertyAll<OutlinedBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)))),
                constraints: const BoxConstraints(minHeight: 24,maxHeight: 42),
                elevation:
                    MaterialStatePropertyAll<double>(_scrolledUnder ? 0 : 1),
                shadowColor: const MaterialStatePropertyAll<Color>(Colors.black),
                leading: SvgPicture.asset(
                  assetNameSearch,
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.onBackground,
                      BlendMode.srcIn),
                ),
                hintText: "Cari di Balanjo",
                focusNode: FocusNode(
                    canRequestFocus: false, descendantsAreFocusable: false),
                controller: TextEditingController(),
                onTap: () {
                  controller.openView();
                },
              ),
              Container(
                height: 50,
                color: Colors.transparent,
                width: MediaQuery.of(context).size.width,
              )
            ],
          ),
        );
      },
      suggestionsBuilder: (context, controller) {
        return List<Container>.generate(0, (i) {
          return Container();
        });
      },
    );
  }
}
