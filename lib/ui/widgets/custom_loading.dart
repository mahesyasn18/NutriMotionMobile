import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
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
                      fontSize: 36, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Motion',
                  style: blackPoppinsTextStyle.copyWith(
                      fontSize: 36, fontWeight: FontWeight.w800),
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
}