import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/shared_values.dart';
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipOval(
              child: Image.network(
                '$baseUrls$iconUrl',
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace){
                  return Image.asset(height: 50, width: 50, 'assets/basketball.png');
                },
              ),
            ),
            const SizedBox(
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
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Image.asset(
                        'assets/ic_clock.png',
                        width: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        playDate,
                        style: subtitleGrayPoppinsTextStyle,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Image.asset(
                            'assets/ic_clock.png',
                            width: 15,
                          ),
                          const SizedBox(width: 5),
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
        ),
      ],
    );
  }
}
