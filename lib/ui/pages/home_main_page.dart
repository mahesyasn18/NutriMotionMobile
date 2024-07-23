import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/auth/auth_bloc.dart';
import 'package:nutrimotion/blocs/dailynut/dailynut_bloc.dart';
import 'package:nutrimotion/blocs/food/food_bloc.dart';
import 'package:nutrimotion/models/eaten_food_model.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:intl/intl.dart';
import 'package:nutrimotion/ui/widgets/custom_fill_gauge.dart';
import 'package:nutrimotion/ui/widgets/custom_list_eaten_food.dart';
import 'package:nutrimotion/ui/widgets/home_menu_item.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeMainPage extends StatefulWidget {
  final DateTime? picked;
  const HomeMainPage({Key? key, this.picked}) : super(key: key);

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  int recommendedCalori = 1;
  int currentCalori = 0;
  double carbValue = 1;
  double proteinValue = 1;
  double fatValue = 1;
  double currentCarb = 0;
  double currentProtein = 0;
  double currentFat = 0;
  List<EatenFoodModel> dinnerFoodList = [];
  List<EatenFoodModel> lunchFoodList = [];
  List<EatenFoodModel> breakfastFoodList = [];
  late FoodBloc _getUserFood;
  late DailynutBloc _getUserDailyNut;
  late String dayName;
  DateTime? date;

  TimeOfDay breakfastStart = TimeOfDay(hour: 6, minute: 0);
  TimeOfDay breakfastEnd = TimeOfDay(hour: 10, minute: 59);
  TimeOfDay lunchStart = TimeOfDay(hour: 11, minute: 0);
  TimeOfDay lunchEnd = TimeOfDay(hour: 17, minute: 59);
  TimeOfDay dinnerStart = TimeOfDay(hour: 18, minute: 0);
  TimeOfDay dinnerEnd = TimeOfDay(hour: 5, minute: 59);

  @override
  void initState() {
    super.initState();

    date = widget.picked;
    dayName = 'Today';
    _getUserFood = context.read<FoodBloc>();
    _getUserDailyNut = context.read<DailynutBloc>();

    _getUserFood.add(GetUserEatenFood(date!));
    _getUserDailyNut.add(GetUserDailyNutrition(date!));
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked;
    picked = await showDatePicker(
      context: context,
      initialDate: date ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        dayName = DateFormat('EEEE').format(date!);
        _getUserFood.add(GetUserEatenFood(date!));
        _getUserDailyNut.add(GetUserDailyNutrition(date!));
      });
      HomeMainPage(picked: date);
    }
  }

  final userProfilePic = 'assets/ic_dataPersonal.png';
  final DateFormat formatter = DateFormat('d MMM');

  @override
  Widget build(BuildContext context) {
    String getGreeting() {
      var now = DateTime.now();
      if (now.hour <= 10 && now.minute <= 59 && now.hour >= 6) {
        return 'Your Breakfast';
      } else if (now.hour <= 17 && now.minute <= 59 && now.hour >= 11) {
        return 'Your Lunch';
      } else if (now.hour <= 5 && now.minute <= 59 ||
          now.hour >= 18 && now.hour <= 23 && now.minute <= 59) {
        return 'Your Dinner';
      }
      return '';
    }

    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 28),
      child: Column(
        children: [
          BlocConsumer<FoodBloc, FoodState>(listener: (context, state) {
            if (state is GetUserEatenFoodSuccess) {
              int totalCalori = 0;
              double totalFat = 0;
              double totalProtein = 0;
              double totalCarb = 0;
              List<EatenFoodModel> tempDinnerFoodList = [];
              List<EatenFoodModel> tempLunchFoodList = [];
              List<EatenFoodModel> tempBreakfastFoodList = [];
              state.data.forEach((foodData) {
                totalCalori = totalCalori + foodData.foodCalori!;
                totalCarb = totalCarb + foodData.foodCarb!;
                totalFat = totalFat + foodData.foodFat!;
                totalProtein = totalProtein + foodData.foodProtein!;

                if (foodData.eatTime!.hour >= breakfastStart.hour &&
                    foodData.eatTime!.hour <= breakfastEnd.hour &&
                    foodData.eatTime!.minute <= breakfastEnd.minute) {
                  tempBreakfastFoodList.add(foodData);
                } else if (foodData.eatTime!.hour >= lunchStart.hour &&
                    foodData.eatTime!.hour <= lunchEnd.hour &&
                    foodData.eatTime!.minute <= lunchEnd.minute) {
                  tempLunchFoodList.add(foodData);
                } else {
                  tempDinnerFoodList.add(foodData);
                }
              });
              setState(() {
                currentCalori = totalCalori;
                currentCarb = totalCarb;
                currentFat = totalFat;
                currentProtein = totalProtein;
                breakfastFoodList = tempBreakfastFoodList;
                lunchFoodList = tempLunchFoodList;
                dinnerFoodList = tempDinnerFoodList;
              });
            }
          }, builder: (context, state) {
            return Container();
          }),
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
                      if (state is AuthLoading) {
                        return LinearProgressIndicator(
                          color: greenColor,
                          minHeight: 20,
                          borderRadius: BorderRadius.circular(30),
                        );
                      }
                      if (state is AuthSuccess) {
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
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
                      getGreeting(),
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
          BlocConsumer<DailynutBloc, DailynutState>(
            listener: (context, state) {
              if (state is DailynutFailed) {
                showCustomSnackbar(context, state.e);
              }
            },
            builder: ((context, state) {
              if (state is DailynutLoading) {
                return Container(
                  height: 315,
                  width: 361,
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: FractionallySizedBox(
                      widthFactor: 0.5, // Untuk memenuhi lebar Container
                      heightFactor: 0.5, // Sesuaikan dengan kebutuhan tinggi
                      alignment: Alignment
                          .center, // Atur posisi LinearProgressIndicator
                      child: CircularProgressIndicator(
                        color: whiteColor,
                      )),
                );
              }
              if (state is GetUserDailyNutritionSuccess) {
                recommendedCalori = state.data.calori!.toInt();
                carbValue = state.data.carb!.toDouble();
                proteinValue = state.data.protein!.toDouble();
                fatValue = state.data.fat!.toDouble();

                return Container(
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
                                    value: (currentCalori / recommendedCalori) >
                                            1
                                        ? 3.14
                                        : (currentCalori / recommendedCalori) *
                                            3.14, // Nilai fill gauge (0.0 - 1.0)
                                    color: (currentCalori / recommendedCalori) >
                                            1
                                        ? redColor
                                        : secondaryGreenColor, // Warna fill gauge kosong
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
                                        percent: (currentCarb / carbValue) > 1
                                            ? 1
                                            : currentCarb / carbValue,
                                        progressColor:
                                            (currentCarb / carbValue) > 1
                                                ? redColor
                                                : secondaryGreenColor,
                                        backgroundColor:
                                            brownColor.withOpacity(0.27),
                                        center: Text(
                                          '$currentCarb g',
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
                                        percent:
                                            (currentProtein / proteinValue) > 1
                                                ? 1
                                                : (currentProtein /
                                                    proteinValue),
                                        progressColor:
                                            (currentProtein / proteinValue) > 1
                                                ? redColor
                                                : secondaryGreenColor,
                                        backgroundColor:
                                            brownColor.withOpacity(0.27),
                                        center: Text(
                                          '$currentProtein g',
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
                                        percent: (currentFat / fatValue) > 1
                                            ? 1
                                            : (currentFat / fatValue),
                                        progressColor:
                                            (currentFat / fatValue) > 1
                                                ? redColor
                                                : secondaryGreenColor,
                                        backgroundColor:
                                            brownColor.withOpacity(0.27),
                                        center: Text(
                                          '$currentFat g',
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
                );
              } else {
                return Container(
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
                                        percent: currentCarb / carbValue,
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
                                        percent: currentProtein / proteinValue,
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
                                        percent: currentFat / fatValue,
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
                );
              }
            }),
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
            height: MediaQuery.of(context).size.height * 0.257,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HomeMenuItem(
                    iconUrl: 'assets/ic_morningSun.png',
                    text: 'Breakfast',
                    backgroundColor: yellowColor,
                    onTap: () {
                      Navigator.pushNamed(context, '/record-food-page');
                    },
                  ),
                  CustomListEatenFood(foodData: breakfastFoodList),
                  HomeMenuItem(
                    iconUrl: 'assets/ic_noon.png',
                    text: 'Lunch',
                    backgroundColor: skyBlueColor,
                    onTap: () {
                      Navigator.pushNamed(context, '/record-food-page');
                    },
                  ),
                  CustomListEatenFood(foodData: lunchFoodList),
                  HomeMenuItem(
                    iconUrl: 'assets/ic_night.png',
                    text: 'Dinner',
                    backgroundColor: pinkishPurpleColor,
                    onTap: () {
                      Navigator.pushNamed(context, '/record-food-page');
                    },
                  ),
                  CustomListEatenFood(foodData: dinnerFoodList),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
