import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class ProductCard extends StatelessWidget {
  final String nombre;
  const ProductCard({super.key, required this.nombre});

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    double ancho = MediaQuery.of(context).size.width;

    return SizedBox(
      height: alto * 0.12,
      child: Row(
        children: [
          CircleAvatar(
            radius: alto * 0.04,
            backgroundColor: Colors.red[100],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Producto: $nombre",
                  style: CardTextStyle.mainTitle,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "0 Elementos Encontrados",
                    style: CardTextStyle.secondTitle,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
