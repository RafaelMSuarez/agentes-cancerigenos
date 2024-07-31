import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:proyecto_ubb/models/product_model.dart';
import 'package:proyecto_ubb/pages/home_page/widgets/product_card.dart';
import 'package:proyecto_ubb/pages/product_page/product_page.dart';
import 'package:proyecto_ubb/style/padding_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool checkbox = false;
  ProductApi productApi = ProductApi();
  List<Product> products = [];

  bool presente = true; //CAMBIAR

  @override
  void initState() {
    products = productApi.getProducts;

    super.initState();
  }

  String _scanBarcode = "";

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
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                  onPressed: () {
                    scanBarcodeNormal().then((value) =>
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(_scanBarcode == "-1"
                              ? "Operación cancelada"
                              : _scanBarcode),
                          duration: const Duration(seconds: 10),
                        )));
                  },
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
          ),
          SizedBox(
            height: alto * 0.02,
          ),
          Expanded(
            child: Scrollbar(
              child: presente
                  ? ListView.separated(
                      itemCount: products.length,
                      separatorBuilder: (context, index) {
                        return const Divider(
                          height: 0,
                        );
                      },
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: ProductCard(product: products[index]),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProductPage(
                                    product: products[index],
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    )
                  : const Center(
                      child: Text("Comienza a buscar un producto!"),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
