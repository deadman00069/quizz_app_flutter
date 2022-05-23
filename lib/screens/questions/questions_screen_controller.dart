import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/repositories/questions_repo.dart';
import 'package:quiz_app/screens/score/score_screen.dart';

class QuestionsScreenController extends GetxController {
  // All variables
  var isLoading = false.obs;
  var lisOfQuestions = RxList<QuestionModel>(); // List of all questions
  var quesNo = 0.obs; // At which ques no we are
  var noOfCorrectAnswer = 0.obs; // Total correct answer
  var noOfInCorrectAnswer = 0.obs; // Total incorrect answer
  var mastery = 0.0.obs;
  var isAnswered = false.obs; // For user to answer each ques only once
  Rx<int> correctAnswer = 0.obs; // For saving correct answer
  Rx<int> selectedAnswer = 0.obs; // For saving answer selected by user
  String? userId; // For saving uId we get from firebase auth
  String? kQuizName; // For saving quiz name
  late Timer _timer;
  var totalTime =
      0.obs; // For saving total time taken by user to complete quiz in seconds

  @override
  void onInit() {
    getUserId();
    startTimer();
    super.onInit();
  }

  // For getting uId
  void getUserId() {
    userId = FirebaseAuth.instance.currentUser!.uid;
  }

  // For stating timer
  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        // For every second this timer will run this block of code
        // We are increasing value of totalTime by 1 every second
        totalTime++;
      },
    );
  }

  // For getting all ques from repo
  void getAllQuestions(String quizName) async {
    isLoading.value = true;
    kQuizName = quizName;
    var response = await getAllQuestionsRepo(quizName);
    if (response != null) {
      lisOfQuestions.value = response;
    }
    isLoading.value = false;
    update();
  }

  // For checking if user answer is correct
  void checkIfCorrect(int index, QuestionModel ques) {
    if (!isAnswered.value) {
      correctAnswer.value = ques.answer;
      selectedAnswer.value = index;
      if (correctAnswer.value == selectedAnswer.value) {
        noOfCorrectAnswer.value++;
        mastery.value = (noOfCorrectAnswer.value / lisOfQuestions.length);
      } else {
        noOfInCorrectAnswer.value++;
      }
    }
    isAnswered.value = true;
    update();
  }

  // When user press on next button
  void nextQuestion() {
    isAnswered.value = false;
    quesNo.value++;
    correctAnswer.value = 0;
    selectedAnswer.value = 0;
  }

  // For finishing quiz
  void finishQuiz() {
    Get.offNamed(ScoreScreen.id);
    _timer.cancel();
  }

  // For disposing all controllers and listeners
  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
