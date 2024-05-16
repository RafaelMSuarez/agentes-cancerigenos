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
  static const TextStyle mainTitle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static const TextStyle secondTitle = TextStyle(fontSize: 16, fontStyle: FontStyle.italic, fontWeight: FontWeight.w300);
}
