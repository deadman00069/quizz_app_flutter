import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz_app/screens/verification/verification_screen_controller.dart';
import 'package:quiz_app/strings/strings.dart';

import '../../widgets/custom_pin_field.dart';

class VerificationScreen extends StatelessWidget {
  static const id = '/VerificationScreen';

  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneNumber = Get.arguments;
    final controller = Get.put(
      VerificationScreenController()..verifyPhoneNumber(phoneNumber),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: Theme.of(context).brightness == Brightness.light
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Obx(
          () => Form(
            key: controller.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  S.verification,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.black,
                      ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  S.weHaveSendVerificationCode,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.black45),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '+91-$phoneNumber',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.black87),
                ),
                const SizedBox(
                  height: 34,
                ),
                CustomPinField(
                  onComplete: (v) {
                    controller.smsCode = v;
                  },
                  smsTED: controller.smsTED,
                ),
                const SizedBox(
                  height: 51,
                ),
                controller.isLoading.value
                    ? ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black12),
                        ),
                        onPressed: () {},
                        child: const Text(S.verification),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          controller.onVerificationButtonPressed();
                        },
                        child: const Text(S.verification),
                      ),
                const SizedBox(
                  height: 51,
                ),
                controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
