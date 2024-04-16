import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/auth/auth_bloc.dart';
import 'package:nutrimotion/models/sign_up_form_model.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';

class ThirdPage extends StatefulWidget {
  final SignUpFormModel data;
  ThirdPage({Key? key, required this.data}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  bool validate() {
    if (weightController.text.isEmpty || heightController.text.isEmpty) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.data.toJson());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text('Data Personal'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, "/success-regist", (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/height.gif',
                    height: 300,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Berat Badan dan\nTinggi Badan saat ini',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    title: 'Berat Badan',
                    controller: weightController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    title: 'Tinggi Badan',
                    controller: heightController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFilledButton(
                    title: 'Continue',
                    onPressed: () {
                      if (validate()) {
                        context.read<AuthBloc>().add(AuthRegister(widget.data
                            .copyWith(
                                height: heightController.text,
                                weight: weightController.text)));
                      } else {
                        showCustomSnackbar(context, "Semua field harus diisi!");
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
