import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/text_styles.dart';
import 'package:proyecto_ubb/utils/string_utils.dart';
import 'package:proyecto_ubb/utils/url_utils.dart';

class FiabilidadPopUp extends StatelessWidget {
  const FiabilidadPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    return SizedBox(
      height: alto * 0.5,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          ListTile(
            title: const Text("¿Qué tan fiable es la información?"),
            titleTextStyle: PopUpTextStyle.mainTitle,
            textColor: DefaultTextStyle.of(context).style.color,
          ),
          ListTile(
            leading: const Icon(
              Icons.circle,
              size: 12,
            ),
            title: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context)
                    .style
                    .merge(PopUpTextStyle.content),
                children: textEvidencia(
                    "*OpenFoodFacts* permite la edición libre de la información, mientras se posea una cuenta."),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.circle,
              size: 12,
            ),
            title: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context)
                    .style
                    .merge(PopUpTextStyle.content),
                children: textEvidencia(
                    "Si bien existen varias cuentas que suben información correcta, pueden haber *errores* en la información entregada."),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.circle,
              size: 12,
            ),
            title: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context)
                    .style
                    .merge(PopUpTextStyle.content),
                children: textEvidencia(
                    "En general, la información de cada alimento es bastante acertada, pero aún así, existen casos donde la información puede estar incompleta o desactualizada."),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
