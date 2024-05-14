import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/shared_values.dart';
import 'package:nutrimotion/shared/theme.dart';

class CustomActivityTile extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback? onTap;

  const CustomActivityTile({
    Key? key,
    required this.iconUrl,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.symmetric(horizontal: 17),
        height: 85,
        decoration: BoxDecoration(
          color: const Color(0xffF7FFE9),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipOval(
              child: Image.network(
                '$baseUrls$iconUrl',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
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
