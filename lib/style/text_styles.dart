import 'package:flutter/material.dart';

abstract class TitleTextStyle {
  static const TextStyle mainTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold
  );

  static const TextStyle secondTitle = TextStyle(
    fontSize: 20,
  );
}

abstract class CardTextStyle {
  static const TextStyle mainTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle secondTitle = TextStyle(
    fontSize: 14,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w300,
  );
}

abstract class PopUpTextStyle {
  static const TextStyle mainTitle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle secondTitle = TextStyle(
    fontSize: 18,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.italic,
  );
}
