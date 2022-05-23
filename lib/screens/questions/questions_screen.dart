import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/questions/questions_screen_controller.dart';
import 'package:quiz_app/strings/strings.dart';
import 'package:quiz_app/widgets/custom_question_card.dart';

class QuestionsScreen extends StatelessWidget {
  static const id = '/QuestionsScreen';

  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // For getting arguments
    var args = Get.arguments;

    // For Initializing controller
    var controller = Get.put(
      QuestionsScreenController()..getAllQuestions(args),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          args,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.lisOfQuestions.isEmpty
                  ? Center(
                      child: Text(
                        S.nothingToShow,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: S.mastery,
                                  children: [
                                    TextSpan(
                                      text:
                                          ' ${(controller.mastery.value).toDouble()} %',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 30,
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffD1E5FF),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Stack(
                                        alignment: Alignment.topLeft,
                                        children: [
                                          LayoutBuilder(
                                            builder: (_, constrains) =>
                                                Container(
                                              width: constrains.maxWidth *
                                                  controller.mastery.value,
                                              decoration: BoxDecoration(
                                                color: const Color(0xff0177FF),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 30,
                                      child: LayoutBuilder(
                                        builder: (_, constrains) => Stack(
                                          children: [
                                            Positioned(
                                              top: 0,
                                              left: constrains.maxWidth *
                                                      controller.mastery.value -
                                                  constrains.maxWidth * .05,
                                              child: const Icon(
                                                Icons.star,
                                                size: 30,
                                                color: Color(0xffFEC850),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              CustomQuestionCard(
                                question: controller
                                    .lisOfQuestions[controller.quesNo.value],
                              ),
                            ],
                          ),
                          Center(
                            child: SizedBox(
                              height: 40,
                              child: controller.lisOfQuestions.length ==
                                      controller.quesNo.value + 1
                                  ? ElevatedButton(
                                      onPressed: () {
                                        controller.finishQuiz();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Text('Finish Quiz'),
                                      ),
                                    )
                                  : ElevatedButton(
                                      onPressed: () {
                                        controller.nextQuestion();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Text(S.nextQuestion),
                                      ),
                                    ),
                            ),
                          )
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}
