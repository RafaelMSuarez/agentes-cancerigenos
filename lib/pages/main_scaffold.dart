import 'package:flutter/material.dart';
import 'package:proyecto_ubb/pages/agents_page/agents_page.dart';
import 'package:proyecto_ubb/pages/home_page/home_page.dart';
import 'package:proyecto_ubb/pages/profile_page/profile_page.dart';
import 'package:proyecto_ubb/services/isar_service.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int selectedIdex = 0;
  PageController pageviewController = PageController();
  IsarService isar = IsarService();

  @override
  Widget build(BuildContext context) {
    // double alto = MediaQuery.of(context).size.height;
    // double ancho = MediaQuery.of(context).size.width;

    return FutureBuilder(
        future: isar.getName(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: PageView(
              controller: pageviewController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                HomePage(nombre: snapshot.data!.nombre!),
                // SearchPage(),
                const AgentsPage(),
                ProfilePage(nombre: snapshot.data!.nombre!)
              ],
            ),
            bottomNavigationBar: NavigationBar(
              selectedIndex: selectedIdex,
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: "Inicio"),
                // NavigationDestination(icon: Icon(Icons.search), label: "Buscar"),
                NavigationDestination(
                    icon: Icon(Icons.lightbulb), label: "Agentes"),
                NavigationDestination(
                    icon: Icon(Icons.person), label: "Perfil"),
              ],
              onDestinationSelected: (value) {
                setState(() {
                  selectedIdex = value;
                  pageviewController.jumpToPage(value);
                  // pageviewController.animateToPage(value,
                  //     duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                });
              },
            ),
          );
        });
  }
}
