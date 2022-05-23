import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/route_manager.dart';
import 'package:quiz_app/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:quiz_app/screens/login/login_screen.dart';
import 'package:quiz_app/screens/questions/questions_screen.dart';
import 'package:quiz_app/screens/quiz/select_caetgory_screen.dart';
import 'package:quiz_app/screens/score/score_screen.dart';
import 'package:quiz_app/screens/splash/splash_screen.dart';
import 'package:quiz_app/screens/verification/verification_screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Slang Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
          name: SplashScreen.id,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: LoginScreen.id,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: VerificationScreen.id,
          page: () => const VerificationScreen(),
        ),
        GetPage(
          name: BottomNavScreen.id,
          page: () => const BottomNavScreen(),
        ),
        GetPage(
          name: SelectCategoryScreen.id,
          page: () => const SelectCategoryScreen(),
        ),
        GetPage(
          name: QuestionsScreen.id,
          page: () => const QuestionsScreen(),
        ),
        GetPage(
          name: ScoreScreen.id,
          page: () => const ScoreScreen(),
        ),
      ],
      initialRoute: SplashScreen.id,
    );
  }
}
