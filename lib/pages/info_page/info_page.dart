import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/padding_style.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: PaddingTheme.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Sobre la aplicación",
                    style: TitleTextStyle.secondTitle,
                  ),
                ),
                ListTile(
                  title: const Text("¿Como utilizar esta aplicación?"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("¿Quién hizo esta aplicación?"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Agentes Carcinogénicos",
                    style: TitleTextStyle.secondTitle,
                  ),
                ),
                ListTile(
                  title: const Text("¿Qué es un agente carcinogénico?"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("¿De dónde proviene la información?"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Qué es IARC?"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("¿Qué significan los grupos de agentes?"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("¿Cómo se realiza la clasificación?"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Información Nutricional",
                    style: TitleTextStyle.secondTitle,
                  ),
                ),
                ListTile(
                  title: const Text("Qué es OpenFoodFacts?"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("¿Qué es NutriScore?"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("¿Qué tan fiable es la información?"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
