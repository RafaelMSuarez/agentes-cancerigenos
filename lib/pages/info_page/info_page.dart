import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    double alto = MediaQuery.of(context).size.height;
    double ancho = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: PaddingTheme.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const ExpansionTile(
                  expandedAlignment: Alignment.centerLeft,
                  childrenPadding: PaddingTheme.all,
                  title: Text("¿Qué es un agente carcinogénico?"),
                  children: <Text>[
                    Text("Descripción según IARC"),
                  ],
                ),
                const ExpansionTile(
                  title: Text("Elementos de descripción:"),
                  expandedAlignment: Alignment.centerLeft,
                  childrenPadding: PaddingTheme.all,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Volumen de publicación: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                "Número de volumen publicado por IARC donde se describe el agente.",
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: PaddingTheme.vertical,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Año de publicación: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                                  "Año de último volumen publicado por IARC donde se describe el agente.",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Año de evaluación: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                "Año en que el equipo de evaluación de IARC evaluó el agente.",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(),
                const Padding(
                  padding: PaddingTheme.vertical,
                  child: Text(
                    "Clasificación según IARC",
                    style: TitleTextStyle.mainTitle,
                  ),
                ),
                const ExpansionTile(
                  title: Text("Grupo 1"),
                  subtitle: Text("Carcinogénico para humanos"),
                  expandedAlignment: Alignment.centerLeft,
                  childrenPadding: PaddingTheme.all,
                  children: <Widget>[
                    Text(
                      "Información sobre este grupo",
                    ),
                  ],
                ),
                const ExpansionTile(
                  title: Text("Grupo 2A"),
                  subtitle: Text("Probablemente carcinogénico para humanos"),
                  expandedAlignment: Alignment.centerLeft,
                  childrenPadding: PaddingTheme.all,
                  children: <Widget>[
                    Text(
                      "Información sobre este grupo",
                    ),
                  ],
                ),
                const ExpansionTile(
                  title: Text("Grupo 2B"),
                  subtitle: Text("Posiblemente carcinogénico para humanos"),
                  expandedAlignment: Alignment.centerLeft,
                  childrenPadding: PaddingTheme.all,
                  children: <Widget>[
                    Text(
                      "Información sobre este grupo",
                    ),
                  ],
                ),
                const ExpansionTile(
                  title: Text("Grupo 3"),
                  subtitle: Text("No es carcinogénico para humanos"),
                  expandedAlignment: Alignment.centerLeft,
                  childrenPadding: PaddingTheme.all,
                  children: <Widget>[
                    Text(
                      "Información sobre este grupo",
                    ),
                  ],
                ),
                const Divider(
                  height: PaddingTheme.paddingDoubleVertical,
                ),
                const Padding(
                  padding: PaddingTheme.vertical,
                  child: Text(
                    "Links de referencia",
                    style: TitleTextStyle.secondTitle,
                  ),
                ),
                ListTile(
                  title: const Text("Link 1"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Link 2"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Link 3"),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Link 4"),
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
