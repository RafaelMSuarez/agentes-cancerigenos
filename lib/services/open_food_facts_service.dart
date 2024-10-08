import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:proyecto_ubb/services/custom_exceptions.dart';

final List<ProductField> fields = [
  ProductField.ADDITIVES,
  ProductField.BARCODE,
  ProductField.BRANDS,
  ProductField.CATEGORIES,
  ProductField.CATEGORIES_TAGS,
  ProductField.IMAGE_FRONT_URL,
  ProductField.INGREDIENTS,
  ProductField.INGREDIENTS_TAGS,
  ProductField.INGREDIENTS_TEXT_IN_LANGUAGES,
  ProductField.LABELS,
  ProductField.NAME,
  ProductField.GENERIC_NAME,
  ProductField.NUTRISCORE,
  ProductField.NUTRIMENTS,
  ProductField.PACKAGING_QUANTITY,
  ProductField.QUANTITY,
  ProductField.SERVING_QUANTITY,
  ProductField.SERVING_SIZE,
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
