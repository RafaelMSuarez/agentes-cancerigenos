import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/text_styles.dart';
import 'package:proyecto_ubb/utils/string_utils.dart';
import 'package:proyecto_ubb/utils/url_utils.dart';

class NutriScorePopUp extends StatelessWidget {
  const NutriScorePopUp({super.key});

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
            title: const Text("¿Qué es NutriScore?"),
            titleTextStyle: PopUpTextStyle.mainTitle,
            textColor: DefaultTextStyle.of(context).style.color,
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Nutriscore es un sistema de puntaje que muestra la calidad nutricional de un producto.",
              style: PopUpTextStyle.content,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Se utiliza una graduación de mayor a menor, va desde la letra A hasta la letra E",
              style: PopUpTextStyle.content,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Se evalua según la cantidad de grasas saturadas, azúcares, sodio, energía calórica, al igual que de fibras, frutas, verduras, nueces, aceites y proteínas.",
              style: PopUpTextStyle.content,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "No todos los alimentos son elegibles para la evaluación; tales como alimentos frescos, bebestibles, savorizantes, sales de mesa, entre otros.",
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
            title: const Text("NutriScore"),
            onTap: () {
              urlDialog(context,
                  Uri.parse("https://es.openfoodfacts.org/nutriscore"));
            },
          ),
        ],
      ),
    );
  }
}
