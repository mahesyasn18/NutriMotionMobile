import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';

class SuccessEditProfile extends StatelessWidget {
  const SuccessEditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/Safe.gif',
                height: 250,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Nice Update!',
                style: blackPoppinsTextStyle.copyWith(
                    fontSize: 20, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Your Data is safe with our system',
                style: blackPoppinsTextStyle.copyWith(
                    fontSize: 20, fontWeight: light),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomFilledButton(
                title: 'Back to Home',
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
