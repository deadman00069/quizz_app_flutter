import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/quiz/select_caetgory_screen.dart';
import 'package:quiz_app/strings/strings.dart';
import 'package:quiz_app/widgets/custom_book_button.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: RichText(
              text: TextSpan(
                text: 'Your ',
                children: [
                  TextSpan(
                    text: 'Subjects',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ],
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (_, index) => GestureDetector(
                onTap: () {
                  Get.toNamed(SelectCategoryScreen.id);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/iprep-7f10a.appspot.com/o/subject_icon%2F%E0%A4%97%E0%A4%A3%E0%A4%BF%E0%A4%A4.png?alt=media&token=3eedd4f8-751c-4ed0-8940-5f2b210f09ed',
                      width: 60,
                      height: 60,
                    ),
                    Text(
                      'Math',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              childCount: 10,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: .9,
              crossAxisSpacing: 8,
              mainAxisSpacing: 16,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              S.books,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: Wrap(
              spacing: 10,
              children: const [
                CustomBookButton(
                  title: 'Arts and History',
                  subTitle: '21 Books',
                  url:
                      'https://firebasestorage.googleapis.com/v0/b/iprep-7f10a.appspot.com/o/subject_icon%2F%E0%A4%B5%E0%A4%BF%E0%A4%9C%E0%A5%8D%E0%A4%9E%E0%A4%BE%E0%A4%A8.png?alt=media&token=a7e41736-1e8b-4bcb-b5e1-f694719c9964',
                ),
                CustomBookButton(
                  title: 'Inspirational',
                  subTitle: '53 Books',
                  url:
                      'https://firebasestorage.googleapis.com/v0/b/iprep-7f10a.appspot.com/o/subject_icon%2F%E0%A4%B5%E0%A4%BF%E0%A4%9C%E0%A5%8D%E0%A4%9E%E0%A4%BE%E0%A4%A8.png?alt=media&token=a7e41736-1e8b-4bcb-b5e1-f694719c9964',
                ),
                CustomBookButton(
                  title: 'Science',
                  subTitle: '100 Books',
                  url:
                      'https://firebasestorage.googleapis.com/v0/b/iprep-7f10a.appspot.com/o/subject_icon%2F%E0%A4%B5%E0%A4%BF%E0%A4%9C%E0%A5%8D%E0%A4%9E%E0%A4%BE%E0%A4%A8.png?alt=media&token=a7e41736-1e8b-4bcb-b5e1-f694719c9964',
                ),
                CustomBookButton(
                  title: 'Social and Environment',
                  subTitle: '100 Books',
                  url:
                      'https://firebasestorage.googleapis.com/v0/b/iprep-7f10a.appspot.com/o/subject_icon%2F%E0%A4%B5%E0%A4%BF%E0%A4%9C%E0%A5%8D%E0%A4%9E%E0%A4%BE%E0%A4%A8.png?alt=media&token=a7e41736-1e8b-4bcb-b5e1-f694719c9964',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
