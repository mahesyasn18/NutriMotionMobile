import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';

class ActivityNowTile extends StatelessWidget {
  final String iconUrl;
  final String title;
  final String playDate;
  final String duration;
  const ActivityNowTile(
      {super.key,
      required this.iconUrl,
      required this.title,
      required this.playDate,
      required this.duration});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          iconUrl,
          width: 50,
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: blackPoppinsTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Image.asset(
                    'assets/ic_clock.png',
                    width: 15,
                  ),
                  SizedBox(width: 5),
                  Text(
                    playDate,
                    style: subtitleGrayPoppinsTextStyle,
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Image.asset(
                        'assets/ic_clock.png',
                        width: 15,
                      ),
                      SizedBox(width: 5),
                      Text(
                        duration,
                        style: subtitleGrayPoppinsTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}