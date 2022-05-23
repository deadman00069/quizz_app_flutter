import 'package:cloud_firestore/cloud_firestore.dart';

// For getting all quiz from firestore
Future<List<String>?> getAllQuizRepo() async {
  try {
    var db = FirebaseFirestore.instance;
    List<String> quiz = [];
    var response = await db.collection("quizs").get();

    if (response.docs.isNotEmpty) {
      for (var doc in response.docs) {
        quiz.add(doc.id);
      }
      // returning list of quiz
      return quiz;
    }
    // If list is empty we will return null
    return null;
  } catch (e) {
    // If any exception occur we will return null
    return null;
  }
}
