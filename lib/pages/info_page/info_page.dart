import 'package:flutter/material.dart';
import 'package:proyecto_ubb/pages/info_page/widgets/info_popups/como_se_clasifica.dart';
import 'package:proyecto_ubb/pages/info_page/widgets/info_popups/como_utilizar.dart';
import 'package:proyecto_ubb/pages/info_page/widgets/info_popups/grupos_agentes.dart';
import 'package:proyecto_ubb/pages/info_page/widgets/info_popups/iarc.dart';
import 'package:proyecto_ubb/pages/info_page/widgets/info_popups/origen_informacion.dart';
import 'package:proyecto_ubb/pages/info_page/widgets/info_popups/que_es_agente.dart';
import 'package:proyecto_ubb/pages/info_page/widgets/info_popups/quien_hizo_app.dart';
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
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      showDragHandle: true,
                      builder: (context) {
                        return const ComoUtilizarPopUp();
                      },
                    );
                  },
                ),
                ListTile(
                  title: const Text("¿Quién hizo esta aplicación?"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      showDragHandle: true,
                      builder: (context) {
                        return const QuienHizoAppPopUp();
                      },
                    );
                  },
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
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      showDragHandle: true,
                      builder: (context) {
                        return const QueEsAgentePopUp();
                      },
                    );
                  },
                ),
                ListTile(
                  title: const Text("¿De dónde proviene la información?"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      showDragHandle: true,
                      builder: (context) {
                        return const OrigenInformacionPopUp();
                      },
                    );
                  },
                ),
                ListTile(
                  title: const Text("¿Qué es IARC?"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      showDragHandle: true,
                      builder: (context) {
                        return const QueEsIARCPopUp();
                      },
                    );
                  },
                ),
                ListTile(
                  title: const Text("¿Qué significan los grupos de agentes?"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      showDragHandle: true,
                      builder: (context) {
                        return const GruposAgentesPopUp();
                      },
                    );
                  },
                ),
                ListTile(
                  title: const Text("¿Cómo se realiza la clasificación?"),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      showDragHandle: true,
                      builder: (context) {
                        return const ComoSeClasificaPopUp();
                      },
                    );
                  },
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
                  title: const Text("¿Qué es OpenFoodFacts?"),
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
