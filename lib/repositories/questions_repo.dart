import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/models/question_model.dart';

// For getting all questions of particular quiz from firestore
Future<List<QuestionModel>?> getAllQuestionsRepo(String quiz) async {
  try {
    var db = FirebaseFirestore.instance;
    List<QuestionModel> questions = [];
    var response =
        await db.collection("quizs").doc(quiz).collection('questions').get();
    if (response.docs.isNotEmpty) {
      for (var doc in response.docs) {
        questions.add(
          QuestionModel(
            question: doc.data()['question'],
            answer: doc.data()['answer'],
            choices: doc.data()['choices'],
          ),
        );
      }
      // returning list of questions
      return questions;
    }
    // If list is empty we will return null
    return null;
  } catch (e) {
    // If any exception occur we will return null
    return null;
  }
}
