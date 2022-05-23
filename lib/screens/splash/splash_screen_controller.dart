import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:quiz_app/screens/login/login_screen.dart';

class SplashScreenController extends GetxController {
  late User? user;

  // Checking if user is logged in or not
  void checkIfLogin() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Get.toNamed(BottomNavScreen.id);
      } else {
        Get.toNamed(LoginScreen.id);
      }
      FlutterNativeSplash.remove();
    });
  }
}
