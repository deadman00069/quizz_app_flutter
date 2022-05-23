import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:quiz_app/screens/questions/questions_screen_controller.dart';
import 'package:quiz_app/screens/score/score_screen_controller.dart';
import 'package:quiz_app/strings/strings.dart';

class ScoreScreen extends StatelessWidget {
  static const id = '/ScoreScreen';

  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionsScreenController questionScreenController = Get.find();

    // Initializing controller
    final controller = Get.put(
      ScoreScreenController()
        ..uploadScore(
          userId: questionScreenController.userId!,
          quizName: questionScreenController.kQuizName!,
          totalTime: questionScreenController.totalTime.value.toString(),
          totalCorrectAns: questionScreenController.noOfCorrectAnswer.value,
          totalInCorrectAns: questionScreenController.noOfInCorrectAnswer.value,
          mastery: (questionScreenController.mastery.value * 100).toInt(),
        ),
    );
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/medal.png'),
                    const SizedBox(
                      height: 32,
                    ),
                    Column(
                      children: [
                        Text(
                          S.wellDone,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          S.totalCorrectAnswer +
                              questionScreenController.noOfCorrectAnswer.value
                                  .toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          S.totalInCorrectAnswer +
                              questionScreenController.noOfInCorrectAnswer.value
                                  .toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '${S.mastery} : ${questionScreenController.mastery.value * 100}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.offNamedUntil(BottomNavScreen.id, (route) => false);
                      },
                      child: const Text(S.close),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
