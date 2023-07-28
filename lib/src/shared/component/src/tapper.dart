import 'package:flutter/material.dart';

class Tapper extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Color? rippleColor;

  const Tapper({
    required this.child,
    required this.onTap,
    this.borderRadius,
    this.backgroundColor,
    this.rippleColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(0)),
      child: Material(
        color: backgroundColor ?? Colors.transparent,
        child: InkWell(
          splashColor: rippleColor ?? Theme.of(context).splashColor,
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}