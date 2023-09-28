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
  final double elevation;
  final ScrollNotificationPredicate? notificationPredicate;

  const BaseLayout(
      {Key? key,
      this.title,
      required this.body,
      this.actions,
      this.tabBar,
      this.isShowFloatingCart = true,
      this.navBarColor,
      this.elevation = 4,
      this.notificationPredicate})
      : super(key: key);

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
      extendBody: true,
      appBar: AppBar(
        title: widget.title,
        actions: widget.actions,
        bottom: widget.tabBar != null
            ? PreferredSize(
                preferredSize: const Size.fromHeight(32),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: widget.tabBar,
                ))
            : null,
        centerTitle: false,
        shadowColor: Theme.of(context).colorScheme.shadow,
        scrolledUnderElevation: widget.elevation,
        notificationPredicate:
            widget.notificationPredicate ?? defaultScrollNotificationPredicate,
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
