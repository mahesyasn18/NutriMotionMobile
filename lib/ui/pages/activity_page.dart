import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/activity_now_tile.dart';
import 'package:nutrimotion/ui/widgets/custom_button.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.14,
            decoration: BoxDecoration(
              color: Colors
                  .green, // Move the color property inside the BoxDecoration
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Image.asset('assets/banner.png'),
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  'Aktivitas Hari Ini',
                  style: blackPoppinsTextStyle.copyWith(
                      fontSize: 17, fontWeight: semiBold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '5 Activity',
                        style: blackPoppinsTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CustomFilledButton(
                      title: "Tambah Aktivitas",
                      width: 142,
                      height: 35,
                      onPressed: () {
                        Navigator.pushNamed(context, '/create-activity');
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 31),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    ActivityNowTile(
                      iconUrl: 'assets/basketball.png',
                      title: 'Main Basket',
                      duration: '75 menit',
                      playDate: '09 Mar, 2024',
                    ),
                    SizedBox(height: 30),
                    ActivityNowTile(
                      iconUrl: 'assets/basketball.png',
                      title: 'Main Basket',
                      duration: '75 menit',
                      playDate: '09 Mar, 2024',
                    ),
                    SizedBox(height: 30),
                    ActivityNowTile(
                      iconUrl: 'assets/basketball.png',
                      title: 'Main Basket',
                      duration: '75 menit',
                      playDate: '09 Mar, 2024',
                    ),
                    SizedBox(height: 30),
                    ActivityNowTile(
                      iconUrl: 'assets/basketball.png',
                      title: 'Main Basket',
                      duration: '75 menit',
                      playDate: '09 Mar, 2024',
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
