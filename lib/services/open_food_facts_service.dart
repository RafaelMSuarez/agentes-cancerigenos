import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:proyecto_ubb/services/custom_exceptions.dart';

class OpenFoodFactsService {
  final List<ProductField> fields = [
    ProductField.BARCODE,
    ProductField.NAME,
    ProductField.QUANTITY,
    ProductField.INGREDIENTS,
    ProductField.INGREDIENTS_TAGS,
    ProductField.ADDITIVES,
    ProductField.CATEGORIES,
    ProductField.LABELS,
    ProductField.IMAGE_FRONT_URL,
    ProductField.IMAGE_NUTRITION_URL,
    ProductField.IMAGE_INGREDIENTS_URL
  ];

  Future<Product?> getProduct(String barcode) async {
    final ProductQueryConfiguration configuration = ProductQueryConfiguration(
      barcode,
      language: OpenFoodFactsLanguage.SPANISH,
      fields: fields,
      version: ProductQueryVersion.v3,
    );
    final ProductResultV3 result =
        await OpenFoodAPIClient.getProductV3(configuration);

    if (result.status == ProductResultV3.statusSuccess) {
      return result.product;
    } else {
      throw NoProductFoundException('Producto no encontrado');
    }
  }
}
