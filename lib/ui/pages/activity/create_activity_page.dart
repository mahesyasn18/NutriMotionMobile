import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/custom_activity_tile.dart';
import 'package:nutrimotion/ui/widgets/custom_form.dart';

class CreateActivityPage extends StatelessWidget {
  const CreateActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pilih Kegiatan Hari ini',
          style: blackPoppinsTextStyle,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: ListView(
          children: [
            const CustomSearchFormField(hints: 'Cari Kegiatan'),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Daftar Kegiatan',
              style: blackPoppinsTextStyle.copyWith(
                  fontSize: 17, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 24,
            ),
            CustomActivityTile(
              iconUrl: 'assets/basketball.png',
              title: 'Bermain Basket',
              onTap: () {
                Navigator.pushNamed(context, '/create-activity-new');
              },
            ),
            const SizedBox(
              height: 18,
            ),
            CustomActivityTile(
              iconUrl: 'assets/basketball.png',
              title: 'Bermain Basket',
              onTap: () {
                Navigator.pushNamed(context, '/create-activity-new');
              },
            ),
            const SizedBox(
              height: 18,
            ),
            CustomActivityTile(
              iconUrl: 'assets/basketball.png',
              title: 'Bermain Basket',
              onTap: () {
                Navigator.pushNamed(context, '/create-activity-new');
              },
            ),
            const SizedBox(
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
}
