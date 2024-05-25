class Product {
  // Id correspondiente al código barra
  final int id;

  // Nombre del producto
  final String name;

  // Lista ingredientes
  final List<String> ingr;

  // Lista agentes
  final List<int>? agents;

  // Imagen
  final String? imgSource;

  Product({
    required this.id,
    required this.name,
    required this.ingr,
    this.agents,
    this.imgSource,
  });
}

class ProductApi {
  static List<Product> products = [
    Product(
      id: 0,
      name: "Carne de vacuno",
      ingr: ["Carne de vacuno"],
      agents: [0],
      imgSource: "assets/carne.jpg",
    ),
    Product(
        id: 1,
        name: "Jamón",
        ingr: ["Carne de cerdo"],
        agents: [1],
        imgSource: "assets/jamon.png"),
    Product(
      id: 2,
      name: "Coca-Cola 2.5L Sin Ázucar",
      ingr: [
        "Agua carbonatada",
        "Color caramelo",
        "Ácido Fosfórico",
        "Aspartamo",
        "Saborizantes naturales",
        "Benzoato se Sodio",
        "Acesulfamo de Potasio",
        "Citrato de Sodio",
        "Cafeína",
        "Fenilalanina",
      ],
      agents: [
        5,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
        2,
      ],
      imgSource: "assets/coca.png",
    ),
    Product(
      id: 3,
      name: "Pechuga de Pollo",
      ingr: ["Carne de pollo"],
      imgSource: "assets/pollo.webp",
    ),
    Product(
      id: 4,
      name: "Pechuga de Pollo",
      ingr: ["Carne de pollo"],
      imgSource: "assets/pollo.webp",
    ),
    Product(
      id: 5,
      name: "Pechuga de Pollo",
      ingr: ["Carne de pollo"],
      imgSource: "assets/pollo.webp",
    ),
    Product(
      id: 6,
      name: "Pechuga de Pollo",
      ingr: ["Carne de pollo"],
      imgSource: "assets/pollo.webp",
    ),
    Product(
      id: 7,
      name: "Pechuga de Pollo",
      ingr: ["Carne de pollo"],
    ),
    Product(
      id: 8,
      name: "Pechuga de Pollo",
      ingr: ["Carne de pollo"],
    ),
  ];

  List<Product> get getProducts => products;

  Product getProductById(int id) {
    return products.where((element) => element.id == id).first;
  }
}
