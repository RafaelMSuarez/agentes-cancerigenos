import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/text_styles.dart';
import 'package:proyecto_ubb/utils/string_utils.dart';
import 'package:proyecto_ubb/utils/url_utils.dart';

class OpenFoodFactsPopUp extends StatelessWidget {
  const OpenFoodFactsPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    return SizedBox(
      height: alto * 0.5,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          ListTile(
            title: const Text("¿Qué es OpenFoodFacts?"),
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
                    "*OpenFoodFacts* es una base de datos *libre, gratis y de colaboración abierta* de productos alimenticios en todo el mundo."),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              " El proyecto es de origen francés. Contiene colaboradores de 141 países.",
              style: PopUpTextStyle.content,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Las colaboraciones pueden ser agregadas y editadas por cualquiera con cuenta.",
              style: PopUpTextStyle.content,
            ),
          ),
          const Divider(
            endIndent: 15,
            indent: 15,
          ),
          ListTile(
            leading: const Icon(
              Icons.public,
            ),
            trailing: const Icon(Icons.arrow_forward),
            title: const Text("OpenFoodFacts"),
            onTap: () {
              urlDialog(context, Uri.parse("https://es.openfoodfacts.org/"));
            },
          ),
        ],
      ),
    );
  }
}
