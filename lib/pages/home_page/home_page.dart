import 'package:flutter/material.dart';
import 'package:proyecto_ubb/pages/home_page/widgets/product_card.dart';
import 'package:proyecto_ubb/pages/product_page/product_page.dart';
import 'package:proyecto_ubb/style/padding_style.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool checkbox = false;

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    // double ancho = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: PaddingTheme.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: alto * 0.05),
              child: const Text(
                "Hola, busque un producto",
                style: TitleTextStyle.mainTitle,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Buscar producto",
                            prefixIcon: Icon(Icons.search),
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.camera_alt),
                          iconSize: 40,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      const Text("Buscar producto por UID"),
                      Checkbox(
                        value: checkbox,
                        onChanged: (value) {
                          setState(() {
                            checkbox = value!;
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Material(
                  // borderRadius: const BorderRadius.all(Radius.circular(25)),
                  // clipBehavior: Clip.hardEdge,
                  child: Container(
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.black26),
                    //   borderRadius: const BorderRadius.all(
                    //     Radius.circular(25),
                    //   ),
                    // ),
                    child: ListView.separated(
                      itemCount: 10,
                      separatorBuilder: (context, index) {
                        return const Divider(height: 0,);
                      },
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: ProductCard(nombre: index.toString()),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const ProductPage();
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
