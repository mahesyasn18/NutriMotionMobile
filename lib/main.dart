import 'package:flutter/material.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/pages/landing_page.dart';
import 'package:nutrimotion/ui/pages/landingpersonalinfo_page.dart';
import 'package:nutrimotion/ui/pages/onboarding_page.dart';
import 'package:nutrimotion/ui/pages/personalinfo_page.dart';
import 'package:nutrimotion/ui/pages/signin_page.dart';
import 'package:nutrimotion/ui/pages/signup_page.dart';
import 'package:nutrimotion/ui/pages/splash_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: blackColor,
          ),
          titleTextStyle: blackPoppinsTextStyle.copyWith(
              fontSize: 20, fontWeight: semiBold),
        ),
      ),
      routes: {
        '/': (context) => const SplashPage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/landing': (context) => const LandingPage(),
        '/sign-in': (context) => const SignInPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/landing-personal-info': (context) => const LandingPersonalInfoPage(),
        '/personal-info': (context) => PersonalInfoPage(),
      },
    );
  }
}
