import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

String firstToUpperCase(String? string) {
  if (string == null || string.isEmpty) {
    return "-";
  }
  return string.replaceFirst(string[0], string[0].toUpperCase());
}

Padding textEvidencia(String? evidencia) {
  if (evidencia == null || evidencia.isEmpty) {
    return const Padding(
      padding: EdgeInsets.zero,
      child: SizedBox(),
    );
  }
  List<String> listEv = evidencia.split(" ");
  List<String> resto = listEv.getRange(3, listEv.length).toList();
  return Padding(
    padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 15),
    child: RichText(
      text: TextSpan(
          text: "${listEv[0]} ",
          style: PopUpTextStyle.content.copyWith(fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: "${listEv[1]} ",
              style:
                  PopUpTextStyle.content.copyWith(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: "${listEv[2]} ",
              style:
                  PopUpTextStyle.content.copyWith(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: resto.join(" "),
              style: PopUpTextStyle.content,
            ),
          ]),
    ),
  );
}
