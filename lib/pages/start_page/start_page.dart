import 'package:flutter/material.dart';
import 'package:proyecto_ubb/pages/main_scaffold.dart';
import 'package:proyecto_ubb/services/isar_service.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  String nombre = "";
  IsarService isar = IsarService();

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    double ancho = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: () {
            setState(() {
              Form.of(primaryFocus!.context!).save();
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 50),
                      child: Text(
                        "Bienvenido a la aplicación",
                        style: TitleTheme.mainTitle,
                      ),
                    ),
                    const Text(
                      "Ingrese su nombre",
                      style: TitleTheme.secondTitle,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ancho * 0.1, vertical: alto * 0.05),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Nombre",
                          contentPadding: EdgeInsets.zero,
                        ),
                        textCapitalization: TextCapitalization.words,
                        onSaved: (newValue) {
                          if (newValue != null) {
                            nombre = newValue;
                          }
                        },
                        validator: (value) {
                          return (value != null && value.isNotEmpty)
                              ? null
                              : "Debe ingresar un nombre";
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: alto * 0.01),
                child: TextButton(
                  onPressed: nombre.isEmpty
                      ? null
                      : () async {
                          await isar.setName(nombre).then(
                                (e) => Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 500),
                                    transitionsBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child) {
                                      return SlideTransition(
                                        position: Tween<Offset>(
                                          begin: const Offset(1.0, 0.0),
                                          end: Offset.zero,
                                        ).animate(animation),
                                        child: child,
                                      );
                                    },
                                    pageBuilder: (_, __, ___) =>
                                        const MainScaffold(),
                                  ),
                                ),
                              );
                        },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Continuar",
                      style: TitleTheme.secondTitle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
