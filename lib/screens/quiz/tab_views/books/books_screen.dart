import 'package:flutter/material.dart';
import 'package:quiz_app/strings/strings.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        S.nothingToShow,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
