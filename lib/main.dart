import 'package:flutter/material.dart';
import 'package:nutrimotion/blocs/activity/activity_bloc.dart';
import 'package:nutrimotion/blocs/auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrimotion/blocs/calory/calory_bloc.dart';
import 'package:nutrimotion/blocs/detailactivity/detailactivity_bloc.dart';
import 'package:nutrimotion/blocs/food/food_bloc.dart';
import 'package:nutrimotion/blocs/scan/scan_bloc.dart';
import 'package:nutrimotion/blocs/usergoal/usergoal_bloc.dart';
import 'package:nutrimotion/blocs/water/water_bloc.dart';
import 'package:nutrimotion/shared/theme.dart';
import 'package:nutrimotion/ui/pages/activity/create_activity_page.dart';
import 'package:nutrimotion/ui/pages/activity/create_new_activity_page.dart';
import 'package:nutrimotion/ui/pages/activity_page.dart';
import 'package:nutrimotion/ui/pages/add_food_page.dart';
import 'package:nutrimotion/ui/pages/add_new_food_page.dart';
import 'package:nutrimotion/ui/pages/browse_food_page.dart';
import 'package:nutrimotion/ui/pages/goal/create_goal_page.dart';
import 'package:nutrimotion/ui/pages/home_page.dart';
import 'package:nutrimotion/ui/pages/landing_page.dart';
import 'package:nutrimotion/ui/pages/onboarding_page.dart';
import 'package:nutrimotion/ui/pages/product_page.dart';
import 'package:nutrimotion/ui/pages/profilePart/edit_data_personal.dart';
import 'package:nutrimotion/ui/pages/profilePart/edit_password.dart';
import 'package:nutrimotion/ui/pages/profilePart/edit_profile.dart';
import 'package:nutrimotion/ui/pages/profilePart/success_edit_page.dart';
import 'package:nutrimotion/ui/pages/record_heavy_foods_page.dart';
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
        BlocProvider<WaterBloc>(
          create: (context) => WaterBloc(),
        ),
        BlocProvider<ActivityBloc>(
          create: (context) => ActivityBloc(),
        ),
        BlocProvider<UsergoalBloc>(
          create: (context) => UsergoalBloc(),
        ),
        BlocProvider<DetailactivityBloc>(
          create: (context) => DetailactivityBloc(),
        ),
        BlocProvider<CaloryBloc>(
          create: (context) => CaloryBloc(),
        ),
        BlocProvider(
          create: (context) => FoodBloc(),
        )
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
          '/success-regist': (context) => const SuccessRegisterPage(),
          '/home-page': (context) => HomePage(
                currentIndex: 0,
              ),
          '/scan-page': (context) => const ScanPage(),
          '/activity-page': (context) => const ActivityPage(),
          '/product-show': (context) => const ProductPage(),
          '/edit-profile': (context) => const EditProfile(),
          '/edit-password': (context) => const EditPassword(),
          '/edit-data-personal': (context) => const EditDataPersonal(),
          '/success-update-profile': (context) => const SuccessEditProfile(),
          '/create-activity': (context) => const CreateActivityPage(),
          '/create-activity-new': (context) => const CreateNewActivityPage(),
          '/record-food-page': (context) => const RecordHeavyFoodsPage(),
          '/browse-food': (context) => const BrowseFoodPage(),
          '/add-food': (context) => const AddFoodPage(),
          '/add-new-food': (context) => const AddNewFoodPage(),
          '/create-goal': (context) => const CreateGoalPage(),
        },
      ),
    );
  }
}
