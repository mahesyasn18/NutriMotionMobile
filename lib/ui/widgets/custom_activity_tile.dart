import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';

class CustomActivityTile extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback? onTap;
  const CustomActivityTile(
      {super.key, required this.iconUrl, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 17),
        height: 85,
        decoration: BoxDecoration(
          color: Color(0xffF7FFE9),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              iconUrl,
              width: 50,
            ),
            SizedBox(
              width: 13,
            ),
            Text(
              title,
              style: blackPoppinsTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
