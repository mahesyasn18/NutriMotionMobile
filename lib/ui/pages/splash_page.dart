import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/onboarding', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              whiteColor,
              greenColor,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 163,
                height: 254,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 17,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
