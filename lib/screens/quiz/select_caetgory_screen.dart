import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/quiz/tab_views/books/books_screen.dart';
import 'package:quiz_app/screens/quiz/tab_views/notes/notes_screen.dart';
import 'package:quiz_app/screens/quiz/tab_views/practice/practice_screen.dart';
import 'package:quiz_app/screens/quiz/tab_views/video/video_screen.dart';
import 'package:quiz_app/strings/strings.dart';

// This screen is responsible for selecting tabs
class SelectCategoryScreen extends StatelessWidget {
  static const id = '/SelectCategoryScreen';

  const SelectCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            'Math',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(S.img),
            ),
          ],
          bottom: TabBar(
            labelStyle: Theme.of(context).textTheme.bodyLarge!,
            unselectedLabelColor: Colors.black54,
            indicatorColor: Colors.green,
            labelColor: Colors.black,
            tabs: const [
              Tab(
                text: 'Videos',
              ),
              Tab(
                text: 'Practice',
              ),
              Tab(
                text: 'Notes',
              ),
              Tab(
                text: 'Books',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            VideoScreen(),
            PracticeTabScreen(),
            NotesScreen(),
            BooksScreen(),
          ],
        ),
      ),
    );
  }
}
