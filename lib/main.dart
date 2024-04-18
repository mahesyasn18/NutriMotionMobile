import 'package:flutter/material.dart';
import 'package:nutrimotion/blocs/auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/scan/scan_bloc.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/pages/home_page.dart';
import 'package:nutrimotion/ui/pages/landing_page.dart';
import 'package:nutrimotion/ui/pages/onboarding_page.dart';
import 'package:nutrimotion/ui/pages/product_page.dart';
import 'package:nutrimotion/ui/pages/profilePart/edit_data_personal.dart';
import 'package:nutrimotion/ui/pages/profilePart/edit_password.dart';
import 'package:nutrimotion/ui/pages/profilePart/edit_profile.dart';
import 'package:nutrimotion/ui/pages/scan_page.dart';
import 'package:nutrimotion/ui/pages/signin_page.dart';
import 'package:nutrimotion/ui/pages/signup_page.dart';
import 'package:nutrimotion/ui/pages/splash_page.dart';
import 'package:camera/camera.dart';
import 'package:nutrimotion/ui/pages/success_regist_page.dart';

late List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()
            ..add(
              AuthGetCurrentUser(),
            ),
        ),
        BlocProvider<ScanBloc>(
          create: (context) => ScanBloc(),
        ),
      ],
      child: MaterialApp(
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
          '/success-regist': (context) => SuccessRegisterPage(),
          '/home-page': (context) => HomePage(),
          '/scan-page': (context) => ScanPage(),
          '/product-show': (context) => ProductPage(),
          '/edit-profile': (context) => EditProfile(),
          '/edit-password': (context) => EditPassword(),
          '/edit-data-personal': (context) => EditDataPersonal(),
        },
      ),
    );
  }
}
