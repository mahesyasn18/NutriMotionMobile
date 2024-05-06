import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';

class CustomInformation extends StatelessWidget {
  final String lemakTotal, lemakJenuh, protein, karbohidratTotal, gula, garam;

  const CustomInformation(
      {super.key,
      this.lemakTotal = "",
      this.lemakJenuh = "",
      this.protein = "",
      this.karbohidratTotal = "",
      this.gula = "",
      this.garam = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Lemak Total',
              style: blackPoppinsTextStyle.copyWith(fontSize: 16),
            ),
            Text(
              "$lemakTotal g",
              style: blackPoppinsTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Lemak Jenuh',
              style: blackPoppinsTextStyle.copyWith(fontSize: 16),
            ),
            Text(
              "$lemakJenuh g",
              style: blackPoppinsTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Protein',
              style: blackPoppinsTextStyle.copyWith(fontSize: 16),
            ),
            Text(
              "$protein g",
              style: blackPoppinsTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Karbohidrat total',
              style: blackPoppinsTextStyle.copyWith(fontSize: 16),
            ),
            Text(
              "$karbohidratTotal g",
              style: blackPoppinsTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Gula',
              style: blackPoppinsTextStyle.copyWith(fontSize: 16),
            ),
            Text(
              "$gula g",
              style: blackPoppinsTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Garam',
              style: blackPoppinsTextStyle.copyWith(fontSize: 16),
            ),
            Text(
              "$garam mg",
              style: blackPoppinsTextStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
