import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/activity/activity_bloc.dart';
import 'package:nutrimotion/blocs/detailactivity/detailactivity_bloc.dart';
import 'package:nutrimotion/models/activity_detail_form_model.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/pages/home_page.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CreateNewActivityPage extends StatefulWidget {
  const CreateNewActivityPage({Key? key}) : super(key: key);

  @override
  State<CreateNewActivityPage> createState() => _CreateNewActivityPageState();
}

class _CreateNewActivityPageState extends State<CreateNewActivityPage> {
  final activitynameController = TextEditingController(text: '');
  final durasiController = TextEditingController(text: '');

  bool validate() {
    if (activitynameController.text.isEmpty && durasiController.text.isEmpty) {
      return false;
    }
    return true;
  }

  TimeOfDay selectedTime = TimeOfDay.now();
  double lowValue = 0;
  double midValue = 0;
  double highValue = 0;
  double _currentSliderValue = 0.0;

  String getSliderLabel(double value) {
    print(value);
    if (value <= lowValue) {
      return 'Rendah';
    } else if (value > lowValue && value < highValue) {
      return 'Sedang';
    } else {
      return 'Tinggi';
    }
  }

  @override
  void initState() {
    super.initState();
    final activityState = context.read<ActivityBloc>().state;
    if (activityState is ActivityShowSuccess) {
      activitynameController.text =
          activityState.activity.activityName.toString();
      lowValue = activityState.activity.jumlahKaloriRendah.toDouble();
      midValue = activityState.activity.jumlahKaloriSedang.toDouble();
      highValue = activityState.activity.jumlahKaloriTinggi.toDouble();
      _currentSliderValue =
          activityState.activity.jumlahKaloriRendah.toDouble();
    } else {}
  }

  double _calculateCaloriesBurned() {
    int durasi = 0;
    try {
      durasi = int.parse(durasiController.text);
    } catch (e) {
      durasi = 0;
    }
    double caloriesBurned = _currentSliderValue * durasi / 300;
    return caloriesBurned.clamp(0.0, 1.0);
  }

  double _calculateCalories() {
    int durasi = 0;
    try {
      durasi = int.parse(durasiController.text);
    } catch (e) {
      durasi = 0;
    }

    return _currentSliderValue * durasi;
  }

  @override
  Widget build(BuildContext context) {
    int durasi = 0;
    try {
      durasi = int.parse(durasiController.text);
    } catch (e) {
      durasi = 0;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tambah Kegiatan',
          style: blackPoppinsTextStyle.copyWith(
            fontSize: 17,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: BlocConsumer<DetailactivityBloc, DetailactivityState>(
        listener: (context, state) {
          if (state is DetailactivityFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is DetailActivityOneSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(currentIndex: 1),
              ),
            );
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: ListView(
              children: [
                customEnteredFormField(
                  title: 'Jenis Aktivitas',
                  controller: activitynameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Waktu',
                  style: blackPoppinsTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "${selectedTime.hour}:${selectedTime.minute}",
                      style: blackPoppinsTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final TimeOfDay? timeOfDay = await showTimePicker(
                            context: context,
                            initialTime: selectedTime,
                            initialEntryMode: TimePickerEntryMode.dial,
                          );
                          if (timeOfDay != null) {
                            setState(() {
                              selectedTime = timeOfDay;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            foregroundColor: greenColor,
                            backgroundColor: whiteColor,
                            side: BorderSide(color: greenColor)),
                        child: const Text('Pilih Waktu'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'Intensitas Bermain',
                  style: blackPoppinsTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 140,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Image.asset(
                        'assets/ic_heart.png',
                        width: 30,
                        color: _currentSliderValue <= lowValue
                            ? greenColor
                            : _currentSliderValue < highValue
                                ? yellowColor
                                : redColor,
                      ),
                      Text(
                        getSliderLabel(_currentSliderValue),
                        style: blackPoppinsTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 16,
                        ),
                      ),
                      Slider(
                        value: _currentSliderValue,
                        max: highValue,
                        activeColor: greenColor,
                        min: lowValue,
                        divisions: 2,
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        },
                        semanticFormatterCallback: (double value) {
                          return getSliderLabel(value);
                        },
                      ),
                    ],
                  ),
                ),
                CustomFormDigitField(
                  title: 'Durasi',
                  controller: durasiController,
                  onDurationChanged: (int duration) {
                    setState(() {
                      // Update _currentSliderValue here
                      durasi = duration; // Assuming duration is in minutes
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CircularPercentIndicator(
                  radius: 65,
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: _calculateCaloriesBurned(),
                  progressColor: secondaryGreenColor,
                  backgroundColor: brownColor.withOpacity(0.27),
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _calculateCalories().toString(),
                        style: greenPoppinsTextStyle.copyWith(
                            fontSize: 40, fontWeight: bold),
                      ),
                      Text(
                        'Kalori terbakar',
                        style: greenPoppinsTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomFilledButton(
                  title: 'Simpan',
                  onPressed: () {
                    if (validate()) {
                      context.read<DetailactivityBloc>().add(
                            DetailActivitySet(
                              ActivityDetailFormModel(
                                durasi: durasiController.text.toString(),
                                total_kalori: _calculateCalories().toString(),
                                waktu:
                                    "${selectedTime.hour}:${selectedTime.minute}",
                                jenis_activity:
                                    activitynameController.text.toString(),
                              ),
                            ),
                          );
                    } else {
                      showCustomSnackbar(context, 'Semua Field harus diisi!');
                    }
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
