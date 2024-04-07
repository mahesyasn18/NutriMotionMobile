import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';

class SuccessRegisterPage extends StatelessWidget {
  const SuccessRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Honesty.gif',
                width: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Datamu Sudah\nLengkap!',
                style: blackPoppinsTextStyle.copyWith(
                    fontSize: 30, fontWeight: semiBold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                'Sekarang kamu dapat menggunakan\naplikasi ini sepenuhnya!',
                style: blackPoppinsTextStyle.copyWith(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 60,
              ),
              CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home-page', (route) => false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
