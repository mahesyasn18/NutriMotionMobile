import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/auth/auth_bloc.dart';
import 'package:nutrimotion/blocs/food/food_bloc.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:intl/intl.dart';
import 'package:nutrimotion/ui/widgets/custom_fill_gauge.dart';
import 'package:nutrimotion/ui/widgets/home_menu_item.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeMainPage extends StatefulWidget {
  const HomeMainPage({super.key});

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  final int recommendedCalori = 2000;
  final int currentCalori = 1200;
  final double carbValue = 40.0;
  final double proteinValue = 25.0;
  final double fatValue = 15.0;
  late FoodBloc _getEatenFood;

  late String dayName;
  DateTime? date;

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
    dayName = 'Today';

    _getEatenFood = context.read<FoodBloc>();
    _getEatenFood.add(GetUserEatenFood());
  }

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
      margin:
          const EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 28),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthFailed) {
                        showCustomSnackbar(context, state.e);
                      }
                      if (state is AuthInitial) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/landing', (route) => false);
                      }
                    },
                    builder: ((context, state) {
                      if (state is AuthLoading){
                        return LinearProgressIndicator(
                          color: greenColor,
                          minHeight: 20,
                          borderRadius: BorderRadius.circular(30),
                        );
                      }
                      if(state is AuthSuccess){
                        return Column(
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
                              state.user.fullname.toString(),
                              textAlign: TextAlign.left,
                              style: GrayPoppinsTextStyle.copyWith(
                                  fontSize: 16, fontWeight: medium),
                            ),
                          ],
                        );
                      }
                      return Container();
                    }), 
                  ),
                ],
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
            margin:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/food_img.png',
                  height: 50,
                ),
                Column(
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
                  margin: const EdgeInsets.only(top: 5),
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
                  margin: const EdgeInsets.only(top: 20),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 90),
                        height: 157,
                        width: 166,
                        child: Stack(
                          children: [
                            // background
                            HalfCircularFillGauge(
                              value: 1 *
                                  3.14, // Nilai fill gauge (0.0 - 1.0)
                              color:
                                  yellowColor, // Warna fill gauge kosong
                              strokeWidth: 12.0, // Ketebalan garis
                            ),
                            // fill
                            HalfCircularFillGauge(
                              value: (currentCalori / recommendedCalori) *
                                  3.14, // Nilai fill gauge (0.0 - 1.0)
                              color:
                                  secondaryGreenColor, // Warna fill gauge kosong
                              text:
                                  currentCalori.toString(), //text calori
                              strokeWidth: 12.0, // Ketebalan garis
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 120,
                        ),
                        width: 340,
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 45,
                                  circularStrokeCap:
                                      CircularStrokeCap.round,
                                  percent: carbValue / 100,
                                  progressColor: secondaryGreenColor,
                                  backgroundColor:
                                      brownColor.withOpacity(0.27),
                                  center: Text(
                                    '$carbValue%',
                                    style: whitePoppinsTextStyle.copyWith(
                                        fontSize: 15,
                                        fontWeight: regular),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Carbohydrates',
                                    style: whitePoppinsTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: regular),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 45,
                                  circularStrokeCap:
                                      CircularStrokeCap.round,
                                  percent: proteinValue / 100,
                                  progressColor: secondaryGreenColor,
                                  backgroundColor:
                                      brownColor.withOpacity(0.27),
                                  center: Text(
                                    '$proteinValue%',
                                    style: whitePoppinsTextStyle.copyWith(
                                        fontSize: 15,
                                        fontWeight: regular),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Protein',
                                    style: whitePoppinsTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: regular),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 45,
                                  circularStrokeCap:
                                      CircularStrokeCap.round,
                                  percent: fatValue / 100,
                                  progressColor: secondaryGreenColor,
                                  backgroundColor:
                                      brownColor.withOpacity(0.27),
                                  center: Text(
                                    '$fatValue%',
                                    style: whitePoppinsTextStyle.copyWith(
                                        fontSize: 15,
                                        fontWeight: regular),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Fat',
                                    style: whitePoppinsTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: regular),
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
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                'Asupan Makanan Berat',
                textAlign: TextAlign.left,
                style: blackPoppinsTextStyle.copyWith(
                  fontSize: 17,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      HomeMenuItem(
                        iconUrl: 'assets/ic_morningSun.png',
                        text: 'Breakfast',
                        backgroundColor: yellowColor,
                        onTap: () {
                          Navigator.pushNamed(context, '/record-food-page');
                        },
                      ),
                      BlocConsumer<FoodBloc, FoodState>(
                        listener: (context, state){
                          if (state is FoodFailed){
                            showCustomSnackbar(context, state.e);
                          }
                        },
                        builder: ((context, state) {
                          if (state is GetUserEatenFoodSuccess){
                            return Column(
                              children: state.data.map((data) {
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
                          return Container();
                        }), 
                      ),
                      
                    ],
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
          ),
        ],
      ),
    )
  );
  }
}
