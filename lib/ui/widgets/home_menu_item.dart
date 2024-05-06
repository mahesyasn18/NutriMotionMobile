import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';

class HomeMenuItem extends StatelessWidget {
  final VoidCallback? onTap;
  final String iconUrl;
  final String text;
  final Color backgroundColor;
  const HomeMenuItem(
      {super.key,
      required this.iconUrl,
      required this.text,
      required this.backgroundColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: 56,
        width: 376,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Image.asset(
                iconUrl,
                width: 50,
                height: 50,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Text(
                text,
                style: blackPoppinsTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: regular,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
