import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nutrimotion/shared/theme.dart';

class CustomFoodTile extends StatelessWidget {
  final DateFormat formatter = DateFormat('d MMM yyyy');
  final String foodName;
  final String? foodCal;
  final String? foodSize;
  final DateTime? dateTime;
  final TimeOfDay? eatTime;
  CustomFoodTile(
      {super.key,
      this.dateTime,
      this.foodCal,
      this.foodSize,
      this.eatTime,
      required this.foodName});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        height: 85,
        width: 376,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(15),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20),
                child:
                    Image.asset(height: 50, width: 50, 'assets/food_img.png'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15, left: 10),
                    child: Text(
                      foodName,
                      style: blackPoppinsTextStyle.copyWith(
                          fontSize: 17, fontWeight: medium),
                    ),
                  ),
                  (dateTime != null)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 10, left: 10),
                              child: Image.asset(
                                'assets/ic_clock.png',
                                height: 25,
                                width: 25,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10, left: 5),
                              alignment: Alignment.center,
                              child: Text(
                                '${formatter.format(dateTime!)} ${eatTime!.hour}.${eatTime!.minute}',
                                style: blackPoppinsTextStyle.copyWith(
                                  fontSize: 13,
                                  fontWeight: light,
                                ),
                              ),
                            )
                          ],
                        )
                      : Container(
                          margin: const EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            '${foodCal!} Kal - ${foodSize!} ml',
                            style: secondaryPoppinsTextStyle.copyWith(
                                fontSize: 13, fontWeight: light),
                          ),
                        )
                ],
              )
            ],
          ),
        ));
  }
}
