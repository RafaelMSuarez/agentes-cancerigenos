import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class ComoSeClasificaPopUp extends StatelessWidget {
  const ComoSeClasificaPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    return SizedBox(
      height: alto * 0.6,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          ListTile(
            title: const Text("¿Como se realiza la clasificación?"),
            titleTextStyle: PopUpTextStyle.mainTitle,
            textColor: DefaultTextStyle.of(context).style.color,
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Al momento de analizar un agente, IARC realiza un serie de pasos.",
              style: PopUpTextStyle.content,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "En primer lugar se identifica y describe el agente, incluyendo su uso, origen, regulaciones y exposiciones.",
              style: PopUpTextStyle.content,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Seguido, se analizan los estudios del agente en humanos. Asimismo, se analizan los estudios realizados en animales.",
              style: PopUpTextStyle.content,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Finalmente, en base a los resultados y los niveles de evidencia del conjunto de estudios, se declara la clasificación del agente.",
              style: PopUpTextStyle.content,
            ),
          ),
        ],
      ),
    );
  }
}
