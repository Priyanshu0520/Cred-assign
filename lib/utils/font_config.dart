import 'package:flutter/material.dart';

const _lineHeight = 1.0;

class AppFontSize {
  static const h1 = TextStyle(
    fontSize: FontSize.h4,
    height: _lineHeight,
  );

  static const h2 = TextStyle(
    fontSize: FontSize.h5,
    height: _lineHeight,
  );

  static const h3 = TextStyle(
    fontSize: FontSize.h6,
    height: _lineHeight,
  );

  static const body1 = TextStyle(
    fontSize: FontSize.b1,
    height: 1.2,
  );

  static const body2 = TextStyle(
    fontSize: FontSize.b2,
    height: _lineHeight,
  );
    static const body3 = TextStyle(
    fontSize: FontSize.s1,
    height: _lineHeight,
  );
    static const body4 = TextStyle(
    fontSize: FontSize.s2,
    height: _lineHeight,
  );
}

class FontSize {
  static const double h1 = 39.0;
  static const double h2 = 30.0;
  static const double h3 = 24.0;
  static const double h4 = 20.0;
  static const double h5 = 18.0;
  static const double h6 = 16.0;
  static const double b1 = 16.0;
  static const double b2 = 14.0;
  static const double s1 = 13;
  static const double s2 = 12;
}
