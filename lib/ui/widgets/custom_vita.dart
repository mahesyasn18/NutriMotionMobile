import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nutrimotion/shared/theme.dart';

class CustomVita extends StatelessWidget {
  final String vitA,
      vitD,
      vitE,
      vitK,
      vitB1,
      vitB2,
      vitB3,
      vitB5,
      vitB6,
      folat,
      vitB12,
      biotin,
      kolin,
      vitC,
      kalsium,
      fosfor,
      magnesium,
      natrium,
      kalium,
      mangan,
      tembaga,
      kromium,
      besi,
      iodium,
      seng,
      selenium,
      fluor;
  const CustomVita(
      {super.key,
      this.vitA = "",
      this.vitD = "",
      this.vitE = "",
      this.vitK = "",
      this.vitB1 = "",
      this.vitB2 = "",
      this.vitB3 = "",
      this.vitB5 = "",
      this.vitB6 = "",
      this.folat = "",
      this.vitB12 = "",
      this.biotin = "",
      this.kolin = "",
      this.vitC = "",
      this.kalsium = "",
      this.fosfor = "",
      this.magnesium = "",
      this.natrium = "",
      this.kalium = "",
      this.mangan = "",
      this.tembaga = "",
      this.kromium = "",
      this.besi = "",
      this.iodium = "",
      this.seng = "",
      this.selenium = "",
      this.fluor = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildNutrientRow("Vitamin A", vitA),
        _buildNutrientRow("Vitamin D", vitD),
        _buildNutrientRow("Vitamin E", vitE),
        _buildNutrientRow("Vitamin K", vitK),
        _buildNutrientRow("Vitamin B1", vitB1),
        _buildNutrientRow("Vitamin B2", vitB2),
        _buildNutrientRow("Vitamin B3", vitB3),
        _buildNutrientRow("Vitamin B5", vitB5),
        _buildNutrientRow("Vitamin B6", vitB6),
        _buildNutrientRow("Folat", folat),
        _buildNutrientRow("Vitamin B12", vitB12),
        _buildNutrientRow("Biotin", biotin),
        _buildNutrientRow("Kolin", kolin),
        _buildNutrientRow("Vitamin C", vitC),
        _buildNutrientRow("Kalsium", kalsium),
        _buildNutrientRow("Fosfor", fosfor),
        _buildNutrientRow("Magnesium", magnesium),
        _buildNutrientRow("Natrium", natrium),
        _buildNutrientRow("Kalium", kalium),
        _buildNutrientRow("Mangan", mangan),
        _buildNutrientRow("Tembaga", tembaga),
        _buildNutrientRow("Kromium", kromium),
        _buildNutrientRow("Besi", besi),
        _buildNutrientRow("Iodium", iodium),
        _buildNutrientRow("Seng", seng),
        _buildNutrientRow("Selenium", selenium),
        _buildNutrientRow("Fluor", fluor),
      ],
    );
  }

  Widget _buildNutrientRow(String nutrientName, String nutrientValue) {
    if (nutrientValue != "null") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            nutrientName,
            style: blackPoppinsTextStyle,
          ),
          Text(
            "$nutrientValue %",
            style: blackPoppinsTextStyle,
          ),
        ],
      );
    } else {
      // Return an empty container if the nutrient value is null or empty
      return Container();
    }
  }
}
