import 'package:flutter/material.dart';

class DColors {
  DColors._();
  //App Basic Color
  static const Color primaryColor = Color(0xFF2D5BFF);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFb0c7ff);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  //Gradient Color
  static const Gradient linerGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [Color(0xffff9a9e), Color(0xffffad8c4), Color(0xfffadBc4)],
  );

  //Text Colors

  static const Color textColor = Color(0xFF333333);
  static const Color textColorSecondary = Color(0xFF6C757D);
  static const Color textColorAccent = Colors.white;

  //Background Colors
  static const Color light = Color(0xFFf5f5f5);
  static const Color dark = Color(0xFF272727);
  static const Color background = Color(0xFFf3f5f5);

  //Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static final Color darkContainer = Colors.white.withOpacity(0.1);

  //Button Colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisbled = Color(0xFFc4c4c4);

  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Grey Shades
  static const Color lightGrey = Color(0xFFD3D3D3);
  static const Color grey = Color(0xFF808080);
  static const Color darkGrey = Color(0xFF505050);
  static const Color charcoalGrey = Color(0xFF36454F);
}
