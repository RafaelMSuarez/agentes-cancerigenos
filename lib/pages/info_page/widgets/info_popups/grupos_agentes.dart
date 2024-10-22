import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/text_styles.dart';
import 'package:proyecto_ubb/utils/string_utils.dart';

class GruposAgentesPopUp extends StatelessWidget {
  const GruposAgentesPopUp({super.key});

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
            title: const Text("¿Qué significan los grupos de agentes?"),
            titleTextStyle: PopUpTextStyle.mainTitle,
            textColor: DefaultTextStyle.of(context).style.color,
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
                    "IARC realiza una clasificación de los agentes en cuatro niveles. Las categorías indican la *cantidad de evidencia* que los agentes poseen en cuanto a su capacidad de *aumentar* el cáncer."),
              ),
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
                    "Es importante destacar que se mide el *nivel de evidencia* del agente. Es decir, *no* indica la probabilidad (riesgo) de que el agente *cause un cáncer*"),
              ),
            ),
          ),
          const Divider(
            endIndent: 15,
            indent: 15,
          ),
          ListTile(
            title: const Text("Grupos de Clasificación"),
            titleTextStyle: PopUpTextStyle.secondTitle,
            textColor: DefaultTextStyle.of(context).style.color,
          ),
          ExpansionTile(
            textColor: DefaultTextStyle.of(context).style.color,
            title: const Text(
              "Grupo 1",
              style: PopUpTextStyle.secondTitle,
            ),
            subtitle: const Text(
              "Carcinogénico para Humanos",
              style: PopUpTextStyle.subtitle,
            ),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 15, top: 5),
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context)
                        .style
                        .merge(PopUpTextStyle.content),
                    children: textEvidencia(
                        "Se utiliza esta categoría cuando existe *suficiente evidencia* de la carcinogenicidad en huamanos del agente. También se puede utilizar cuando se asume su carcinogenicidad en humanos en base a una *fuerte evidencia en animales*, en características que los huamnos presenten igualmente."),
                  ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            textColor: DefaultTextStyle.of(context).style.color,
            title: const Text(
              "Grupo 2A",
              style: PopUpTextStyle.secondTitle,
            ),
            subtitle: const Text(
              "Probable Carcinogénico para Humanos",
              style: PopUpTextStyle.subtitle,
            ),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 15, top: 5),
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context)
                        .style
                        .merge(PopUpTextStyle.content),
                    children: textEvidencia(
                        "Esta categoría se utiliza cuando existe *suficiente evidencia en animales* sobre la carcinogenicidad de un agente, pero la *evidencia en humanos* es *limitada*."),
                  ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            textColor: DefaultTextStyle.of(context).style.color,
            title: const Text(
              "Grupo 2B",
              style: PopUpTextStyle.secondTitle,
            ),
            subtitle: const Text(
              "Posible Carcinogénico para Humanos",
              style: PopUpTextStyle.subtitle,
            ),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 15, top: 5),
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context)
                        .style
                        .merge(PopUpTextStyle.content),
                    children: textEvidencia(
                        "Similar a la categoría anterior. Esta vez, se utiliza cuando o *existe suficiente evidencia en animales* o bien, cuando la *evidencia en humanos es limitada*."),
                  ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            textColor: DefaultTextStyle.of(context).style.color,
            title: const Text(
              "Grupo 3",
              style: PopUpTextStyle.secondTitle,
            ),
            subtitle: const Text(
              "No Clasificable como Carcinogénico para Humanos",
              style: PopUpTextStyle.subtitle,
            ),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context)
                        .style
                        .merge(PopUpTextStyle.content),
                    children: textEvidencia(
                        "Se utiliza esta categoría regularmente cuando la *evidencia en humanos* sobre la carcinogenicidad es *no adecuada* para su clasificación. Al igual que la *evidencia en animales* es *limitada* (o no adecuada). Su causa se puede deber a falta de estudios conclusivos."),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
