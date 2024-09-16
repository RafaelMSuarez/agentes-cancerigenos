import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:proyecto_ubb/services/custom_exceptions.dart';

final List<ProductField> fields = [
  ProductField.BARCODE,
  ProductField.NAME,
  ProductField.QUANTITY,
  ProductField.PACKAGING_QUANTITY,
  ProductField.SERVING_SIZE,
  ProductField.SERVING_QUANTITY,
  ProductField.INGREDIENTS,
  ProductField.INGREDIENTS_TEXT_IN_LANGUAGES,
  ProductField.INGREDIENTS_TAGS,
  ProductField.ADDITIVES,
  ProductField.CATEGORIES,
  ProductField.CATEGORIES_TAGS,
  ProductField.LABELS,
  ProductField.IMAGE_FRONT_URL,
  ProductField.IMAGE_NUTRITION_URL,
  ProductField.IMAGE_INGREDIENTS_URL,
  ProductField.NUTRISCORE,
  ProductField.NUTRIMENTS
];

Future<Product?> getProductBarcode(String barcode) async {
  final ProductQueryConfiguration configuration = ProductQueryConfiguration(
    barcode,
    language: OpenFoodFactsLanguage.SPANISH,
    country: OpenFoodFactsCountry.CHILE,
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

Future<List<Product>?> searchProductsByName(String? query) async {
  if (query == null || query.isEmpty) {
    return List.empty();
  }
  SearchResult res = await OpenFoodAPIClient.searchProducts(
    null,
    ProductSearchQueryConfiguration(
      parametersList: [
        SearchTerms(terms: [query]),
        const SortBy(
          option: SortOption.POPULARITY,
        ),
        const PageSize(size: 10),
      ],
      version: ProductQueryVersion.v3,
    ),
  );
  return res.products;
}
