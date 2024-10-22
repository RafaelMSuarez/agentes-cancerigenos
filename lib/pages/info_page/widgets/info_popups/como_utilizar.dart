import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class ComoUtilizarPopUp extends StatelessWidget {
  const ComoUtilizarPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    return SizedBox(
      height: alto * 0.6,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          ListTile(
            title: const Text("¿Como utilizar esta aplicación?"),
            titleTextStyle: PopUpTextStyle.mainTitle,
            textColor: DefaultTextStyle.of(context).style.color,
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Haz clic en el icono de cámara: utiliza tu cámara para escanear un código de barras y encontrar un producto!",
              style: PopUpTextStyle.content,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "También puedes utilizar la barra de busqueda para ver una lista de resultados.",
              style: PopUpTextStyle.content,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Una vez encuentres un producto haz clic en él y ve su información.",
              style: PopUpTextStyle.content,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Si el producto posee agentes carcinogénicos puedes hacer clic en uno y ver su información.",
              style: PopUpTextStyle.content,
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.circle,
              size: 12,
            ),
            title: Text(
              "Puedes ver la fuente de información de cada agente, lo que te llevará directamente a la publicación.",
              style: PopUpTextStyle.content,
            ),
          ),
        ],
      ),
    );
  }
}
