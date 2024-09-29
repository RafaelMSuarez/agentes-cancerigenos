import 'package:flutter/material.dart';
import 'package:proyecto_ubb/models/agent_model.dart';
import 'package:proyecto_ubb/style/padding_style.dart';
import 'package:proyecto_ubb/style/text_styles.dart';
import 'package:proyecto_ubb/utils/string_utils.dart';

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

    double alto = MediaQuery.of(context).size.height;
    double ancho = MediaQuery.of(context).size.width;
    return SizedBox(
      height: alto * 0.7,
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
                    textColor: DefaultTextStyle.of(context).style.color,
                  ),
                  ListTile(
                    title: Text(grupos.elementAt(agent.group - 1)),
                    titleTextStyle: PopUpTextStyle.secondTitle,
                    textColor: DefaultTextStyle.of(context).style.color,
                    subtitle: Text(gruposDesc.elementAt(agent.group - 1)),
                    subtitleTextStyle: PopUpTextStyle.subtitle,
                  ),
                  ExpansionTile(
                    textColor: DefaultTextStyle.of(context).style.color,
                    title: const Text(
                      "Evidencia Carcinogenicidad",
                      style: PopUpTextStyle.secondTitle,
                    ),
                    initiallyExpanded: true,
                    children: [
                      agent.infoAnimales == null || agent.infoAnimales!.isEmpty
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 15, right: 15, bottom: 15),
                              child: RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context)
                                      .style
                                      .merge(PopUpTextStyle.content),
                                  children: textEvidencia(agent.infoAnimales),
                                ),
                              ),
                            ),
                      agent.infoHumanos == null || agent.infoHumanos!.isEmpty
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 15, right: 15, bottom: 15),
                              child: RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context)
                                      .style
                                      .merge(PopUpTextStyle.content),
                                  children: textEvidencia(agent.infoHumanos),
                                ),
                              ),
                            ),
                    ],
                  ),
                  ExpansionTile(
                    textColor: DefaultTextStyle.of(context).style.color,
                    title: const Text(
                      "Descripción",
                      style: PopUpTextStyle.secondTitle,
                    ),
                    children: [
                      agent.descInfo == null || agent.descInfo!.isEmpty
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 15, right: 15, bottom: 15),
                              child: RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context)
                                      .style
                                      .merge(PopUpTextStyle.content),
                                  children: textEvidencia(agent.descInfo),
                                ),
                              ),
                            ),
                      agent.addInfo == null || agent.addInfo!.isEmpty
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 15),
                              child: RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context)
                                      .style
                                      .merge(PopUpTextStyle.content),
                                  children: textEvidencia(agent.addInfo),
                                ),
                              ),
                            ),
                    ],
                  ),
                  ExpansionTile(
                    textColor: DefaultTextStyle.of(context).style.color,
                    title: const Text(
                      "Publicación",
                      style: PopUpTextStyle.secondTitle,
                    ),
                    children: [
                      ListTile(
                        textColor: DefaultTextStyle.of(context).style.color,
                        title: const Text("Volumen de publicación:"),
                        titleTextStyle: PopUpTextStyle.secondTitle,
                        subtitle: Text(
                            agent.volumen == null || agent.volumen!.isEmpty
                                ? "Sin información"
                                : agent.volumen!),
                        subtitleTextStyle: PopUpTextStyle.subtitle,
                      ),
                      ListTile(
                        textColor: DefaultTextStyle.of(context).style.color,
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
                        textColor: DefaultTextStyle.of(context).style.color,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
