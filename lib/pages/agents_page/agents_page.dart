import 'package:flutter/material.dart';
import 'package:proyecto_ubb/pages/agents_page/widgets/agent_card.dart';
import 'package:proyecto_ubb/pages/agents_page/widgets/agent_popup.dart';
import 'package:proyecto_ubb/style/padding_style.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class AgentsPage extends StatefulWidget {
  const AgentsPage({super.key});

  @override
  State<AgentsPage> createState() => _AgentsPageState();
}

class _AgentsPageState extends State<AgentsPage> {
  int cat = 0;
  List<String> catDesc = [
    "Mostrando todos los agentes",
    "Carcinogénico para humanos",
    "Probable carcinogénico para humanos",
    "Posible carcinogénico para humanos",
    "No es carcinogénico para humanos"
  ];

  @override
  Widget build(BuildContext context) {
    // double alto = MediaQuery.of(context).size.height;
    double ancho = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
            top: PaddingTheme.paddingDoubleVertical,
            left: PaddingTheme.paddingDoubleHorizontal,
            right: PaddingTheme.paddingDoubleHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                  vertical: PaddingTheme.paddingDoubleVertical),
              child: Text(
                "Categorías Agente Carcinógenos",
                style: TitleTextStyle.secondTitle,
              ),
            ),
            Padding(
              padding: PaddingTheme.vertical,
              child: SizedBox(
                width: ancho,
                child: SegmentedButton(
                  style: SegmentedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  segments: const <ButtonSegment<int>>[
                    ButtonSegment(value: 1, label: Text("Grupo 1")),
                    ButtonSegment(value: 2, label: Text("Grupo 2A")),
                    ButtonSegment(value: 3, label: Text("Grupo 2B")),
                    ButtonSegment(value: 4, label: Text("Grupo 3")),
                  ],
                  selected: <int>{cat},
                  showSelectedIcon: false,
                  emptySelectionAllowed: true,
                  onSelectionChanged: (set) {
                    setState(() {
                      cat = set.isEmpty ? 0 : set.first;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: PaddingTheme.paddingDoubleVertical),
              child: Text(
                catDesc[cat],
                style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            const Padding(
              padding: PaddingTheme.vertical,
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Buscar agente",
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Material(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: AgentCard(
                        titulo: "Agente: $index",
                        informacionAdicional:
                            index == 5 ? "informacion adicional" : null,
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          showDragHandle: true,
                          builder: (context) {
                            return const AgentPopUp();
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
