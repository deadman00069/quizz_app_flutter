import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:quiz_app/screens/questions/questions_screen.dart';

class CustomPracticeCard extends StatelessWidget {
  final String index;
  final String title;
  final String attempt;
  final String mastery;

  const CustomPracticeCard(
      {Key? key,
      required this.index,
      required this.title,
      required this.attempt,
      required this.mastery})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 24, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$index.',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff176A3F),
                ),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff176A3F),
                    ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '$attempt Attempt Mastery $mastery',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400, color: Colors.black54),
              ),
            ],
          )
        ],
      ),
    );
  }
}
