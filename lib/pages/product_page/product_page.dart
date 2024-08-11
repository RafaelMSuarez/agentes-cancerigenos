import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:proyecto_ubb/models/agent_model.dart';
import 'package:proyecto_ubb/models/product_model.dart';
import 'package:proyecto_ubb/pages/agents_page/widgets/agent_popup.dart';
import 'package:proyecto_ubb/style/padding_style.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;
  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  AgentApi agentApi = AgentApi();

  String getGroup(int id) {
    switch (agentApi.getAgentById(id).group) {
      case 1:
        return "G1";
      case 2:
        return "G2A";
      case 3:
        return "G2B";
      case 4:
        return "G3";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    double ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
          child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: alto * 0.3,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                title: Container(
                  width: ancho,
                  height: alto * 0.07,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.8),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      widget.product.name,
                      style: TitleTextStyle.secondTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                // IMAGEN APPBAR
                background: GestureDetector(
                  child: Hero(
                    tag: "${widget.product.id}",
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: widget.product.imgSource ?? "",
                      imageBuilder: (context, imageProvider) {
                        return PhotoView(
                          imageProvider: imageProvider,
                          disableGestures: true,
                          initialScale: PhotoViewComputedScale.covered,
                        );
                      },
                      progressIndicatorBuilder: (context, url, dProg) => Center(
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
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return GestureDetector(
                          child: Container(
                            color: Colors.black87,
                            alignment: Alignment.center,
                            child: Hero(
                              tag: "${widget.product.id}",
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  width: 5,
                                )),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: widget.product.imgSource ?? "",
                                  imageBuilder: (context, imageProvider) {
                                    return PhotoView(
                                      imageProvider: imageProvider,
                                      minScale:
                                          PhotoViewComputedScale.contained,
                                      maxScale:
                                          PhotoViewComputedScale.contained,
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
                                      image:
                                          AssetImage("assets/placeholder.png"),
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
          ];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: PaddingTheme.all,
              child: Text(
                "Posibles agentes carcinogénicos (${(widget.product.agents == null ? "0" : widget.product.agents!.length)})",
                style: TitleTextStyle.secondTitle,
              ),
            ),
            SizedBox(
              height: alto * 0.16,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: widget.product.agents == null
                    ? const Center(
                        child: Padding(
                          padding: PaddingTheme.all,
                          child: Text(
                            "No contiene ningún agente carcinogénico :)",
                            style: CardTextStyle.secondTitle,
                          ),
                        ),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        shrinkWrap: true,
                        itemCount: widget.product.agents!.length,
                        // physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                showDragHandle: true,
                                builder: (context) {
                                  return AgentPopUp(
                                    agent: agentApi.getAgentById(
                                        widget.product.agents![index]),
                                  );
                                },
                              );
                            },
                            child: SizedBox(
                              // color: Colors.red,
                              width: ancho * 0.32,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: ancho * 0.09,
                                    child: Text(
                                      getGroup(widget.product.agents![index]),
                                    ),
                                  ),
                                  Text(
                                    agentApi
                                        .getAgentById(
                                            widget.product.agents![index])
                                        .agent,
                                    style: CardTextStyle.mainTitle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
            const Divider(),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        "Ingredientes",
                        style: TitleTextStyle.secondTitle,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: PaddingTheme.all,
                        child: widget.product.ingr == null ||
                                widget.product.ingr!.isEmpty
                            ? const Center(
                                child: Text("No se encuentran ingredientes"),
                              )
                            : Scrollbar(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: widget.product.ingr == null
                                      ? 0
                                      : widget.product.ingr!.length,
                                  // physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: alto * 0.02);
                                  },
                                  itemBuilder: (context, index) {
                                    return Text(
                                      widget.product.ingr![index].text ?? "",
                                      style: const TextStyle(fontSize: 16),
                                    );
                                  },
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
