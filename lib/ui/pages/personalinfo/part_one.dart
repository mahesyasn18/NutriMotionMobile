import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/auth/auth_bloc.dart';
import 'package:nutrimotion/models/sign_up_form_model.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/pages/personalinfo/part_two.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';

class FirstPage extends StatefulWidget {
  final SignUpFormModel data;
  FirstPage({Key? key, required this.data}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String? gender;
  final TextEditingController genderController = TextEditingController();
  bool validate() {
    if (genderController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          showCustomSnackbar(context, state.e);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            title: Text('Data Personal'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/gender.gif',
                      height: 300,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Jenis Kelamin',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    RadioListTile(
                      title: Text('Laki-laki'),
                      value: 'Laki-laki',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value as String?;
                        });
                        genderController.text = value.toString();
                      },
                    ),
                    RadioListTile(
                      title: Text('Perempuan'),
                      value: 'Perempuan',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value as String?;
                        });
                        genderController.text = value.toString();
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomFilledButton(
                      title: 'Continue',
                      onPressed: () {
                        if (validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SecondPage(
                                  data: SignUpFormModel(
                                    email: widget.data.email,
                                    fullname: widget.data.fullname,
                                    password: widget.data.password,
                                    gender: genderController.text,
                                  ),
                                ),
                              ));
                        } else {
                          showCustomSnackbar(
                              context, "Semua field harus diisi!");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
