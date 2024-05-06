import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/auth/auth_bloc.dart';
import 'package:nutrimotion/shared/shared_methods.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/widgets/profile_menu_item.dart';
import 'package:animations/animations.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  String calculateAge(DateTime birthday) {
    DateTime today = DateTime.now();
    int ageYears = today.year - birthday.year;
    int ageMonths = today.month - birthday.month;
    if (today.day < birthday.day) {
      ageMonths--;
    }
    if (ageMonths < 0) {
      ageYears--;
      ageMonths += 12;
    }
    return '$ageYears tahun $ageMonths bulan';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/landing', (route) => false);
          }
        },
        builder: (context, state) {
          return PageTransitionSwitcher(
            transitionBuilder: (
              Widget child,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return SharedAxisTransition(
                child: child,
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
              );
            },
            child: _buildContent(context, state),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, AuthState state) {
    if (state is AuthLoading) {
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
    if (state is AuthSuccess) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 34, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/edit-profile');
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 3000),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: greenColor,
                ),
                width: double.infinity,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          state.user.fullname.toString(),
                          style: whitePoppinsTextStyle.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          calculateAge(
                              DateTime.parse(state.user.birthday.toString())),
                          style: whitePoppinsTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/ic_edit.png',
                      width: 24,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 34,
            ),
            Text(
              "Personal Information",
              style: blackPoppinsTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 3000),
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
              decoration: BoxDecoration(
                  color: greenColorsecond,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileMenuItem(
                    iconUrl: "assets/ic_dataPersonal.png",
                    text: "Data Personal",
                    subtitle: "Make changes to your account",
                    onTap: () {
                      Navigator.pushNamed(context, '/edit-data-personal');
                    },
                  ),
                  ProfileMenuItem(
                    iconUrl: "assets/ic_pw.png",
                    text: "Password",
                    subtitle: "Make changes to your password",
                    onTap: () {
                      Navigator.pushNamed(context, '/edit-password');
                    },
                  ),
                  ProfileMenuItem(
                    iconUrl: "assets/ic_logout.png",
                    text: "Log Out",
                    subtitle: "Log out from the application",
                    onTap: () {
                      context.read<AuthBloc>().add(AuthLogout());
                    },
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 34,
            ),
            Text(
              "More",
              style: blackPoppinsTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 3000),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  color: greenColorsecond,
                  borderRadius: BorderRadius.circular(20)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileMenuItem(
                      iconUrl: "assets/ic_help.png",
                      text: "Help & Support",
                      subtitle: "Guidelines of help & Support"),
                  ProfileMenuItem(
                      iconUrl: "assets/ic_aboutapps.png",
                      text: "About App",
                      subtitle: "Background of the this apps"),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 34, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/edit-profile');
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 3000),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: greenColor,
              ),
              width: double.infinity,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Name",
                        style: whitePoppinsTextStyle.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Age",
                        style: whitePoppinsTextStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/ic_edit.png',
                    width: 24,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 34,
          ),
          Text(
            "Personal Information",
            style: blackPoppinsTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 3000),
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            decoration: BoxDecoration(
                color: greenColorsecond,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileMenuItem(
                  iconUrl: "assets/ic_dataPersonal.png",
                  text: "Data Personal",
                  subtitle: "Make changes to your account",
                  onTap: () {
                    Navigator.pushNamed(context, '/edit-data-personal');
                  },
                ),
                ProfileMenuItem(
                  iconUrl: "assets/ic_pw.png",
                  text: "Password",
                  subtitle: "Make changes to your password",
                  onTap: () {
                    Navigator.pushNamed(context, '/edit-password');
                  },
                ),
                ProfileMenuItem(
                  iconUrl: "assets/ic_logout.png",
                  text: "Log Out",
                  subtitle: "Log out from the application",
                  onTap: () {
                    context.read<AuthBloc>().add(AuthLogout());
                  },
                )
              ],
            ),
          ),
          const SizedBox(
            height: 34,
          ),
          Text(
            "More",
            style: blackPoppinsTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 3000),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
                color: greenColorsecond,
                borderRadius: BorderRadius.circular(20)),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileMenuItem(
                    iconUrl: "assets/ic_help.png",
                    text: "Help & Support",
                    subtitle: "Guidelines of help & Support"),
                ProfileMenuItem(
                    iconUrl: "assets/ic_aboutapps.png",
                    text: "About App",
                    subtitle: "Background of the this apps"),
              ],
            ),
          ),
        ],
      ),
    );
    // Handle other states if needed.
  }
}
