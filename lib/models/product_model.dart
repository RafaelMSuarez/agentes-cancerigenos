class Product {
  // Id correspondiente al código barra
  final int id;

  // Nombre del producto
  final String name;

  // Lista ingredientes
  final List<String> ingr;

  // Lista agentes
  final List<int>? agents;

  Product({
    required this.id,
    required this.name,
    required this.ingr,
    this.agents,
  });
}

class ProductApi {
  static List<Product> products = [
    Product(
      id: 0,
      name: "Carne de vacuno",
      ingr: ["Carne de vacuno"],
      agents: [0],
    ),
    Product(
      id: 1,
      name: "Jamón",
      ingr: ["Carne de cerdo"],
      agents: [1],
    ),
    Product(
        id: 2,
        name: "Cola-Cola 2 Litros",
        ingr: ["Azucar", "Cilantro", "Cola", "Cafeína"],
        agents: [2]),
    Product(
      id: 3,
      name: "Pechuga de Pollo",
      ingr: ["Carne de pollo"],
    )
  ];

  List<Product> get getProducts => products;

  Product getProductById(int id) {
    return products.where((element) => element.id == id).first;
  }
}
