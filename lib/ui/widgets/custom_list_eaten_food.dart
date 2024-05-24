import 'package:flutter/material.dart';
import 'package:nutrimotion/models/eaten_food_model.dart';
import 'package:nutrimotion/shared/theme.dart';

class CustomListEatenFood extends StatelessWidget {
  final List<EatenFoodModel> foodData;
  const CustomListEatenFood(
    {
      super.key,
      required this.foodData,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: foodData.map<Widget>((data) {
        return Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: grayColor)),
          ),
          width: MediaQuery.of(context).size.width,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.foodName!,
                      style: blackPoppinsTextStyle.copyWith(
                        fontSize: 16, fontWeight: regular,
                      ),
                    ),
                    Text(
                      '${data.foodSize}g',
                      style: greenPoppinsTextStyle.copyWith(
                        fontSize: 12, fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${data.foodCalori} cal',
                  style: blackPoppinsTextStyle.copyWith(
                    fontSize: 16, fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList()
    );

  }
}