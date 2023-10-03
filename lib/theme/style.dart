import 'package:flutter/material.dart';

ButtonStyle outLineSmall() {
  return OutlinedButton.styleFrom(
      minimumSize: const Size(45, 28),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)));
}

ButtonStyle filledSmall() {
  return FilledButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)));
}
ButtonStyle filledDefault(BuildContext context) {
  return FilledButton.styleFrom(
    textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)));
}

ButtonStyle filledLarge(BuildContext context) {
  return FilledButton.styleFrom(
      minimumSize: const Size(100, 52),
      textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)));
}
