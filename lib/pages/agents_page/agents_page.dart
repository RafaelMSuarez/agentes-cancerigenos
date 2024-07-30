import 'package:flutter/material.dart';
import 'package:proyecto_ubb/models/agent_model.dart';
import 'package:proyecto_ubb/pages/agents_page/widgets/agent_card.dart';
import 'package:proyecto_ubb/pages/agents_page/widgets/agent_popup.dart';
import 'package:proyecto_ubb/services/firebase_service.dart';
import 'package:proyecto_ubb/style/padding_style.dart';

class AgentsPage extends StatefulWidget {
  const AgentsPage({super.key});

  @override
  State<AgentsPage> createState() => _AgentsPageState();
}

class _AgentsPageState extends State<AgentsPage> {
  final FirebaseService _firebaseService = FirebaseService();

  int cat = 0;
  List<String> catDesc = [
    "Mostrando todos los agentes",
    "Carcinogénico para humanos",
    "Probable carcinogénico para humanos",
    "Posible carcinogénico para humanos",
    "No es carcinogénico para humanos"
  ];

  AgentApi agentApi = AgentApi();
  // List<Agent> agents = [];

  @override
  void initState() {
    // agents = agentApi.getAgents;
    super.initState();
  }

  List<Agent> agentSort(List<Agent> agents) {
    switch (cat) {
      case 1:
        return agents.where((element) => element.group == 1).toList();
      case 2:
        return agents.where((element) => element.group == 2).toList();
      case 3:
        return agents.where((element) => element.group == 3).toList();
      case 4:
        return agents.where((element) => element.group == 4).toList();
      default:
        return agents;
    }
  }

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    double ancho = MediaQuery.of(context).size.width;
    return Padding(
      padding: PaddingTheme.allPage,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              filled: true,
              labelText: "Buscar agente",
              prefixIcon: const Icon(Icons.search),
              contentPadding: EdgeInsets.zero,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary, width: 2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
          ),
          Padding(
            padding: PaddingTheme.vertical,
            child: SizedBox(
              width: ancho,
              child: SegmentedButton(
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
              style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
            ),
          ),
          SizedBox(
            height: alto * 0.02,
          ),
          Expanded(
            child: Material(
              child: Scrollbar(
                child: StreamBuilder<List<Agent>>(
                    stream: _firebaseService.agentsStream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.active) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.separated(
                        itemCount: agentSort(snapshot.data!).length,
                        padding: const EdgeInsets.only(
                            bottom: PaddingTheme.paddingDoubleVertical),
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemBuilder: (context, index) {
                          Agent agente = agentSort(snapshot.data!)[index];
                          return InkWell(
                            child: AgentCard(agent: agente),
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                showDragHandle: true,
                                builder: (context) {
                                  return AgentPopUp(
                                    agent: agente,
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
