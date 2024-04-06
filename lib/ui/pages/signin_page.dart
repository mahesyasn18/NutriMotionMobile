import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
              title: 'Continue',
              onPressed: () {
                Navigator.pushNamed(context, '/home-page');
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
        ));
  }
}
