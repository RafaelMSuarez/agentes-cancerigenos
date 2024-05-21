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
      addInfo: "Se considera su consumo en altas temperaturas.",
    ),
    Agent(
      id: 1,
      agent: "Carnes procesadas",
      group: 1,
      volumen: "114",
      yearPub: 2018,
      yearEv: 2015,
      addInfo: "Por su nivel de nitratos y nitritos.",
    ),
    Agent(
      id: 2,
      agent: "Cafeína",
      group: 4,
      volumen: "51",
      yearPub: 1991,
      yearEv: 1990,
    ),
    Agent(
      id: 3,
      agent: "Bebida alcoholica",
      group: 1,
      volumen: "44, 96, 100E",
      yearPub: 2018,
      yearEv: 2016,
    ),
    Agent(
      id: 4,
      agent: "Bebida muy caliente",
      group: 2,
      volumen: "116",
      yearPub: 2018,
      yearEv: 2016,
      addInfo:
          "Se consideran como bebidas muy calientes aquellas que se beben mientras la temperatura se mantiene arriba de los 65°C. Es decir, beber la bebida mientras esta aún se encuentra cercana a hervir.",
    ),
    Agent(
      id: 5,
      agent: "Aspartamo",
      group: 3,
      volumen: "134",
      yearPub: 2024,
      yearEv: 2023,
      addInfo: "Edulcorante permitido en Chile.",
    ),
    Agent(
      id: 6,
      agent: "Dioxido de titanio",
      group: 3,
      volumen: "47, 93",
      yearPub: 2010,
      yearEv: 2006,
      addInfo:
          "Sustancia colorante permitida en Chile. Se encuentra prohíbido su uso en alimentos por la Unión Europea",
    ),
  ];

  List<Agent> get getAgents => agents;

  Agent getAgentById(int id) {
    return agents.where((element) => element.id == id).first;
  }
}
