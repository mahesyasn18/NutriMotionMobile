import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/auth/auth_bloc.dart';
import 'package:nutrimotion/models/sign_up_form_model.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/pages/personalinfo/part_one.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final fullnameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (fullnameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
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

            if (state is AuthCheckEmailSuccess) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirstPage(
                        data: SignUpFormModel(
                            fullname: fullnameController.text,
                            email: emailController.text,
                            password: passwordController.text)),
                  ));
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
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Sign Up',
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
                  'assets/regis.gif',
                  height: 300,
                ),

                const SizedBox(
                  height: 30,
                ),

                CustomFormField(
                  title: 'Full Name',
                  controller: fullnameController,
                ),
                const SizedBox(
                  height: 16,
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
                  height: 16,
                ),
                //password

                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    if (validate()) {
                      context
                          .read<AuthBloc>()
                          .add(AuthCheckEmail(emailController.text));
                    } else {
                      showCustomSnackbar(context, "Semua field harus diisi!");
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
                      'Sudah punya akun?',
                      style: secondaryPoppinsTextStyle.copyWith(fontSize: 16),
                    ),
                    CustomTextNotFilledButton(
                      title: 'Sign In',
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign-in');
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
