import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';

class EditDataPersonal extends StatefulWidget {
  const EditDataPersonal({super.key});

  @override
  State<EditDataPersonal> createState() => _EditDataPersonalState();
}

class _EditDataPersonalState extends State<EditDataPersonal> {
  String? gender;
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: const Text('Data Personal'),
          backgroundColor: whiteColor,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 27),
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/regis.gif',
                height: 300,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Jenis Kelamin',
                  style: blackPoppinsTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: Text('Laki-laki'),
                      value: 'Laki-laki',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value as String?;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: Text('Perempuan'),
                      value: 'Perempuan',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value as String?;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Tanggal Lahir',
                  style: blackPoppinsTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 16,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Text(selectedDate != null
                    ? 'Tanggal dipilih: ${selectedDate.toString().substring(0, 10)}'
                    : 'Pilih Tanggal'),
              ),
              SizedBox(
                height: 20,
              ),
              CustomFormField(
                title: 'Berat Badan',
              ),
              SizedBox(
                height: 20,
              ),
              CustomFormField(
                title: 'Tinggi Badan',
              ),
              const SizedBox(
                height: 30,
              ),
              CustomFilledButton(title: 'Update Password'),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }
}
