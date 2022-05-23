import 'package:flutter/material.dart';

class CustomDropButton extends StatelessWidget {
  final String name;
  const CustomDropButton({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff73ADFF).withOpacity(.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: Row(
          children: [
            Text(
               name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: const Color(0xff0177FF),
                  ),
            ),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}
