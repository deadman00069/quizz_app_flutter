import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/login/login_screen_controller.dart';
import 'package:quiz_app/strings/strings.dart';

class LoginScreen extends StatelessWidget {
  static const id = '/LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginScreenController());
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Image.asset(
                            'assets/answer.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Form(
                            key: controller.key,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Center(
                                  child: Text(
                                    S.letsGetStarted,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                Text(
                                  S.enterYourMobileNumber,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        color: Colors.black45,
                                      ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  controller: controller.phoneNumberTED,
                                  validator: controller.validatePhoneNumber,
                                  onSaved: controller.savePhoneNo,
                                  decoration: InputDecoration(
                                    prefixIcon: SizedBox(
                                      child: Center(
                                        widthFactor: 0.0,
                                        child: Text(
                                          '+91 - ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontWeight: FontWeight.w400,
                                              ),
                                        ),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                          // width: 0,
                                          style: BorderStyle.solid,
                                          color: Colors.black26),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                          // width: 0,
                                          style: BorderStyle.solid,
                                          color: Colors.black26),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        // width: 0,
                                        style: BorderStyle.solid,
                                        color: Colors.red,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        // width: 0,
                                        style: BorderStyle.solid,
                                        color: Colors.red,
                                      ),
                                    ),
                                    filled: true,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[800]),
                                    fillColor: Colors.white,
                                    hintText: "0000000000",
                                    isDense: true,
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                SizedBox(
                                  height: 48,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Get.toNamed(BottomNavScreen.id);
                                      controller.onContinueButtonPressed();
                                    },
                                    child: const Text(S.stringContinue),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 20,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Expanded(
                                        child: Divider(
                                          thickness: 2,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Text(
                                          S.orContinueWith,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                      ),
                                      const Expanded(
                                        child: Divider(
                                          thickness: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                SizedBox(
                                  height: 48,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                Colors.white,
                                              ),
                                            ),
                                            onPressed: () {
                                              controller.signInWithGoogle();
                                            },
                                            child: Image.asset(
                                              'assets/g_icon.png',
                                              height: 24,
                                            )),
                                      ),
                                      const Expanded(
                                        child: SizedBox(),
                                        flex: 1,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              Colors.black,
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Icon(Icons.apple),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
