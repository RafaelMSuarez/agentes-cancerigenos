import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:proyecto_ubb/style/padding_style.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    // double ancho = MediaQuery.of(context).size.width;

    // String elementos() {
    //   if (product.agents == null || product.agents!.isEmpty) {
    //     return "0 Elementos encontrados";
    //   }

    //   if (product.agents!.length > 1) {
    //     return "${product.agents!.length} Elementos encontrados";
    //   }
    //   return "1 Elemento encontrado";
    // }

    return SizedBox(
      height: alto * 0.12,
      child: Row(
        children: [
          CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: product.imageFrontUrl ?? "",
            progressIndicatorBuilder: (context, url, dProg) => CircleAvatar(
              radius: alto * 0.04,
              child: Center(
                child: CircularProgressIndicator(
                  value: dProg.progress,
                ),
              ),
            ),
            errorWidget: (context, url, error) {
              return const Image(
                fit: BoxFit.cover,
                image: AssetImage("assets/placeholder.png"),
              );
            },
            imageBuilder: (context, imageProvider) {
              return CircleAvatar(
                radius: alto * 0.04,
                backgroundImage: imageProvider,
              );
            },
          ),
          Expanded(
            child: Padding(
              padding: PaddingTheme.all,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.productName ?? "",
                    style: CardTextStyle.mainTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "Neto: ${product.quantity}",
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
