import 'package:flutter/material.dart';

class CustomCpi extends StatefulWidget {
  final String mensaje;
  const CustomCpi({super.key, required this.mensaje});

  @override
  State<CustomCpi> createState() => _CustomCpiState();
}

class _CustomCpiState extends State<CustomCpi> {
  final List<String> _mensajes = [
    "",
    "Estamos teniendo dificultad para encontrar tu producto",
    "OpenFoodFacts es un servicio gratuito",
    "Esta aplicación tambien lo és",
    "Todos aportamos nuestro granito :)",
  ];

  int _currentIndex = 0;
  bool _active = true;

  @override
  void initState() {
    _mensajes[0] = widget.mensaje;
    Future.delayed(
      const Duration(seconds: 3),
      () {
        _rotateMensaje();
      },
    );

    super.initState();
  }

  void _rotateMensaje() async {
    while (true) {
      await Future.delayed(
        const Duration(seconds: 5),
        () {
          if (_active) {
            setState(() {
              _currentIndex = (_currentIndex + 1) % _mensajes.length;
            });
          }
        },
      );
    }
  }

  @override
  void dispose() {
    _active = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(
          height: 25,
        ),
        Text(
          _mensajes[_currentIndex],
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
