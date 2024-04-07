import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/auth/auth_bloc.dart';
import 'package:nutrimotion/models/sign_in_form_model.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailed) {
              showCustomSnackbar(context, state.e);
            }
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/home-page", (route) => false);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Sign In',
                  style: greenPoppinsTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(
                  height: 30,
                ),

                Image.asset(
                  'assets/pass.gif',
                  height: 300,
                ),

                const SizedBox(
                  height: 30,
                ),

                CustomFormField(
                  title: 'Email',
                  controller: emailController,
                ),
                const SizedBox(
                  height: 16,
                ),
                //password
                CustomFormField(
                  title: "Password",
                  obsecureText: true,
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 12,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Lupa Password?',
                    style: greenPoppinsTextStyle.copyWith(
                        fontSize: 14, fontWeight: semiBold),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                CustomFilledButton(
                  title: 'Sign In',
                  onPressed: () {
                    if (validate()) {
                      context.read<AuthBloc>().add(
                            AuthLogin(
                              SignInFormModel(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            ),
                          );
                    } else {
                      showCustomSnackbar(context, 'Semua field harus diisi!');
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum buat akun?',
                      style: secondaryPoppinsTextStyle.copyWith(fontSize: 16),
                    ),
                    CustomTextNotFilledButton(
                      title: 'Sign Up',
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign-up');
                      },
                    )
                  ],
                )
              ],
            );
          },
        ));
  }
}
