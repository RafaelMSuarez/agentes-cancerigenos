import 'package:flutter/material.dart';
import 'package:proyecto_ubb/pages/main_scaffold.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScaffold(),
      debugShowCheckedModeBanner: false,
    );
  }
}
