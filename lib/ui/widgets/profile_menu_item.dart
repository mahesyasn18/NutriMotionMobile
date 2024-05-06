import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';

class ProfileMenuItem extends StatelessWidget {
  final String iconUrl;
  final String text;
  final String subtitle;
  final VoidCallback? onTap;
  const ProfileMenuItem(
      {super.key,
      required this.iconUrl,
      required this.text,
      required this.subtitle,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  iconUrl,
                  width: 40,
                ),
                const SizedBox(
                  width: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: blackPoppinsTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      subtitle,
                      style: blackPoppinsTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Image.asset(
              "assets/ic_next.png",
              width: 9.98,
              height: 14.68,
              color: greenColor,
            )
          ],
        ),
      ),
    );
  }
}
