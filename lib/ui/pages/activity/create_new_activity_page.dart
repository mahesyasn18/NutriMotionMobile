import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';

class CreateNewActivityPage extends StatefulWidget {
  const CreateNewActivityPage({Key? key}) : super(key: key);

  @override
  State<CreateNewActivityPage> createState() => _CreateNewActivityPageState();
}

class _CreateNewActivityPageState extends State<CreateNewActivityPage> {
  TimeOfDay selectedTime = TimeOfDay.now();

  double _currentSliderValue = 0;

  String getSliderLabel(double value) {
    if (value < 30) {
      return 'Rendah';
    } else if (value >= 30 && value <= 60) {
      return 'Sedang';
    } else {
      return 'Tinggi';
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: ListView(
          children: [
            const customEnteredFormField(title: 'Jenis Aktivitas'),
            const SizedBox(
              height: 20,
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
                    color: _currentSliderValue <= 30
                        ? greenColor
                        : _currentSliderValue <= 60
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
                    max: 90,
                    activeColor: greenColor,
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
            const CustomFormDigitField(title: 'Durasi'),
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
              height: 50,
            ),
            const CustomFilledButton(title: 'Simpan')
          ],
        ),
      ),
    );
  }
}
