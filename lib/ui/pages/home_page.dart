import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/pages/activity_page.dart';
import 'package:nutrimotion/ui/pages/home_main_page.dart';
import 'package:nutrimotion/ui/pages/profile_page.dart';
import 'package:nutrimotion/ui/pages/water_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  Widget body() {
    switch (currentIndex) {
      case 0:
        return HomeMainPage();
        break;
      case 1:
        return ActivityPage();
        break;
      case 2:
        return WaterPage();
        break;
      case 3:
        return ProfilePage();
        break;
      default:
        return HomeMainPage();
        break;
    }
  }

  Widget customButtonNavBar() {
    return BottomAppBar(
      elevation: 0,
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      notchMargin: 6,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.white,
        selectedLabelStyle: greenPoppinsTextStyle.copyWith(fontSize: 9),
        showSelectedLabels: true,
        currentIndex: currentIndex,
        showUnselectedLabels: true,
        unselectedLabelStyle: blackPoppinsTextStyle.copyWith(fontSize: 9),
        selectedItemColor: greenColor,
        unselectedItemColor: blackSecondaryColor,
        onTap: (value) {
          setState(() {
            print(value);
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_home.png',
              width: 24,
              color: currentIndex == 0 ? greenColor : blackSecondaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_activity.png',
              width: 24,
              color: currentIndex == 1 ? greenColor : blackSecondaryColor,
            ),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_water.png',
              width: 24,
              color: currentIndex == 2 ? greenColor : blackSecondaryColor,
            ),
            label: 'Water',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic_profile.png',
              width: 24,
              color: currentIndex == 3 ? greenColor : blackSecondaryColor,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget scanMenu() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/scan-page');
      },
      backgroundColor: Colors.green,
      child: Image.asset(
        'assets/ic_scan.png',
        width: 30,
      ),
      shape: CircleBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: scanMenu(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customButtonNavBar(),
      body: body(),
    );
  }
}
