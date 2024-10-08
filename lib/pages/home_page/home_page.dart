import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:proyecto_ubb/models/agent_model.dart';
import 'package:proyecto_ubb/models/product_model.dart';
import 'package:proyecto_ubb/pages/home_page/widgets/product_card.dart';
import 'package:proyecto_ubb/pages/product_page/product_page.dart';
import 'package:proyecto_ubb/services/custom_exceptions.dart';
import 'package:proyecto_ubb/services/firebase_service.dart';
import 'package:proyecto_ubb/services/open_food_facts_service.dart';
import 'package:proyecto_ubb/style/padding_style.dart';
import 'package:proyecto_ubb/utils/custom_cpi.dart';
import 'package:proyecto_ubb/utils/string_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Product? singleProduct;

  String _scanBarcode = "";
  String? searchQuery;
  late Future<List<Product>?> _products;
  final _firebaseService = FirebaseService();

  bool loading = false;

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      // print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  void initState() {
    _products = searchProductsByName(searchQuery);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double alto = MediaQuery.of(context).size.height;
    // double ancho = MediaQuery.of(context).size.width;
    return Padding(
      padding: PaddingTheme.allPage,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: "Buscar producto",
                    prefixIcon: const Icon(Icons.search),
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      searchQuery = value;
                      _products = searchProductsByName(value.trim());
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                  onPressed: () async {
                    setState(() {
                      loading = true;
                    });
                    await scanBarcodeNormal().then(
                      (value) async {
                        if (_scanBarcode == "-1") {
                          if (!context.mounted) return;
                          setState(() {
                            loading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Operación cancelada.")));
                        } else {
                          setState(() {
                            loading = true;
                          });
                          await getProductBarcode(_scanBarcode).then((value) {
                            singleProduct = value;
                            if (!context.mounted) return;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProductPage(
                                    product: singleProduct!,
                                  );
                                },
                              ),
                            );
                            setState(() {
                              loading = false;
                            });
                          }).catchError((e) {
                            setState(() {
                              loading = false;
                            });
                            if (e is NoProductFoundException) {
                              if (!context.mounted) return;
                              _firebaseService.addBarcode(
                                Barcode(barcode: _scanBarcode, nombre: null),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Producto no encontrado."),
                                ),
                              );
                            }
                          });
                        }
                      },
                    );
                  },
                  icon: const Icon(Icons.camera_alt),
                  iconSize: 40,
                ),
              )
            ],
          ),
          SizedBox(
            height: alto * 0.02,
          ),
          Expanded(
            child: FutureBuilder<List<Product>?>(
                future: _products,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Scrollbar(
                      child: !loading
                          ? snapshot.data == null || snapshot.data!.isEmpty
                              ? const Center(
                                  child: Text("Comienza a buscar un producto!"),
                                )
                              : ListView.separated(
                                  itemCount: snapshot.data!.length,
                                  separatorBuilder: (context, index) {
                                    return const Divider(
                                      height: 0,
                                    );
                                  },
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      child: ProductCard(
                                          product: snapshot.data![index]),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return ProductPage(
                                                product: snapshot.data![index],
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                )
                          : Center(
                              child: CustomCpi(
                                mensaje: "Buscando ${searchQuery ?? ""}",
                              ),
                            ),
                    );
                  } else {
                    return Center(
                      child: CustomCpi(
                        mensaje: "Buscando ${searchQuery ?? ""}",
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
