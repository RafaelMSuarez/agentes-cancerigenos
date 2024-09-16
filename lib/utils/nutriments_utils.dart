import "package:flutter/material.dart";
import "package:openfoodfacts/openfoodfacts.dart";

Widget nutrimentRow(BuildContext context, String title, double? serving,
    double? grams, bool mg, bool kcal) {
  if (serving == null || grams == null) {
    return const SizedBox();
  }
  double padding = 2;
  return Row(
    children: [
      Expanded(
        flex: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: padding, horizontal: 10),
          child: Text(
            title,
            overflow: TextOverflow.clip,
            maxLines: 1,
          ),
        ),
      ),
      Expanded(
          child: Container(
        decoration: BoxDecoration(
          border: Border.symmetric(
            vertical: BorderSide(
              color: Theme.of(context).indicatorColor,
            ),
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Text(
              "${mg ? (serving * 1000).toStringAsFixed(2) : serving.toStringAsFixed(2)} ${kcal ? "kCal" : mg ? "mg" : "g"}",
              overflow: TextOverflow.clip,
              maxLines: 1,
            ),
          ),
        ),
      )),
      Expanded(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Text(
              "${mg ? (grams * 1000).toStringAsFixed(1) : grams.toStringAsFixed(1)} ${kcal ? "kCal" : mg ? "mg" : "g"}",
              overflow: TextOverflow.clip,
              maxLines: 1,
            ),
          ),
        ),
      ),
    ],
  );
}

Container nutrimentsTable(BuildContext context, double ancho, Product product) {
  if (product.nutriments == null || product.nutriments!.isEmpty()) {
    return Container();
  }

  return Container(
    width: ancho,
    decoration: BoxDecoration(
      border: Border.all(color: Theme.of(context).indicatorColor),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Porción: ${product.servingSize ?? ""}"),
                Text(
                    "Porciones por envase: ${((product.packagingQuantity ?? 1).toInt() / (product.servingQuantity ?? 1).toInt()).round()} aprox."),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(
                color: Theme.of(context).indicatorColor,
              ),
            ),
          ),
          width: ancho,
          child: Row(
            children: [
              const Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      vertical: BorderSide(
                        color: Theme.of(context).indicatorColor,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text("1 Porción"),
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Center(
                    child: Text("100g"),
                  ),
                ),
              ),
            ],
          ),
        ),
        nutrimentRow(
          context,
          "Energía",
          product.nutriments!.getValue(
            Nutrient.energyKCal,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.energyKCal,
            PerSize.oneHundredGrams,
          ),
          false,
          true,
        ),
        nutrimentRow(
          context,
          "Proteínas",
          product.nutriments!.getValue(
            Nutrient.proteins,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.proteins,
            PerSize.oneHundredGrams,
          ),
          false,
          false,
        ),
        nutrimentRow(
          context,
          "Grasas Totales",
          product.nutriments!.getValue(
            Nutrient.fat,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.fat,
            PerSize.oneHundredGrams,
          ),
          false,
          false,
        ),
        nutrimentRow(
          context,
          "     Saturadas",
          product.nutriments!.getValue(
            Nutrient.saturatedFat,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.saturatedFat,
            PerSize.oneHundredGrams,
          ),
          false,
          false,
        ),
        nutrimentRow(
          context,
          "     Monoinsaturadas",
          product.nutriments!.getValue(
            Nutrient.monounsaturatedFat,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.monounsaturatedFat,
            PerSize.oneHundredGrams,
          ),
          false,
          false,
        ),
        nutrimentRow(
          context,
          "     Poliinsaturadas",
          product.nutriments!.getValue(
            Nutrient.polyunsaturatedFat,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.polyunsaturatedFat,
            PerSize.oneHundredGrams,
          ),
          false,
          false,
        ),
        nutrimentRow(
          context,
          "     Trans",
          product.nutriments!.getValue(
            Nutrient.transFat,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.transFat,
            PerSize.oneHundredGrams,
          ),
          false,
          false,
        ),
        nutrimentRow(
          context,
          "     Colesterol",
          product.nutriments!.getValue(
            Nutrient.cholesterol,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.cholesterol,
            PerSize.oneHundredGrams,
          ),
          true,
          false,
        ),
        nutrimentRow(
          context,
          "Hidratos de Carbono",
          product.nutriments!.getValue(
            Nutrient.carbohydrates,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.carbohydrates,
            PerSize.oneHundredGrams,
          ),
          false,
          false,
        ),
        nutrimentRow(
          context,
          "Azúcares Totales",
          product.nutriments!.getValue(
            Nutrient.sugars,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.sugars,
            PerSize.oneHundredGrams,
          ),
          false,
          false,
        ),
        nutrimentRow(
          context,
          "Sodio",
          product.nutriments!.getValue(
            Nutrient.sodium,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.sodium,
            PerSize.oneHundredGrams,
          ),
          true,
          false,
        ),
      ],
    ),
  );
}
