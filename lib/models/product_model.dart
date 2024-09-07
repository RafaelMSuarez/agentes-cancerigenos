// import 'package:openfoodfacts/openfoodfacts.dart';

// class ProductModel {
//   // Id correspondiente al código barra
//   final int id;

//   // Nombre del producto
//   final String name;

//   // Lista ingredientes
//   final List<Ingredient>? ingr;

//   // Lista agentes
//   final List<int>? agents;

//   // Imagen
//   final String? imgSource;

//   ProductModel({
//     required this.id,
//     required this.name,
//     required this.ingr,
//     this.agents,
//     this.imgSource,
//   });
// }

// class ProductApi {
//   static List<ProductModel> products = [
//     // ProductModel(
//     //   id: 0,
//     //   name: "Carne de vacuno",
//     //   ingr: ["Carne de vacuno"],
//     //   agents: [0],
//     //   imgSource: "assets/carne.jpg",
//     // ),
//     // ProductModel(
//     //     id: 1,
//     //     name: "Jamón",
//     //     ingr: ["Carne de cerdo"],
//     //     agents: [1],
//     //     imgSource: "assets/jamon.png"),
//     // ProductModel(
//     //   id: 2,
//     //   name: "Coca-Cola 2.5L Sin Ázucar",
//     //   ingr: [
//     //     "Agua carbonatada",
//     //     "Color caramelo",
//     //     "Ácido Fosfórico",
//     //     "Aspartamo",
//     //     "Saborizantes naturales",
//     //     "Benzoato se Sodio",
//     //     "Acesulfamo de Potasio",
//     //     "Citrato de Sodio",
//     //     "Cafeína",
//     //     "Fenilalanina",
//     //   ],
//     //   agents: [
//     //     5,
//     //     2519,
//     //   ],
//     //   imgSource: "assets/coca.png",
//     // ),
//     // ProductModel(
//     //   id: 3,
//     //   name: "Pechuga de Pollo",
//     //   ingr: ["Carne de pollo"],
//     //   imgSource: "assets/pollo.webp",
//     // ),
//     // ProductModel(
//     //   id: 4,
//     //   name: "Producto 4",
//     //   ingr: ["ingredientes"],
//     // ),
//     // ProductModel(
//     //   id: 5,
//     //   name: "Producto 5",
//     //   ingr: ["ingredientes"],
//     // ),
//     // ProductModel(
//     //   id: 6,
//     //   name: "Producto 6",
//     //   ingr: ["ingredientes"],
//     // ),
//     // ProductModel(
//     //   id: 7,
//     //   name: "Producto 7",
//     //   ingr: ["ingredientes"],
//     // ),
//     // ProductModel(
//     //   id: 8,
//     //   name: "Producto 8",
//     //   ingr: ["ingredientes"],
//     // ),
//   ];

//   List<ProductModel> get getProducts => products;

//   ProductModel getProductById(int id) {
//     return products.where((element) => element.id == id).first;
//   }

//   ProductModel parserProduct(Product? product) {
//     return ProductModel(
//         id: int.tryParse(product!.barcode ?? "0") ?? 0,
//         name: product.productName ?? "",
//         ingr: product.ingredients,
//         imgSource: product.imageFrontUrl);
//   }
// }
