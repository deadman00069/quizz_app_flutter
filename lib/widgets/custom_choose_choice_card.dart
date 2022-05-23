import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/screens/questions/questions_screen_controller.dart';

class CustomChooseChoiceCard extends StatelessWidget {
  final int index;
  final QuestionModel question;
  final dynamic option;

  const CustomChooseChoiceCard({
    Key? key,
    required this.index,
    required this.question,
    required this.option,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GetBuilder<QuestionsScreenController>(
        init: QuestionsScreenController(),
        builder: (controller) {
          // Getting state of options
          // There are 3 states
          // 1. Default
          // 2. Correct
          // 3. Incorrect
          String getCurrentState() {
            if (controller.isAnswered.value) {
              if (index == controller.correctAnswer.value) {
                return 'Correct';
              } else if (index == controller.selectedAnswer.value &&
                  controller.selectedAnswer.value !=
                      controller.correctAnswer.value) {
                return 'InCorrect';
              }
            }
            return 'Default';
          }

          return Directionality(
            textDirection: TextDirection.rtl,
            child: TextFormField(
              onTap: () {
                controller.checkIfCorrect(index, question);
              },
              controller: TextEditingController(text: option.toString()),
              readOnly: true,
              textAlign: TextAlign.left,
              keyboardType: TextInputType.multiline,
              maxLines: 1,
              decoration: InputDecoration(
                // suffixIcon: Icon(Icons.add),
                suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    getCurrentState() == 'Default'
                        ? CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            radius: 12,
                            child: Text(
                              'a',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          )
                        : getCurrentState() == 'Correct'
                            ? CircleAvatar(
                                backgroundColor: Colors.green.shade100,
                                radius: 12,
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 16,
                                ),
                              )
                            : CircleAvatar(
                                backgroundColor: Colors.red.shade100,
                                radius: 12,
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 16,
                                ),
                              ),
                  ],
                ),
                labelText: getCurrentState() == 'Default'
                    ? ''
                    : getCurrentState() == 'Correct'
                        ? 'Correct'
                        : 'InCorrect',
                labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: getCurrentState() == 'Correct'
                        ? Colors.green
                        : Colors.red),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: getCurrentState() == 'Default'
                        ? Colors.black26
                        : getCurrentState() == 'Correct'
                            ? Colors.green
                            : Colors.red,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    color: getCurrentState() == 'Default'
                        ? Colors.black26
                        : getCurrentState() == 'Correct'
                            ? Colors.green
                            : Colors.red,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
