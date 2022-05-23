import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quiz_app/screens/home/home_screen.dart';
import 'package:quiz_app/screens/splash/splash_screen.dart';
import 'package:quiz_app/widgets/custom_drop_button.dart';

class BottomNavScreen extends StatelessWidget {
  static const id = '/BottomNavScreen';

  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        title: Row(
          children: const [
            CustomDropButton(
              name: 'Class 06',
            ),
            SizedBox(
              width: 8,
            ),
            CustomDropButton(
              name: 'EN',
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () async {
              // For signing out from google as well as from firebase auth and routing to login_screen
              final GoogleSignIn googleSignIn = GoogleSignIn();
              await googleSignIn.signOut();
              await FirebaseAuth.instance.signOut();
              Get.snackbar('Info', 'Sign out success');
              Get.offAllNamed(SplashScreen.id);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_sharp), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart), label: 'My Reports'),
        ],
      ),
      body: const HomeScreen(),
    );
  }
}
