import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/bottom_nav/bottom_nav_screen.dart';

class VerificationScreenController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> key = GlobalKey();
  final TextEditingController smsTED = TextEditingController();
  var isLoading = false.obs;
  var smsCode = '';
  var localVerificationId = '';

  // For sending otp to entered number
  void verifyPhoneNumber(String phoneNo) async {
    isLoading.value = true;
    await auth.verifyPhoneNumber(
      phoneNumber: '+91$phoneNo',

      // When auto fetch otp occurs
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },

      // When code send success
      codeSent: (String verificationId, int? forceResendingToken) async {
        Get.snackbar('Information', 'Otp Send Success');
        localVerificationId = verificationId;
        isLoading.value = false;
        update();
      },

      // If any exception occurs
      verificationFailed: (FirebaseAuthException error) {
        if (error.code == 'invalid-phone-number') {
          Get.snackbar("Error", 'The provided phone number is not valid.');
          return;
        }
        Get.snackbar("Error", error.message!);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  // When user press on verify button
  void onVerificationButtonPressed() async {
    if (key.currentState!.validate()) {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: localVerificationId, smsCode: smsCode);

      try {
        // Signing in with credential created above
        await auth.signInWithCredential(credential).then((value) {
          if (value.user != null) {
            Get.snackbar('Info', 'Verification success');
            Get.toNamed(BottomNavScreen.id);
            return;
          }
          Get.snackbar('Info', 'Verification Fails');
        });
      } on FirebaseAuthException catch (e) {
        // If user enters invalid code
        if (e.code == 'invalid-verification-code') {
          Get.snackbar(
            'Info',
            'Invalid OTP',
          );
        }
        // If verification id doesn't match
        else if (e.code == 'invalid-verification-id') {
          Get.snackbar(
            'Info',
            'Invalid OTP',
          );
        }
        // If other exception occurs
        else {
          Get.snackbar(
            'Info',
            'Something went wrong,please try again later',
          );
        }
      }
    }
  }
}
