import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:proyecto_ubb/style/padding_style.dart';
import 'package:proyecto_ubb/style/text_styles.dart';
import 'package:proyecto_ubb/utils/nutriscore_utils.dart';

class ProductPage extends StatefulWidget {
  final Product product;
  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String categorias() {
    if (widget.product.categories == null) {
      return "Sin categorias";
    }
    List<String> cats = widget.product.categories!.split(",");
    List<String> catsEsp = [];
    for (String cat in cats) {
      if (!cat.trim().startsWith("en:")) {
        catsEsp.add(cat);
      }
    }
    return catsEsp.join(", ");
  }

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.sizeOf(context).height;
    double ancho = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingTheme.horizontal,
          child: Column(
            children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.onSurface,
                            width: 3),
                      ),
                      clipBehavior: Clip.hardEdge,
                      height: alto * 0.2,
                      child: GestureDetector(
                        child: Hero(
                          tag: "${widget.product.barcode}",
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: widget.product.imageFrontUrl ?? "",
                            progressIndicatorBuilder: (context, url, dProg) =>
                                Center(
                              child: SizedBox(
                                height: 40,
                                width: 40,
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
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                            opaque: false,
                            barrierDismissible: true,
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return GestureDetector(
                                child: Container(
                                  color: Colors.black87,
                                  alignment: Alignment.center,
                                  child: Hero(
                                    tag: "${widget.product.barcode}",
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                        width: 5,
                                      )),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.contain,
                                        imageUrl:
                                            widget.product.imageFrontUrl ?? "",
                                        imageBuilder: (context, imageProvider) {
                                          return PhotoView(
                                            imageProvider: imageProvider,
                                            minScale: PhotoViewComputedScale
                                                .contained,
                                            maxScale: PhotoViewComputedScale
                                                .contained,
                                          );
                                        },
                                        progressIndicatorBuilder:
                                            (context, url, dProg) => Center(
                                          child: SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: CircularProgressIndicator(
                                              value: dProg.progress,
                                            ),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) {
                                          return const Image(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "assets/placeholder.png"),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                              );
                            },
                          ));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ancho * 0.1,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.productName ?? "",
                          style: TitleTextStyle.mainTitle,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: "Cantidad neta: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: "${widget.product.quantity}")
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Image.asset(
                            fit: BoxFit.contain,
                            width: ancho * 0.3,
                            getNutriScoreImage(
                                widget.product.nutriscore ?? "not"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Divider(
                height: 15,
              ),
              ExpansionTile(
                title: const Text("Categorías"),
                childrenPadding: PaddingTheme.horizontal.copyWith(bottom: 15),
                expandedAlignment: Alignment.centerLeft,
                children: [
                  Text(categorias()),
                ],
              ),
              ExpansionTile(
                childrenPadding: PaddingTheme.horizontal.copyWith(bottom: 15),
                expandedAlignment: Alignment.centerLeft,
                title: const Text("Carcinogenicos"),
              ),
              ExpansionTile(
                title: const Text("Ingredientes"),
                childrenPadding: PaddingTheme.horizontal.copyWith(bottom: 15),
                expandedAlignment: Alignment.centerLeft,
                children: [
                  Text(
                      "${widget.product.ingredientsTextInLanguages![OpenFoodFactsLanguage.SPANISH]}")
                ],
              ),
              const ExpansionTile(
                title: Text("Información Nutricional"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
