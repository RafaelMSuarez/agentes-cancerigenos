import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/text_styles.dart';
import 'package:proyecto_ubb/utils/string_utils.dart';
import 'package:proyecto_ubb/utils/url_utils.dart';

class QueEsIARCPopUp extends StatelessWidget {
  const QueEsIARCPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    return SizedBox(
      height: alto * 0.65,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          ListTile(
            title: const Text("¿Qué es IARC?"),
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
                    "La *Agencia Internacional de Investigaciones sobre el Cáncer* (*IARC* por sus siglas en inglés: International Agency for Research on Cancer) es un órgano intergubernamental que forma parte de la *Organización Mundial de la Salud* (OMS) de las *Naciones Unidas*"),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
                "Su rol principal es conducir y coordinar las investigaciones en relación a las causas del cáncer."),
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
                "Es la organización encargada de clasificar y estipular los agentes carcinogénicos en cuatro grupos, según su nivel de carcinogenicidad."),
          ),
          const Divider(
            endIndent: 15,
            indent: 15,
          ),
          ListTile(
            leading: const Icon(
              Icons.public,
            ),
            trailing: const Icon(Icons.arrow_forward),
            title: const Text("Link de IARC"),
            onTap: () {
              urlDialog(context, Uri.parse("https://www.iarc.who.int/"));
            },
          ),
        ],
      ),
    );
  }
}
