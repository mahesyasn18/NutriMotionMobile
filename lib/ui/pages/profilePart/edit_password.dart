import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/auth/auth_bloc.dart';
import 'package:nutrimotion/models/password_edit_form_model.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final TextEditingController current_password_controller =
      TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  final TextEditingController password_confirmation_controller =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title: const Text('Password'),
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
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 27),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/reset_pw.gif',
                    height: 300,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFormField(
                    title: 'Current Password',
                    obsecureText: true,
                    controller: current_password_controller,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomFormField(
                    title: 'New Password',
                    obsecureText: true,
                    controller: password_controller,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomFormField(
                    title: 'Password Confirmation',
                    obsecureText: true,
                    controller: password_confirmation_controller,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFilledButton(
                    title: 'Update Password',
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            AuthUpdatePasswordUser(
                              PasswordEditFormModel(
                                current_password:
                                    current_password_controller.text,
                                password: password_controller.text,
                                password_confirmation:
                                    password_confirmation_controller.text,
                              ),
                            ),
                          );
                    },
                  ),
                ],
              ),
            );
          },
        ));
  }
}
