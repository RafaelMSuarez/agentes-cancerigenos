import "package:cloud_firestore/cloud_firestore.dart";
import "package:proyecto_ubb/models/agent_model.dart";

class FirebaseService {
  static final CollectionReference coleccionAgentes =
      FirebaseFirestore.instance.collection("agentes");

  static final CollectionReference coleccionBarcodes =
      FirebaseFirestore.instance.collection("barcodes");

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

  Future<void> addBarcode(Barcode barcode) async {
    if (barcode.barcode.isEmpty) {
      return;
    }
    return await coleccionBarcodes.doc(barcode.id).set({
      "barcode": barcode.barcode,
      "nombre": barcode.nombre,
    });
  }

  Future<void> deleteBarcode(Barcode barcode) async {
    return await coleccionBarcodes.doc(barcode.id).delete();
  }

  List<Barcode> _barcodeSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map(
      (doc) {
        return Barcode(
          id: doc.id,
          barcode: doc.get("barcode"),
          nombre: doc.get("nombre"),
        );
      },
    ).toList();
  }

  Stream<List<Barcode>> get barcodeStream {
    return coleccionBarcodes.snapshots().map(_barcodeSnapshot);
  }
}
