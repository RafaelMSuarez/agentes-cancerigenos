import 'package:flutter/material.dart';

abstract class TitleTextStyle {
  static const TextStyle mainTitle = TextStyle(
    fontSize: 25,
  );
  static const TextStyle secondTitle = TextStyle(
    fontSize: 20,
  );
}

abstract class CardTextStyle {
  static const TextStyle mainTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle secondTitle = TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w300,
  );
}

abstract class PopUpTextStyle {
  static const TextStyle mainTitle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const TextStyle secondTitle = TextStyle(
    fontSize: 20,
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
  );
}
