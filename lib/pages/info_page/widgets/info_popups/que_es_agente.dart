import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/text_styles.dart';
import 'package:proyecto_ubb/utils/string_utils.dart';

class QueEsAgentePopUp extends StatelessWidget {
  const QueEsAgentePopUp({super.key});

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    return SizedBox(
      height: alto * 0.7,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          ListTile(
            title: const Text("¿Qué es un agente carcinogénico?"),
            titleTextStyle: PopUpTextStyle.mainTitle,
            textColor: DefaultTextStyle.of(context).style.color,
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Un agentes carcinogénico es aquel elemento que tiene la capacidad de aumentar el riesgo de padecer cáncer en humanos.",
              style: PopUpTextStyle.content,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.circle,
              size: 12,
            ),
            title: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context)
                    .style
                    .merge(PopUpTextStyle.content),
                children: textEvidencia(
                    "Se debe mencionar que consumir (u otra relación) un agente carcinogénico *no causa un cáncer directamente*, pero si puede *aumentar la posibilidad* de padecer uno."),
              ),
            ),
          ),
          const ListTile(
            title: Text(
              "Los agentes pueden ser de tipo:",
              style: PopUpTextStyle.secondTitle,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Compuestos quimicos",
              style: PopUpTextStyle.content
                  .merge(const TextStyle(fontWeight: FontWeight.bold)),
            ),
            subtitle: const Text(
              "Ej: Diclorometano",
              style: PopUpTextStyle.subtitle,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Soluciones compuestas",
              style: PopUpTextStyle.content
                  .merge(const TextStyle(fontWeight: FontWeight.bold)),
            ),
            subtitle: const Text(
              "Ej: Polución del aire",
              style: PopUpTextStyle.subtitle,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Ocupaciones",
              style: PopUpTextStyle.content
                  .merge(const TextStyle(fontWeight: FontWeight.bold)),
            ),
            subtitle: const Text(
              "Ej: Ser bombero",
              style: PopUpTextStyle.subtitle,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Elementos físicos",
              style: PopUpTextStyle.content
                  .merge(const TextStyle(fontWeight: FontWeight.bold)),
            ),
            subtitle: const Text(
              "Ej: Radiación solar",
              style: PopUpTextStyle.subtitle,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Elementos biológicos",
              style: PopUpTextStyle.content
                  .merge(const TextStyle(fontWeight: FontWeight.bold)),
            ),
            subtitle: const Text(
              "Ej: Virus de Hepatitis B",
              style: PopUpTextStyle.subtitle,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Farmacéuticos",
              style: PopUpTextStyle.content
                  .merge(const TextStyle(fontWeight: FontWeight.bold)),
            ),
            subtitle: const Text(
              "Ej: Dietilestilbestrol",
              style: PopUpTextStyle.subtitle,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Otras acciones y/o factores",
              style: PopUpTextStyle.content
                  .merge(const TextStyle(fontWeight: FontWeight.bold)),
            ),
            subtitle: const Text(
              "Ej: Fumar tabaco",
              style: PopUpTextStyle.subtitle,
            ),
          ),
        ],
      ),
    );
  }
}
