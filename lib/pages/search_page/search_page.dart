import 'package:flutter/material.dart';
import 'package:proyecto_ubb/style/padding_style.dart';
import 'package:proyecto_ubb/style/text_styles.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool checkbox = false;

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    double ancho = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: PaddingTheme.paddingDouble),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 5, left: 15, right: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: SizedBox(
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
                    Row(
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
                    )
                  ],
                ),
              ),
              Padding(
                padding: PaddingTheme.horizontal,
                child: Container(
                  height: alto * 0.44,
                  width: ancho,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: Center(
                    child: Text("Lista de productos"),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: PaddingTheme.paddingDouble),
                child: Text(
                  "Categorías productos",
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
            ],
          ),
        ),
      ),
    );
  }
}
