import 'dart:async';
import 'dart:math';

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
  final _scrollBarController = ScrollController();

  int cat = 0;
  List<String> catDesc = [
    "Mostrando todos los agentes",
    "Carcinogénico para humanos",
    "Probable carcinogénico para humanos",
    "Posible carcinogénico para humanos",
    "No es carcinogénico para humanos"
  ];

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

  final _textSearchController = TextEditingController();
  StreamController<List<Agent>> streamController =
      StreamController<List<Agent>>.broadcast();

  void _filter(List<Agent> listaAgents, String query) {
    streamController.add(listaAgents
        .where(
          (element) =>
              element.agent.toLowerCase().contains(query.toLowerCase()),
        )
        .toList());
  }

  @override
  void dispose() {
    _textSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double alto = MediaQuery.of(context).size.height;
    double ancho = MediaQuery.of(context).size.width;
    return StreamBuilder<List<Agent>>(
        stream: _firebaseService.agentsStream,
        builder: (context, snapshot) {
          return Padding(
            padding: PaddingTheme.allPage,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _textSearchController,
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
                          color: Theme.of(context).colorScheme.primary,
                          width: 2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    _filter(snapshot.data ?? [], value);
                  },
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
                    style: const TextStyle(
                        fontStyle: FontStyle.italic, fontSize: 16),
                  ),
                ),
                snapshot.data == null || snapshot.data!.isEmpty
                    ? const Expanded(
                        child: Center(
                          child:
                              Text("Presione el botón para agregar un agente!"),
                        ),
                      )
                    : Expanded(
                        child: Material(
                          child: Scrollbar(
                            controller: _scrollBarController,
                            child: StreamBuilder<List<Agent>>(
                                key: Key("${Random().nextDouble()}"),
                                stream: streamController.stream,
                                initialData: snapshot.data,
                                builder: (context, snapshotFilter) {
                                  if (snapshot.connectionState !=
                                      ConnectionState.active) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  if (!snapshotFilter.hasData) {
                                    return const Center(
                                      child: Text("No hay elementos"),
                                    );
                                  }
                                  if (snapshotFilter.data == null ||
                                      snapshotFilter.data!.isEmpty) {
                                    return const Center(
                                      child: Text("No hay elementos"),
                                    );
                                  }
                                  return ListView.separated(
                                    key: Key("${Random().nextDouble()}"),
                                    controller: _scrollBarController,
                                    itemCount:
                                        agentSort(snapshotFilter.data ?? [])
                                            .length,
                                    padding: PaddingTheme.vertical,
                                    separatorBuilder: (context, index) {
                                      return const Divider();
                                    },
                                    itemBuilder: (context, index) {
                                      Agent agente = agentSort(
                                          snapshotFilter.data!)[index];
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
        });
  }
}
