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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vitamin A",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  vitA + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vitamin D",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  vitD + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vitamin E",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  vitE + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vitamin K",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  vitK + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vitamin B1",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  vitB1 + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vitamin B2",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  vitB2 + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vitamin B3",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  vitB3 + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vitamin B5",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  vitB5 + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vitamin B6",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  vitB6 + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Folat",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  folat + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vitamin B12",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  vitB12 + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Biotin",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  biotin + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kolin",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  kolin + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Vitamin C",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  vitC + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kalsium",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  kalsium + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fosfor",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  fosfor + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Magnesium",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  magnesium + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Natrium",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  natrium + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kalium",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  kalium + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Mangan",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  mangan + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tembaga",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  tembaga + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kromium",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  kromium + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Besi",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  besi + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Iodium",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  iodium + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Seng",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  seng + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Selenium",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  selenium + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fluor",
                  style: blackPoppinsTextStyle,
                ),
                Text(
                  fluor + " %",
                  style: blackPoppinsTextStyle,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
