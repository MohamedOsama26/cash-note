import 'package:flutter/material.dart';

class AppFonts extends TextStyle {
  static String nunito({
    bool italic = false,
  }) =>
      italic
          ? 'assets/fonts/Nunito/Nunito-Italic-VariableFont_wght.ttf'
          : 'assets/fonts/Nunito/Nunito-VariableFont_wght.ttf';
}
