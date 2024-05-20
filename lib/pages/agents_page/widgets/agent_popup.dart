import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto_ubb/models/agent_model.dart';
import 'package:proyecto_ubb/style/padding_style.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class AgentPopUp extends StatelessWidget {
  final Agent agent;
  const AgentPopUp({super.key, required this.agent});

  @override
  Widget build(BuildContext context) {
    String getGroup() {
      switch (agent.group) {
        case 1:
          return "1";
        case 2:
          return "2A";
        case 3:
          return "2B";
        case 4:
          return "3";
        default:
          return "";
      }
    }

    double alto = MediaQuery.of(context).size.height;
    double ancho = MediaQuery.of(context).size.width;
    return SizedBox(
      height: alto * 0.6,
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: PaddingTheme.all,
            child: SizedBox(
              width: ancho,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      agent.agent,
                      style: PopUpTextStyle.mainTitle,
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Grupo:",
                      style: PopUpTextStyle.secondTitle,
                    ),
                    subtitle: Text(getGroup()),
                  ),
                  ListTile(
                    title: const Text(
                      "Volumen de publicación:",
                      style: PopUpTextStyle.secondTitle,
                    ),
                    subtitle: Text(
                      agent.volumen == null
                          ? "Sin información"
                          : agent.volumen!,
                      style: PopUpTextStyle.subtitle,
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Año de publicación:",
                      style: PopUpTextStyle.secondTitle,
                    ),
                    subtitle: Text(
                      agent.yearPub == null
                          ? "Sin información"
                          : agent.yearPub.toString(),
                      style: PopUpTextStyle.subtitle,
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Año de evaluación:",
                      style: PopUpTextStyle.secondTitle,
                    ),
                    subtitle: Text(
                      agent.yearEv == null
                          ? "Sin información"
                          : agent.yearEv.toString(),
                      style: PopUpTextStyle.subtitle,
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      "Información adicional:",
                      style: PopUpTextStyle.secondTitle,
                    ),
                    subtitle: Text(
                      agent.addInfo == null
                          ? "Sin información"
                          : agent.addInfo!,
                      style: PopUpTextStyle.subtitle,
                    ),
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
