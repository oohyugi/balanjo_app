import 'package:balanjo_app/src/shared/component/src/search.dart';
import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseLayout extends StatefulWidget {
  final Widget? title;
  final Widget body;
  final List<Widget>? actions;
  final bool isShowFloatingCart;
  final TabBar? tabBar;
  final Color? navBarColor;
  final bool isHideAppBar;

  const BaseLayout({
    Key? key,
    this.title,
    required this.body,
    this.actions,
    this.tabBar,
    this.isShowFloatingCart = true,
    this.navBarColor,
    this.isHideAppBar = false,
  }) : super(key: key);

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: widget.isHideAppBar
                ? null
                : AppBar(
                    title: widget.title,
                    actions: widget.actions,
                    bottom: widget.tabBar,
                    centerTitle: false,
                    backgroundColor: Theme.of(context).colorScheme.background,
                    elevation: 0,
                    scrolledUnderElevation: 0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        systemNavigationBarColor:
                            ElevationOverlay.applySurfaceTint(
                                Theme.of(context).colorScheme.surface,
                                Theme.of(context).colorScheme.surfaceTint,
                                0)),
                  ),
            body: Stack(
              children: [
                widget.body,
                if (widget.isShowFloatingCart)
                  const Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: SafeArea(child: FloatingCart()))
              ],
            ),
          );
  }
}
