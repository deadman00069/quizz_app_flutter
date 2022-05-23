import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:quiz_app/screens/questions/questions_screen.dart';
import 'package:quiz_app/screens/quiz/tab_views/practice/practice_screen_controller.dart';
import 'package:quiz_app/widgets/custom_pratice_card.dart';

class PracticeTabScreen extends StatelessWidget {
  const PracticeTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PracticeScreenController());

    return Obx(
      () => controller.loading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.only(top: 24),
              itemBuilder: (_, index) => InkWell(
                onTap: () {
                  Get.toNamed(
                    QuestionsScreen.id,
                    arguments: controller.listOfQuiz[index],
                  );
                },
                splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
                child: CustomPracticeCard(
                  index: index.toString(),
                  title: controller.listOfQuiz[index],
                  attempt: '0',
                  mastery: '0%',
                ),
              ),
              itemCount: controller.listOfQuiz.length,
            ),
    );
  }
}
