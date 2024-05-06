import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/auth/auth_bloc.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:intl/intl.dart';
import 'package:nutrimotion/ui/widgets/custom_fill_gauge.dart';
import 'package:nutrimotion/ui/widgets/home_menu_item.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeMainPage extends StatefulWidget {
  HomeMainPage({super.key});

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  final int recommendedCalori = 2000;
  final int currentCalori = 1200;
  final double carbValue = 40.0;
  final double proteinValue = 25.0;
  final double fatValue = 15.0;


  late String dayName;
  DateTime? date;

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
    dayName = 'Today';
  }

  final userName = 'Fadel Mohammad Fadillah';

  final userProfilePic = 'assets/ic_dataPersonal.png';

  final DateFormat formatter = DateFormat('d MMM');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        dayName = DateFormat('EEEE').format(date!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 28),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/edit-data-personal');
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: whiteColor,
                        ),
                        height: 48,
                        width: 48,
                        child: Image.asset(userProfilePic),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, Welcome',
                          textAlign: TextAlign.left,
                          style: GrayPoppinsTextStyle.copyWith(
                              fontSize: 14, fontWeight: light),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          userName,
                          textAlign: TextAlign.left,
                          style: GrayPoppinsTextStyle.copyWith(
                              fontSize: 16, fontWeight: medium),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
                child: Center(
                  child: Image.asset(
                    'assets/ic_notification.png',
                    width: 40,
                    height: 40,
                    color: greenColor,
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset(
                    'assets/food_img.png',
                    height: 50,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Your Breakfast',
                        style: GrayPoppinsTextStyle.copyWith(
                            fontSize: 16, fontWeight: regular),
                      ),
                      Text(
                        '$dayName, ${formatter.format(date!)}',
                        style: blackPoppinsTextStyle.copyWith(
                            fontSize: 16, fontWeight: medium),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Center(
                      child: GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Image.asset(
                      'assets/ic_calendar.png',
                      width: 32,
                      height: 32,
                      color: greenColor,
                    ),
                  )),
                )
              ],
            ),
          ),
          Container(
            height: 315,
            width: 361,
            decoration: BoxDecoration(
              color: greenColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5),
                  height: 32,
                  child: Center(
                    child: Text(
                      'My Calories Today',
                      style: whitePoppinsTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                    ),
                  ),
                ),
                Container(
                  height: 239,
                  width: 340,
                  margin: EdgeInsets.only(top: 20),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 90),
                        height: 157,
                        width: 166,
                        child: Stack(
                          children: [
                            // background
                            Container(
                              child: HalfCircularFillGauge(
                                value: 1*3.14, // Nilai fill gauge (0.0 - 1.0)
                                color: yellowColor, // Warna fill gauge kosong
                                strokeWidth: 12.0, // Ketebalan garis
                              ),
                            ),
                            // fill
                            HalfCircularFillGauge(
                              value: (currentCalori/recommendedCalori)*3.14, // Nilai fill gauge (0.0 - 1.0)
                              color: secondaryGreenColor, // Warna fill gauge kosong
                              text: currentCalori.toString(), //text calori
                              strokeWidth: 12.0, // Ketebalan garis
                            ),
                          ],
                        ),
                     ),
                     Container(
                      margin: EdgeInsets.only(top: 120,),
                      width: 340,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              CircularPercentIndicator(
                                radius: 45,
                                circularStrokeCap: CircularStrokeCap.round,
                                percent: carbValue/100,
                                progressColor: secondaryGreenColor,
                                backgroundColor: brownColor.withOpacity(0.27),
                                center: Text(
                                  '${carbValue}%',
                                  style: whitePoppinsTextStyle.copyWith(
                                    fontSize: 15, fontWeight: regular
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  'Carbohydrates',
                                  style: whitePoppinsTextStyle.copyWith(
                                    fontSize: 14, fontWeight: regular
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              CircularPercentIndicator(
                                radius: 45,
                                circularStrokeCap: CircularStrokeCap.round,
                                percent: proteinValue/100,
                                progressColor: secondaryGreenColor,
                                backgroundColor: brownColor.withOpacity(0.27),
                                center: Text(
                                  '${proteinValue}%',
                                  style: whitePoppinsTextStyle.copyWith(
                                    fontSize: 15, fontWeight: regular
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  'Protein',
                                  style: whitePoppinsTextStyle.copyWith(
                                    fontSize: 14, fontWeight: regular
                                  ),
                                ),
                              )
                            ],
                          ),Column(
                            children: [
                              CircularPercentIndicator(
                                radius: 45,
                                circularStrokeCap: CircularStrokeCap.round,
                                percent: fatValue/100,
                                progressColor: secondaryGreenColor,
                                backgroundColor: brownColor.withOpacity(0.27),
                                center: Text(
                                  '${fatValue}%',
                                  style: whitePoppinsTextStyle.copyWith(
                                    fontSize: 15, fontWeight: regular
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  'Fat',
                                  style: whitePoppinsTextStyle.copyWith(
                                    fontSize: 14, fontWeight: regular
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                     )
                    ],
                  ),
                )
                
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Asupan Makanan Berat',
              textAlign: TextAlign.left,
              style: blackPoppinsTextStyle.copyWith(
                fontSize: 17,
                fontWeight: semiBold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                HomeMenuItem(
                  iconUrl: 'assets/ic_morningSun.png',
                  text: 'Breakfast',
                  backgroundColor: yellowColor,
                  onTap: () {
                    Navigator.pushNamed(context, '/record-food-page');
                  },
                ),
                HomeMenuItem(
                  iconUrl: 'assets/ic_noon.png',
                  text: 'Lunch',
                  backgroundColor: skyBlueColor,
                  onTap: () {
                    Navigator.pushNamed(context, '/record-food-page');
                  },
                ),
                HomeMenuItem(
                  iconUrl: 'assets/ic_night.png',
                  text: 'Dinner',
                  backgroundColor: pinkishPurpleColor,
                  onTap: () {
                    Navigator.pushNamed(context, '/record-food-page');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
