import "package:flutter/material.dart";
import "package:openfoodfacts/openfoodfacts.dart";

extension DoubleTrailing on double {
  String toZeroString(int fix) {
    if (this % 1 == 0) {
      return toInt().toString();
    } else {
      return toStringAsFixed(fix);
    }
  }
}

Widget nutrimentRow(
  BuildContext context,
  String title,
  double? serving,
  double? grams,
  bool mg, {
  TextStyle? textStyle,
}) {
  if (serving == null || grams == null) {
    return const SizedBox();
  }
  double padding = 4;
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
            style: textStyle ?? const TextStyle(fontWeight: FontWeight.bold),
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
              mg ? (serving * 1000).toZeroString(2) : serving.toZeroString(2),
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
              mg ? (grams * 1000).toZeroString(1) : grams.toZeroString(1),
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
          "Energía (kCal)",
          product.nutriments!.getValue(
            Nutrient.energyKCal,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.energyKCal,
            PerSize.oneHundredGrams,
          ),
          false,
        ),
        nutrimentRow(
          context,
          "Proteínas (g)",
          product.nutriments!.getValue(
            Nutrient.proteins,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.proteins,
            PerSize.oneHundredGrams,
          ),
          false,
        ),
        nutrimentRow(
          context,
          "Grasas Totales (g)",
          product.nutriments!.getValue(
            Nutrient.fat,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.fat,
            PerSize.oneHundredGrams,
          ),
          false,
        ),
        nutrimentRow(
          context,
          " - Saturadas (g)",
          product.nutriments!.getValue(
            Nutrient.saturatedFat,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.saturatedFat,
            PerSize.oneHundredGrams,
          ),
          false,
          textStyle: const TextStyle(fontWeight: FontWeight.normal),
        ),
        nutrimentRow(
          context,
          " - Monoinsaturadas (g)",
          product.nutriments!.getValue(
            Nutrient.monounsaturatedFat,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.monounsaturatedFat,
            PerSize.oneHundredGrams,
          ),
          false,
          textStyle: const TextStyle(fontWeight: FontWeight.normal),
        ),
        nutrimentRow(
          context,
          " - Poliinsaturadas (g)",
          product.nutriments!.getValue(
            Nutrient.polyunsaturatedFat,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.polyunsaturatedFat,
            PerSize.oneHundredGrams,
          ),
          false,
          textStyle: const TextStyle(fontWeight: FontWeight.normal),
        ),
        nutrimentRow(
          context,
          " - Trans (g)",
          product.nutriments!.getValue(
            Nutrient.transFat,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.transFat,
            PerSize.oneHundredGrams,
          ),
          false,
          textStyle: const TextStyle(fontWeight: FontWeight.normal),
        ),
        nutrimentRow(
          context,
          " - Colesterol (mg)",
          product.nutriments!.getValue(
            Nutrient.cholesterol,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.cholesterol,
            PerSize.oneHundredGrams,
          ),
          true,
          textStyle: const TextStyle(fontWeight: FontWeight.normal),
        ),
        nutrimentRow(
          context,
          "Hidratos de Carbono (g)",
          product.nutriments!.getValue(
            Nutrient.carbohydrates,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.carbohydrates,
            PerSize.oneHundredGrams,
          ),
          false,
        ),
        nutrimentRow(
          context,
          "Azúcares Totales (g)",
          product.nutriments!.getValue(
            Nutrient.sugars,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.sugars,
            PerSize.oneHundredGrams,
          ),
          false,
        ),
        nutrimentRow(
          context,
          "Sodio (g)",
          product.nutriments!.getValue(
            Nutrient.sodium,
            PerSize.serving,
          ),
          product.nutriments!.getValue(
            Nutrient.sodium,
            PerSize.oneHundredGrams,
          ),
          true,
        ),
      ],
    ),
  );
}
