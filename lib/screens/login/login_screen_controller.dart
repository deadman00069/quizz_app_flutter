import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quiz_app/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:quiz_app/screens/verification/verification_screen.dart';

class LoginScreenController extends GetxController {
  // Defining all variables
  var isLoading = false.obs;
  final GlobalKey<FormState> key = GlobalKey();
  final TextEditingController phoneNumberTED = TextEditingController();
  final _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  // For signing in using google
  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Signing in using credential created above
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Navigating to bottom_nav_screen
      Get.offNamed(BottomNavScreen.id);
    } catch (e) {
      // If any exception occur
      debugPrint(e.toString());

      //Showing error toast
      Get.snackbar(
        'Error',
        'Sign in fails',
      );
    }
    isLoading.value = false;
  }

  // Validating phone no field
  String? validatePhoneNumber(String? v) {
    if (v!.isEmpty) {
      return 'This filed is required';
    }
    if (v.length != 10) {
      return 'Please enter valid phone number';
    }
    if (!v.isPhoneNumber) {
      return 'Only numbers are allowed';
    }
    return null;
  }

  // Saving phone no
  void savePhoneNo(String? v) {
    phoneNumberTED.text = v!;
  }

  // When user press on continue button
  void onContinueButtonPressed() {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      // Routing to verify otp screen
      Get.toNamed(VerificationScreen.id, arguments: phoneNumberTED.text);
    }
  }

  // For disposing all controllers and listeners
  @override
  void onClose() {
    phoneNumberTED.dispose();
    super.onClose();
  }
}
