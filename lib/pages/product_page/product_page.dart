import 'package:flutter/material.dart';
import 'package:proyecto_ubb/models/agent_model.dart';
import 'package:proyecto_ubb/models/product_model.dart';
import 'package:proyecto_ubb/pages/agents_page/widgets/agent_popup.dart';
import 'package:proyecto_ubb/style/padding_style.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class ProductPage extends StatefulWidget {
  final Product product;
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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: ancho,
              height: alto * 0.2,
              color: Theme.of(context).colorScheme.surfaceVariant,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Padding(
                    padding: PaddingTheme.all,
                    child: Text(
                      widget.product.name,
                      style: TitleTextStyle.secondTitle,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: PaddingTheme.all,
              child: Text(
                "Posibles agentes cancerigenos (${(widget.product.agents == null ? "0" : widget.product.agents!.length)})",
                style: TitleTextStyle.secondTitle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: widget.product.agents == null
                  ? const Center(
                      child: Padding(
                        padding: PaddingTheme.all,
                        child: Text("No contiene ningún agente carcinogénico :)", style: CardTextStyle.secondTitle,),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      shrinkWrap: true,
                      itemCount: widget.product.agents!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
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
                          leading: CircleAvatar(
                            child: Text(
                              getGroup(widget.product.agents![index]),
                            ),
                          ),
                          title: Text(
                            agentApi
                                .getAgentById(widget.product.agents![index])
                                .agent,
                            style: CardTextStyle.mainTitle,
                          ),
                        );
                      },
                    ),
            ),
            const Divider(),
            Container(
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
                  Padding(
                    padding: PaddingTheme.all,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: widget.product.ingr.length,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return SizedBox(height: alto * 0.02);
                      },
                      itemBuilder: (context, index) {
                        return Text(
                          widget.product.ingr[index],
                          style: CardTextStyle.mainTitle,
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
