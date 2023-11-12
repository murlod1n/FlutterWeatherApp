import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Montserrat',
      scaffoldBackgroundColor: const Color(0xFF26262A)
    );
  }
}