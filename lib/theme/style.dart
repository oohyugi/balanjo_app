import 'package:flutter/material.dart';


ButtonStyle outLineSmall() {
  return OutlinedButton.styleFrom(
      minimumSize: const Size(45, 28),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)));
}
