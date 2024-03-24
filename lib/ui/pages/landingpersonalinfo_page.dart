import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';

class LandingPersonalInfoPage extends StatelessWidget {
  const LandingPersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Personaldata.gif',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Mengetahui Kamu\nLebih Baik',
              style: blackPoppinsTextStyle.copyWith(
                  fontSize: 30, fontWeight: bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Kami ingin mengenal Kamu lebih baik dan\nmemberikan rekomendasi terbaik.',
              style: blackPoppinsTextStyle.copyWith(
                  fontSize: 16, fontWeight: medium),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomFilledButton(
              title: 'Continue',
              onPressed: () {
                Navigator.pushNamed(context, '/personal-info');
              },
            )
          ],
        ),
      ),
    );
  }
}
