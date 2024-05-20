class Agent {
  // Id para unir con producto
  final int id;
  // Nombre del agente
  final String agent;

  // Grupo al que pertenece

  final int group;
  // 1 -> g1
  // 2 -> g2a
  // 3 -> g2b// 1 -> g1
  // 2 -> g2a
  // 3 -> g2b
  // 4 -> g3

  // Volumen en el que sale
  final String? volumen;

  // Año de publicación
  final int? yearPub;

  // Año de evaluación
  final int? yearEv;

  // Información adicional
  final String? addInfo;

  Agent(
      {required this.id,
      required this.agent,
      required this.group,
      this.volumen,
      this.yearPub,
      this.yearEv,
      this.addInfo});
}

class AgentApi {
  static List<Agent> agents = [
    Agent(
        id: 0,
        agent: "Carnes rojas",
        group: 2,
        volumen: "114",
        yearPub: 2018,
        yearEv: 2015,
        addInfo: "Se considera su consumo en altas temperaturas."),
    Agent(
        id: 1,
        agent: "Carnes procesadas",
        group: 1,
        volumen: "114",
        yearPub: 2018,
        yearEv: 2015,
        addInfo: "Por su nivel de nitratos y nitritos."),
    Agent(id: 2, agent: "Cafeína", group: 4)
  ];

  List<Agent> get getAgents => agents;

  Agent getAgentById(int id) {
    return agents.where((element) => element.id == id).first;
  }
}