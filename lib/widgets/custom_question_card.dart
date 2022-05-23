import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/widgets/custom_choose_choice_card.dart';

class CustomQuestionCard extends StatelessWidget {
  final QuestionModel question;

  const CustomQuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            question.question,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        SizedBox(
          height: 320,
          child: ListView.builder(
            itemBuilder: (_, index) => CustomChooseChoiceCard(
              question: question,
              index: index,
              option: question.choices[index],
            ),
            itemCount: question.choices.length,
          ),
        )
      ],
    );
  }
}
