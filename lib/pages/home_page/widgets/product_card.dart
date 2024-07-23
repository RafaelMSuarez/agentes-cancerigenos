import 'package:flutter/material.dart';
import 'package:proyecto_ubb/models/product_model.dart';
import 'package:proyecto_ubb/style/padding_style.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    // double ancho = MediaQuery.of(context).size.width;

    String elementos() {
      if (product.agents == null || product.agents!.isEmpty) {
        return "0 Elementos encontrados";
      }

      if (product.agents!.length > 1) {
        return "${product.agents!.length} Elementos encontrados";
      }
      return "1 Elemento encontrado";
    }

    return SizedBox(
      height: alto * 0.12,
      child: Row(
        children: [
          CircleAvatar(
            radius: alto * 0.04,
            backgroundImage: product.imgSource == null
                ? null
                : AssetImage(product.imgSource!),
          ),
          Expanded(
            child: Padding(
              padding: PaddingTheme.all,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.name,
                    style: CardTextStyle.mainTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      elementos(),
                      style: CardTextStyle.secondTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
