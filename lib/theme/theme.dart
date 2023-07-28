import 'package:balanjo_app/theme/color_schemes.dart';
import 'package:balanjo_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildTheme() {
  var baseTheme = ThemeData(colorScheme: scheme, useMaterial3: true);
  return baseTheme.copyWith(
    textTheme: GoogleFonts.ubuntuTextTheme(baseTheme.textTheme),
  );
}

final ColorScheme scheme =
    ColorScheme.fromSeed(seedColor:  BColors.green);
