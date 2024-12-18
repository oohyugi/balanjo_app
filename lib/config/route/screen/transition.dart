import 'package:flutter/material.dart';

class CustomTransitionBuilder extends StatelessWidget {
  const CustomTransitionBuilder(
      {super.key, required this.animation, required this.child});

  final Animation animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ),
        ),
        child: child);
  }
}
