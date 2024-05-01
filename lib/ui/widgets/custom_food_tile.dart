import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nutrimotion/shared/theme.dart';

class CustomFoodTile extends StatelessWidget {
  final DateFormat formatter = DateFormat('d MMM yyyy - h.mm a');
  final String foodName;
  final String? foodCal;
  final String? foodSize; 
  final DateTime? dateTime;
  CustomFoodTile({super.key,
    this.dateTime,
    this.foodCal,
    this.foodSize,
    required this.foodName
  });
  

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
                    padding: EdgeInsets.only(left: 20),
                    child: Image.asset(
                    height: 50,
                    width: 50,
                    'assets/food_img.png'
                  ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 10),
                        child: Text(
                          foodName,
                          style: blackPoppinsTextStyle.copyWith(
                            fontSize: 17, fontWeight: medium
                          ),
                        ),
                      ), (dateTime != null) ? 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 10, left: 10),
                            child:Image.asset(
                                  'assets/ic_clock.png',
                                  height: 25,
                                  width: 25,
                              ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 5),
                            alignment: Alignment.center,
                            child: Text(
                              formatter.format(dateTime!),
                              style: blackPoppinsTextStyle.copyWith(
                                fontSize: 13, fontWeight: light, 
                              ),
                            ),
                          )
                        ],
                      ) 
                      : Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            '${foodCal!} Kal - ${foodSize!} ml',
                            style: secondaryPoppinsTextStyle.copyWith(
                              fontSize: 13, fontWeight: light
                            ), 
                          ),
                      )
                    ],
                  )
              ],
            ),
            )
          );
  }
}