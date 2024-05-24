import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/calory/calory_bloc.dart';
import 'package:nutrimotion/blocs/detailactivity/detailactivity_bloc.dart';
import 'package:nutrimotion/blocs/usergoal/usergoal_bloc.dart';
import 'package:nutrimotion/models/detail_activity_model.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/activity_now_tile.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  late UsergoalBloc _userGoalBloc;
  late CaloryBloc _calBloc;
  late DetailactivityBloc _detailactivityBloc;
  int totalkalori = 0;

  @override
  void initState() {
    super.initState();
    _userGoalBloc = context.read<UsergoalBloc>();
    _userGoalBloc.add(UserGoalGet());

    _calBloc = context.read<CaloryBloc>();
    _calBloc.add(UserCalloriesGet());

    _detailactivityBloc = context.read<DetailactivityBloc>();
    _detailactivityBloc.add(DetailActivityGet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.14,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Image.asset('assets/banner.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Aktivitas Hari Ini',
                  style: blackPoppinsTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BlocConsumer<CaloryBloc, CaloryState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is UsercalloriesSuccess) {
                    totalkalori = state.calory.total_kalori;
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Center(
                      child: Container(
                        width: 200,
                        height: 240,
                        decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.grey.withOpacity(0.5), // Warna shadow
                              spreadRadius: 5, // Penyebaran shadow
                              blurRadius: 7, // Blur radius shadow
                              offset: Offset(0, 3), // Offset shadow (x, y)
                            ),
                          ],
                        ),
                        child: BlocConsumer<UsergoalBloc, UsergoalState>(
                          listener: (context, state) {
                            if (state is UsergoalFailed) {
                              showCustomSnackbar(context, state.e);
                            }
                          },
                          builder: (context, state) {
                            if (state is UsergoalLoading) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 55),
                                      child: LinearProgressIndicator(
                                        color: greenColor,
                                        minHeight: 20,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }

                            if (state is UsergoalSuccess) {
                              if (state.goal.message.toString() != 'null') {
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircularPercentIndicator(
                                      radius: 65,
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                      percent: totalkalori.toDouble() >
                                              state.goal.kalori.toDouble()
                                          ? 1.0
                                          : totalkalori.toDouble() /
                                              state.goal.kalori.toDouble(),
                                      progressColor: totalkalori.toDouble() >
                                              state.goal.kalori.toDouble()
                                          ? redColor
                                          : secondaryGreenColor,
                                      backgroundColor:
                                          brownColor.withOpacity(0.27),
                                      center: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '$totalkalori',
                                            style:
                                                whitePoppinsTextStyle.copyWith(
                                              fontSize: 40,
                                              fontWeight: bold,
                                            ),
                                          ),
                                          Text(
                                            'Kalori terbakar',
                                            style:
                                                whitePoppinsTextStyle.copyWith(
                                              fontSize: 15,
                                              fontWeight: bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      'Target: ${state.goal.kalori} Kalori',
                                      style: whitePoppinsTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: semiBold,
                                      ),
                                    ),
                                    CustomFilledButtonWhite(
                                      title: "Tambah Aktivitas",
                                      width: 142,
                                      height: 35,
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/create-activity');
                                      },
                                    ),
                                  ],
                                );
                              } else {
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircularPercentIndicator(
                                      radius: 65,
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                      percent: 300 / 300,
                                      progressColor: secondaryGreenColor,
                                      backgroundColor:
                                          brownColor.withOpacity(0.27),
                                      center: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Tambah Kalori',
                                            style:
                                                whitePoppinsTextStyle.copyWith(
                                              fontSize: 15,
                                              fontWeight: bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: CustomFilledButtonWhite(
                                        title: "Tambah",
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/create-goal');
                                        },
                                        height: 40,
                                      ),
                                    ),
                                  ],
                                );
                              }
                            }
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircularPercentIndicator(
                                  radius: 65,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  percent: 300 / 300,
                                  progressColor: secondaryGreenColor,
                                  backgroundColor: brownColor.withOpacity(0.27),
                                  center: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Tambah Kalori',
                                        style: whitePoppinsTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: CustomFilledButtonWhite(
                                    title: "Tambah",
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/create-goal');
                                    },
                                    height: 40,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 24),
              BlocConsumer<DetailactivityBloc, DetailactivityState>(
                listener: (context, state) {
                  if (state is DetailactivityFailed) {
                    showCustomSnackbar(context, state.e);
                  }
                },
                builder: (context, state) {
                  if (state is DetailactivityLoading) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 55),
                            child: LinearProgressIndicator(
                              color: greenColor,
                              minHeight: 20,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  if (state is DetailActivitySuccess) {
                    if (state.activities.isNotEmpty) {
                      final List<DetailActivityModel> activities =
                          state.activities;
                      int numberOfActivities = activities.length;
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '$numberOfActivities Activity',
                                    style: blackPoppinsTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ),
                          const SizedBox(height: 31),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.22,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    for (final activity in activities)
                                      ActivityNowTile(
                                        iconUrl: activity.photo,
                                        title: activity.activity_name,
                                        duration: '${activity.durasi} menit',
                                        playDate:
                                            '${activity.total_kalori} Kalori',
                                      ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '0 Activity',
                                    style: blackPoppinsTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ),
                          const SizedBox(height: 31),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.22,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    Text(
                                      'Tidak Ada Aktivitas yang dilakukan',
                                      style: blackPoppinsTextStyle.copyWith(
                                          fontSize: 15, fontWeight: semiBold),
                                    ),
                                    Image.asset('assets/4178721.jpg'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  }
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '0 Activity',
                                style: blackPoppinsTextStyle.copyWith(
                                  fontSize: 15,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                      const SizedBox(height: 31),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.22,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Text(
                                  'Tidak Ada Aktivitas yang dilakukan',
                                  style: blackPoppinsTextStyle.copyWith(
                                      fontSize: 15, fontWeight: semiBold),
                                ),
                                Image.asset('assets/4178721.jpg'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
