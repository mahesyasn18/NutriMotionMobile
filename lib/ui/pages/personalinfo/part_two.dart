import 'package:flutter/material.dart';
import 'package:nutrimotion/models/sign_up_form_model.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/pages/personalinfo/part_three.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';

class SecondPage extends StatefulWidget {
  final SignUpFormModel data;
  SecondPage({Key? key, required this.data}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  DateTime? selectedDate;
  final TextEditingController dateController = TextEditingController();

  bool validate() {
    if (dateController.text.isEmpty) {
      return false;
    }
    return true;
  }

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
        dateController.text = selectedDate!.toString().substring(0, 10);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.data.toJson());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text('Data Personal'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/date.gif',
                height: 300,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Tanggal Lahir',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Text(selectedDate != null
                    ? 'Tanggal dipilih: ${selectedDate.toString().substring(0, 10)}'
                    : 'Pilih Tanggal'),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  if (validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThirdPage(
                            data: SignUpFormModel(
                              email: widget.data.email,
                              fullname: widget.data.fullname,
                              password: widget.data.password,
                              gender: widget.data.gender,
                              birthday: dateController.text,
                            ),
                          ),
                        ));
                  } else {
                    showCustomSnackbar(context, "Semua field harus diisi!");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
