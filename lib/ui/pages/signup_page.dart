import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: ListView(
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

            const CustomFormField(title: 'Username'),
            const SizedBox(
              height: 16,
            ),
            const CustomFormField(title: 'Email'),
            const SizedBox(
              height: 16,
            ),
            //password
            const CustomFormField(
              title: "Password",
              obsecureText: true,
            ),
            const SizedBox(
              height: 16,
            ),
            //password
            const CustomFormField(
              title: "Konfirmasi Password",
              obsecureText: true,
            ),

            const SizedBox(
              height: 30,
            ),
            CustomFilledButton(
              title: 'Continue',
              onPressed: () {
                Navigator.pushNamed(context, '/landing-personal-info');
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
        ));
  }
}
