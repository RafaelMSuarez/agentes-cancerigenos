import 'package:flutter/material.dart';
import 'package:proyecto_ubb/models/agent_model.dart';
import 'package:proyecto_ubb/style/padding_style.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class AgentPopUp extends StatelessWidget {
  final Agent agent;
  const AgentPopUp({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    final List<String> grupos = [
      "Grupo 1",
      "Grupo 2A",
      "Grupo 2B",
      "Grupo 3",
    ];

    final List<String> gruposDesc = [
      "Carcinogénico para los humanos",
      "Probablemente carcinogénico para humanos",
      "Posiblemente carcinogénico para humanos",
      "No es carcinogénico para humanos",
    ];

    // String getGroup() {
    //   switch (agent.group) {
    //     case 1:
    //       return "Grupo 1";
    //     case 2:
    //       return "Grupo 2A";
    //     case 3:
    //       return "Grupo 2B";
    //     case 4:
    //       return "Grupo 3";
    //     default:
    //       return "";
    //   }
    // }

    // String getGroupInfo() {
    //   switch (agent.group) {
    //     case 1:
    //       return "Carcinogénico para los humanos";
    //     case 2:
    //       return "Probablemente carcinogénico para humanos";
    //     case 3:
    //       return "Posiblemente carcinogénico para humanos";
    //     case 4:
    //       return "No es carcinogénico para humanos";
    //     default:
    //       return "";
    //   }
    // }

    double alto = MediaQuery.of(context).size.height;
    double ancho = MediaQuery.of(context).size.width;
    return SizedBox(
      height: alto * 0.6,
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: PaddingTheme.horizontal,
            child: SizedBox(
              width: ancho,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(agent.agent),
                    titleTextStyle: PopUpTextStyle.mainTitle,
                  ),
                  ListTile(
                    title: Text(grupos.elementAt(agent.group - 1)),
                    titleTextStyle: PopUpTextStyle.secondTitle,
                    subtitle: Text(gruposDesc.elementAt(agent.group - 1)),
                    subtitleTextStyle: PopUpTextStyle.subtitle,
                  ),
                  ListTile(
                    title: const Text("Información:"),
                    titleTextStyle: PopUpTextStyle.secondTitle,
                    subtitle: Text(
                      agent.addInfo == null
                          ? "Sin información"
                          : agent.addInfo!,
                    ),
                    subtitleTextStyle: PopUpTextStyle.subtitle,
                  ),
                  ListTile(
                    title: const Text("Volumen de publicación:"),
                    titleTextStyle: PopUpTextStyle.secondTitle,
                    subtitle: Text(agent.volumen == null
                        ? "Sin información"
                        : agent.volumen!),
                    subtitleTextStyle: PopUpTextStyle.subtitle,
                  ),
                  ListTile(
                    title: const Text("Año de publicación:"),
                    titleTextStyle: PopUpTextStyle.secondTitle,
                    subtitle: Text(
                      agent.yearPub == null
                          ? "Sin información"
                          : agent.yearPub.toString(),
                    ),
                    subtitleTextStyle: PopUpTextStyle.subtitle,
                  ),
                  ListTile(
                    title: const Text("Año de evaluación:"),
                    titleTextStyle: PopUpTextStyle.secondTitle,
                    subtitle: Text(
                      agent.yearEv == null
                          ? "Sin información"
                          : agent.yearEv.toString(),
                    ),
                    subtitleTextStyle: PopUpTextStyle.subtitle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
