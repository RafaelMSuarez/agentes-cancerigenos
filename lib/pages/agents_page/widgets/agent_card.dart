import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class AgentCard extends StatelessWidget {
  final String titulo;
  final String? informacionAdicional;
  const AgentCard({super.key, required this.titulo, this.informacionAdicional});

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    // double ancho = MediaQuery.of(context).size.width;

    return SizedBox(
      height: alto * 0.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(titulo, style: CardTextStyle.mainTitle),
          informacionAdicional == null
              ? const SizedBox()
              : Text(informacionAdicional!, style: CardTextStyle.secondTitle,),
        ],
      ),
    );
  }
}
