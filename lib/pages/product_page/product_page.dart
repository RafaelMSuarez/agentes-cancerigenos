import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:proyecto_ubb/models/agent_model.dart';
import 'package:proyecto_ubb/pages/agents_page/widgets/agent_popup.dart';
import 'package:proyecto_ubb/pages/product_page/widgets/agents_in_product_card.dart';
import 'package:proyecto_ubb/services/firebase_service.dart';
import 'package:proyecto_ubb/style/padding_style.dart';
import 'package:proyecto_ubb/style/text_styles.dart';
import 'package:proyecto_ubb/utils/nutriments_utils.dart';
import 'package:proyecto_ubb/utils/nutriscore_utils.dart';
import 'package:proyecto_ubb/utils/string_utils.dart';

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

  List<Agent> agentes = [];

  List<Agent> getAgentes(List<Agent> ags) {
    List<String> cats = [];
    List<String> adds = [];
    List<String> ingr = [];

    List<Agent> agents = [];
    if (widget.product.categoriesTags != null) {
      cats = widget.product.categoriesTags!;
    }
    if (widget.product.additives != null) {
      adds = widget.product.additives!.names;
    }

    // if (widget.product
    //         .ingredientsTextInLanguages![OpenFoodFactsLanguage.SPANISH] !=
    //     null) {
    //   ingr = widget
    //       .product.ingredientsTextInLanguages![OpenFoodFactsLanguage.SPANISH]!
    //       .toLowerCase()
    //       .trim()
    //       .split(",");
    // }

    if (widget.product.ingredientsTags != null) {
      ingr = widget.product.ingredientsTags!;
    }
    for (int i = 0; i < ingr.length; i++) {
      ingr[i] = ingr[i].replaceFirst('en:', "").trim();
    }
    print(ingr);

    for (int i = 0; i < cats.length; i++) {
      cats[i] = cats[i].replaceFirst('en:', "").trim();
    }

    for (Agent ag in ags) {
      if (ag.tags != null) {
        List<String> tags = ag.tags!.split(",");

        for (String tag in tags) {
          if (cats.contains(tag.toLowerCase().trim())) {
            agents.add(ag);
          }
          if (adds.contains(tag.toLowerCase().trim())) {
            agents.add(ag);
          }

          if (ingr.contains(tag.toLowerCase().trim())) {
            agents.add(ag);
          }
        }
      }
    }

    return agents.toSet().toList();
  }

  final FirebaseService _firebaseService = FirebaseService();

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
                          firstToUpperCase(widget.product.productName),
                          style: TitleTextStyle.mainTitle,
                        ),
                        Text(
                          firstToUpperCase(widget.product.getFirstBrand()),
                          style: TitleTextStyle.subtitle,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: "Cantidad neta: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: widget.product.quantity ?? "-")
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Image.asset(
                          fit: BoxFit.contain,
                          width: ancho * 0.3,
                          getNutriScoreImage(
                              widget.product.nutriscore ?? "not"),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          getNutriScoreDesc(
                            widget.product.nutriscore ?? "not",
                          ),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
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
                title: const Text("Información Nutricional"),
                childrenPadding: const EdgeInsets.only(bottom: 15),
                children: [
                  nutrimentsTable(context, ancho, widget.product),
                ],
              ),
              StreamBuilder<List<Agent>>(
                  stream: _firebaseService.agentsStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.active) {
                      return ExpansionTile(
                        childrenPadding:
                            PaddingTheme.horizontal.copyWith(bottom: 15),
                        expandedAlignment: Alignment.centerLeft,
                        title: const Text("Posibles Agentes"),
                        children: const [
                          Center(
                            child: CircularProgressIndicator(),
                          )
                        ],
                      );
                    }
                    if (!snapshot.hasData) {
                      return ExpansionTile(
                        childrenPadding:
                            PaddingTheme.horizontal.copyWith(bottom: 15),
                        expandedAlignment: Alignment.centerLeft,
                        title: const Text("Posibles Agentes"),
                        children: const [
                          Center(
                            child: Text("No hay elementos"),
                          )
                        ],
                      );
                    }
                    agentes = getAgentes(snapshot.data!);

                    return ExpansionTile(
                      childrenPadding:
                          PaddingTheme.horizontal.copyWith(bottom: 15),
                      expandedAlignment: Alignment.centerLeft,
                      title: const Text("Posibles Agentes"),
                      children: [
                        ListView.builder(
                          itemCount: agentes.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: AgentInProductCard(agent: agentes[index]),
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  showDragHandle: true,
                                  builder: (context) {
                                    return AgentPopUp(
                                      agent: agentes[index],
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    );
                  }),
              ExpansionTile(
                title: const Text("Ingredientes"),
                childrenPadding: PaddingTheme.horizontal.copyWith(bottom: 15),
                expandedAlignment: Alignment.centerLeft,
                children: [
                  Text(
                    "${widget.product.ingredientsTextInLanguages != null ? widget.product.ingredientsTextInLanguages![OpenFoodFactsLanguage.SPANISH] : ""}",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
