import "package:cloud_firestore/cloud_firestore.dart";
import "package:proyecto_ubb/models/agent_model.dart";

class FirebaseService {
  static final CollectionReference coleccionAgentes =
      FirebaseFirestore.instance.collection("agentes");

  List<Agent> _agentSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Agent(
        id: doc.id,
        pubChemId: doc.get("pubChemId"),
        agent: doc.get("agent"),
        volumen: doc.get("volumen"),
        group: doc.get("group"),
        yearPub: doc.get("yearPub"),
        yearEv: doc.get("yearEv"),
        descInfo: doc.get("descInfo"),
        infoAnimales: doc.get("infoAnimales"),
        infoHumanos: doc.get("infoHumanos"),
        addInfo: doc.get("addInfo"),
        tags: doc.get("tags"),
      );
    }).toList();
  }

  Stream<List<Agent>> get agentsStream {
    return coleccionAgentes.orderBy("agent").snapshots().map(_agentSnapshot);
  }
}
