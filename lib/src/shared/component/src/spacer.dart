import 'package:flutter/material.dart';

class SpaceHorizontal extends StatelessWidget {
  final double size;

  const SpaceHorizontal({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
    );
  }
}

class SpaceVertical extends StatelessWidget {
  final double size;

  const SpaceVertical({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
    );
  }
}
