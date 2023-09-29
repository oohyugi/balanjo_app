import 'package:flutter/material.dart';

// class Tapper extends StatelessWidget {
//   final Widget child;
//   final VoidCallback? onTap;
//   final BorderRadiusGeometry? borderRadius;
//   final Color? backgroundColor;
//   final Color? rippleColor;
//
//   const Tapper({
//     required this.child,
//     required this.onTap,
//     this.borderRadius,
//     this.backgroundColor,
//     this.rippleColor,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(8),
//       onTap: onTap,
//       child: child,
//     );
//   }
// }


class Tapper extends StatefulWidget {
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
  State<Tapper> createState() => _TapperState();
}

class _TapperState extends State<Tapper> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => setState(() => _isPressed = true),
      onTapUp: (details) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: Transform.scale(
        scale: _isPressed ? 0.9 : 1.0,
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
                // color: _isPressed? Theme.of(context).highlightColor:Colors.transparent,
                borderRadius: BorderRadius.circular(8)
              ),
            child: widget.child,
          ),
      ),
    );
  }
}
