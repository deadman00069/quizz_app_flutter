import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/splash/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  static const id = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      SplashScreenController()..checkIfLogin(),
    );
    return const Scaffold();
  }
}
