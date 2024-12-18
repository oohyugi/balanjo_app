import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:balanjo_app/src/utils/log.dart';
import 'package:balanjo_app/res/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Search extends StatefulWidget {
  const Search({super.key, this.isShowOnlyIcon = false});

  final bool isShowOnlyIcon;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final SearchController _controller = SearchController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _controller.addListener(() {
      if (!_controller.isOpen) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
              widget.isShowOnlyIcon
                  ? IconButton(
                      onPressed: () {
                        _controller.openView();
                      },
                      icon: SvgPicture.asset(
                        Assets.icSearch,
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.onBackground,
                            BlendMode.srcIn),
                      ),
                    )
                  : SizedBox(
                      height: 44,
                      child: SearchBar(
                        padding:
                            const MaterialStatePropertyAll<EdgeInsetsGeometry>(
                                EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 0)),
                        shape: const MaterialStatePropertyAll<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)))),
                        elevation: const MaterialStatePropertyAll<double>(1),
                        leading: SvgPicture.asset(
                          Assets.icSearch,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.onBackground,
                              BlendMode.srcIn),
                        ),
                        hintText: "Cari di Balanjo",

                        onTap: () {
                          controller.openView();
                        },
                      ),
                    ),
             if(!widget.isShowOnlyIcon)
               Container(
                 height: 50,
                 color: Colors.transparent,
                 width: MediaQuery.of(context).size.width,
               )

            ],
          ),
        );
      },

      viewElevation: 1,
      suggestionsBuilder: (context, controller) {
        return List<Container>.generate(0, (i) {
          return Container();
        });
      },
    );
  }
}
