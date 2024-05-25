import 'package:flutter/material.dart';

abstract class PaddingTheme {
  static const EdgeInsets horizontal = EdgeInsets.symmetric(horizontal: 15);

  static const EdgeInsets vertical = EdgeInsets.symmetric(vertical: 15);

  static const EdgeInsets all =
      EdgeInsets.symmetric(vertical: 15, horizontal: 15);

  static const EdgeInsets allPage =
      EdgeInsets.only(top: 15, left: 15, right: 15);

  static const double paddingDoubleHorizontal = 15;

  static const double paddingDoubleVertical = 15;
}
