import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:proyecto_ubb/style/padding_style.dart';
import 'package:proyecto_ubb/style/text_styles.dart';
import 'package:proyecto_ubb/utils/string_utils.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
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
              return CircleAvatar(
                radius: alto * 0.04,
                backgroundImage: const AssetImage(
                  "assets/placeholder.png",
                ),
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
                    firstToUpperCase(product.productName),
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
          ),
        ],
      ),
    );
  }
}
