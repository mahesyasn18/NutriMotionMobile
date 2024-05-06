import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/auth/auth_bloc.dart';
import 'package:nutrimotion/models/data_personal_edit_form_model.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
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

  final TextEditingController genderController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  bool validate() {
    if (genderController.text.isEmpty ||
        dateController.text.isEmpty ||
        weightController.text.isEmpty ||
        heightController.text.isEmpty) {
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
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      setState(() {
        gender = authState
            .user.gender; // Atur nilai gender dari objek user dalam AuthSuccess
        selectedDate = DateTime.parse(authState.user.birthday
            .toString()); // Atur nilai selectedDate dari objek user dalam AuthSuccess
        // Atur nilai lainnya seperti weight dan height jika perlu
      });
      // Set text pada controller sesuai dengan nilai yang didapatkan
      genderController.text = gender!;
      dateController.text = selectedDate!.toString().substring(0, 10);
      weightController.text = authState.user.weight.toString();
      heightController.text = authState.user.height.toString();
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
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailed) {
              showCustomSnackbar(context, state.e);
            }

            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/success-update-profile', (route) => false);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: 100,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Nutri',
                            style: greenPoppinsTextStyle.copyWith(
                                fontSize: 36, fontWeight: black),
                          ),
                          TextSpan(
                            text: 'Motion',
                            style: blackPoppinsTextStyle.copyWith(
                                fontSize: 36, fontWeight: extraBold),
                          ),
                        ],
                      ),
                    ),
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
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 27),
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
                          title: const Text('Laki-laki'),
                          value: 'Laki-laki',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value as String?;
                            });
                            genderController.text = value.toString();
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          title: const Text('Perempuan'),
                          value: 'Perempuan',
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value as String?;
                            });
                            genderController.text = value.toString();
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
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    title: 'Berat Badan',
                    controller: weightController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    title: 'Tinggi Badan',
                    controller: heightController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFilledButton(
                    title: 'Update Profile',
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            AuthUpdatePersonalDataUser(
                              ProfileDataPersonalEditFormModel(
                                birthday: dateController.text,
                                gender: genderController.text,
                                height: heightController.text,
                                weight: weightController.text,
                              ),
                            ),
                          );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            );
          },
        ));
  }
}
