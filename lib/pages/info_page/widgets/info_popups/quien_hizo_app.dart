import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class QuienHizoAppPopUp extends StatelessWidget {
  const QuienHizoAppPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    return SizedBox(
      height: alto * 0.35,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          ListTile(
            title: const Text("¿Quién hizo esta aplicación?"),
            titleTextStyle: PopUpTextStyle.mainTitle,
            textColor: DefaultTextStyle.of(context).style.color,
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Esta aplicación fue realizada como proyecto final de grado de Ingeniería Civil en Informática (2024-2)",
              style: PopUpTextStyle.content,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Rafael Martínez Suárez",
              style: PopUpTextStyle.content,
            ),
            subtitle: Text(
              "Universidad Del Bío-Bío, Concepción",
              style: PopUpTextStyle.subtitle,
            ),
          ),
        ],
      ),
    );
  }
}
