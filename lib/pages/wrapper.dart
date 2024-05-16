import 'package:flutter/material.dart';
import 'package:proyecto_ubb/models/user_model.dart';
import 'package:proyecto_ubb/pages/main_scaffold.dart';
import 'package:proyecto_ubb/pages/start_page/start_page.dart';
import 'package:proyecto_ubb/services/isar_service.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  IsarService isar = IsarService();
  Future<User?>? user;

  @override
  void initState() {
    user = isar.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: user,
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
