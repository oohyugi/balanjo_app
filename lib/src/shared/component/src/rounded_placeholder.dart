import 'package:balanjo_app/src/shared/component/component.dart';
import 'package:flutter/material.dart';

class RoundedPlaceHolder extends StatelessWidget {
  const RoundedPlaceHolder(
      {super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
    );
  }
}

