class Agent {
  // Id documento
  final String? id;

  // PubChem ID
  final int? pubChemId;
  // Nombre del agente
  final String agent;

  // Grupo al que pertenece

  final int group;
  // 1 -> g1
  // 2 -> g2a
  // 3 -> g2b
  // 4 -> g3

  // Volumen en el que sale
  final String? volumen;

  // Año de publicación
  final int? yearPub;

  // Año de evaluación
  final int? yearEv;

  /// Descripción del agente
  final String? descInfo;

  /// Información sobre evidencia de carcinogenicidad en humanos
  final String? infoHumanos;

  /// Información sobre evidencia de carcinogenicidad en animales
  final String? infoAnimales;

  /// Información adicional
  final String? addInfo;

  /// Palabras claves utilizadas para relacionar con OpenFoodFacts
  final String? tags;

  Agent({
    this.pubChemId,
    this.id,
    required this.agent,
    required this.group,
    this.volumen,
    this.yearPub,
    this.yearEv,
    this.descInfo,
    this.infoHumanos,
    this.infoAnimales,
    this.addInfo,
    this.tags,
  });
}
