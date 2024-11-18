import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/text_styles.dart';
import 'package:proyecto_ubb/utils/url_utils.dart';

class OrigenInformacionPopUp extends StatelessWidget {
  const OrigenInformacionPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    return SizedBox(
      height: alto * 0.7,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          ListTile(
            title: const Text("¿De dónde proviene la información?"),
            titleTextStyle: PopUpTextStyle.mainTitle,
            textColor: DefaultTextStyle.of(context).style.color,
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Toda la información sobre agentes carcinogénicos proviene principalmente de las \"Monografías en la Identificiación de Peligros Carcinogénicos en Humanos de IARC\"",
              style: PopUpTextStyle.content,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "También su utilizaron otros sitios para brindar una traducción correcta y ampliar la información en las descripciones de los agentes.",
              style: PopUpTextStyle.content,
            ),
          ),
          const ListTile(
            title: Text(
              "Links de sitios importantes",
              style: PopUpTextStyle.secondTitle,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.public,
            ),
            trailing: const Icon(Icons.arrow_forward),
            title: const Text(
              "Publicaciones IARC",
              style: PopUpTextStyle.content,
            ),
            onTap: () {
              urlDialog(
                  context,
                  Uri.parse(
                      "https://publications.iarc.who.int/Book-And-Report-Series/Iarc-Monographs-On-The-Identification-Of-Carcinogenic-Hazards-To-Humans"));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.public,
            ),
            trailing: const Icon(Icons.arrow_forward),
            title: const Text(
              "Instituto Nacional del Cáncer (EEUU)",
              style: PopUpTextStyle.content,
            ),
            onTap: () {
              urlDialog(
                  context,
                  Uri.parse(
                      "https://www.cancer.gov/espanol/cancer/naturaleza/que-es"));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.public,
            ),
            trailing: const Icon(Icons.arrow_forward),
            title: const Text(
              "Organización Mundial de la Salud",
              style: PopUpTextStyle.content,
            ),
            onTap: () {
              urlDialog(
                  context,
                  Uri.parse(
                      "https://www.who.int/es/news-room/fact-sheets/detail/cancer"));
            },
          ),
        ],
      ),
    );
  }
}
