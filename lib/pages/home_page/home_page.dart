import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto_ubb/pages/product_page/product_page.dart';
import 'package:proyecto_ubb/style/padding_style.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    double ancho = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: PaddingTheme.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: alto * 0.05, bottom: 10),
                    child: const Text(
                      "Bienvenido Usuario",
                      style: TitleTheme.mainTitle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Container(
                      width: ancho,
                      height: alto * 0.06,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          border: Border.all(color: Colors.black54)),
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Icons.search, color: Colors.black54),
                          ),
                          Text(
                            "Buscar producto",
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    // child: TextField(
                    //   decoration: InputDecoration(
                    //     labelText: "Buscar producto",
                    //     prefixIcon: Icon(Icons.search),
                    //     contentPadding: EdgeInsets.zero,
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(50),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: InkWell(
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
                      child: Container(
                        height: alto * 0.2,
                        width: ancho,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Categorias de agentes cancerigenos"),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Categorías productos",
                    style: TitleTheme.secondTitle,
                  ),
                ],
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
            Padding(
              padding: PaddingTheme.horizontal,
              child: Container(
                height: alto * 0.2,
                width: ancho,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Links",
                    style: TitleTheme.secondTitle,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: alto * 0.08,
            ),
          ],
        ),
      ),
    );
  }
}
