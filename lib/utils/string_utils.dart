import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

String firstToUpperCase(String? string) {
  if (string == null || string.isEmpty) {
    return "-";
  }
  return string.replaceFirst(string[0], string[0].toUpperCase());
}

List<TextSpan> textEvidencia(String? texto) {
  if (texto == null || texto.isEmpty) {
    return [];
  }

  List<TextSpan> spans = [];
  RegExp regex = RegExp(r'\*(.*?)\*');
  int lastMatchEnd = 0;

  for (final match in regex.allMatches(texto)) {
    if (match.start > lastMatchEnd) {
      spans.add(
        TextSpan(
          text: texto.substring(lastMatchEnd, match.start),
        ),
      );
    }

    spans.add(
      TextSpan(
        text: match.group(1),
        style: PopUpTextStyle.content.copyWith(fontWeight: FontWeight.bold),
      ),
    );
    lastMatchEnd = match.end;
  }

  if (lastMatchEnd < texto.length) {
    spans.add(
      TextSpan(
        text: texto.substring(lastMatchEnd),
      ),
    );
  }

  return spans;
}
