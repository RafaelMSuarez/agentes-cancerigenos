import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proyecto_ubb/models/agent_model.dart';
import 'package:proyecto_ubb/services/firebase_service.dart';

class BarcodesMissingPage extends StatefulWidget {
  const BarcodesMissingPage({super.key});

  @override
  State<BarcodesMissingPage> createState() => _BarcodesMissingPageState();
}

class _BarcodesMissingPageState extends State<BarcodesMissingPage> {
  final _firebaseService = FirebaseService();

  Future<void> deleteBarcode(Barcode barcode) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("¿Eliminar código?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancelar"),
            ),
            FilledButton(
              onPressed: () async {
                await _firebaseService.deleteBarcode(barcode);
                if (!context.mounted) return;
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Código eliminado"),
                  ),
                );
              },
              child: const Text("Aceptar"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<List<Barcode>>(
          stream: _firebaseService.barcodeStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.active) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data == null ||
                !snapshot.hasData ||
                snapshot.data!.isEmpty) {
              return const Center(
                child: Text("Sin códigos de barra que agregar"),
              );
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].barcode),
                  subtitle: Text(snapshot.data![index].nombre ?? "Por agregar"),
                  trailing: const Icon(Icons.delete),
                  onTap: () async {
                    await Clipboard.setData(
                      ClipboardData(text: snapshot.data![index].barcode),
                    ).then(
                      (value) {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Código copiado")));
                      },
                    );
                  },
                  onLongPress: () async {
                    await deleteBarcode(snapshot.data![index]);
                  },
                );
              },
            );
          }),
    );
  }
}
