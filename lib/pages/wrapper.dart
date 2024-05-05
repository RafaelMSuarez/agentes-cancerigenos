import 'package:flutter/material.dart';
import 'package:proyecto_ubb/pages/main_scaffold.dart';
import 'package:proyecto_ubb/pages/start_page/start_page.dart';
import 'package:proyecto_ubb/services/isar_service.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    IsarService isar = IsarService();

    return FutureBuilder(
      future: isar.getName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
              child: SizedBox(
                  height: 50, width: 50, child: CircularProgressIndicator()));
        }
        if (!snapshot.hasData) {
          return const StartPage();
        } else {
          return const MainScaffold();
        }
      },
    );
  }
}
