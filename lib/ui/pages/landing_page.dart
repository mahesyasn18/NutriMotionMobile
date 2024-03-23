import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 32),
            child: Text(
              'Hello,',
              style: greenPoppinsTextStyle.copyWith(
                  fontWeight: extraBold, fontSize: 38),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Text(
              'Siap hidup sehat dengan NutriMotions?',
              style: blackPoppinsTextStyle.copyWith(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Image.asset(
              'assets/landing.png',
              width: 365,
            ),
          ),
          SizedBox(
            height: 36,
          ),
          Center(
            child: Text(
              'Mari ikuti kami untuk\nbantu anda menjadi\nlebih sehat',
              textAlign: TextAlign.center,
              style: blackPoppinsTextStyle.copyWith(fontSize: 22),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: CustomFilledButton(
              width: 360,
              height: 58,
              title: 'Sign In',
              onPressed: () {
                Navigator.pushNamed(context, '/sign-in');
              },
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: CustomTextButton(
              title: 'Sign Up',
              width: 360,
              height: 58,
              onPressed: () {
                Navigator.pushNamed(context, '/sign-up');
              },
            ),
          ),
        ],
      ),
    );
  }
}
