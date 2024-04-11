// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/padding_style.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    double ancho = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: ancho,
          height: alto * 0.2,
          color: Colors.blue[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Nombre del producto",
                  style: TitleTheme.secondTitle,
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: const Text(
            "Posibles agentes cancerigenos",
            style: TitleTheme.secondTitle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            // color: Colors.red,
            height: alto * 0.17,
            width: ancho,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 50,
                  ),
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.red[100],
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Ingredientes",
                    style: TitleTheme.secondTitle,
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              color: Colors.grey[400],
                              width: ancho,
                              height: alto * 0.1,
                              child: Center(
                                child: Text(index.toString()),
                              ),
                            ),
                          );
                        }))
              ],
            ),
          ),
        )
      ],
    ));
  }
}
