import 'package:cloud_firestore/cloud_firestore.dart';

// For uploading scores data in firestore
Future<bool> uploadScoreRepo({
  required String userId,
  required String quizName,
  required String totalTime,
  required int totalCorrectAns,
  required int totalInCorrectAns,
  required int mastery,
}) async {
  var db = FirebaseFirestore.instance;
  try {
    // For getting number of attempts from db
    // as structure of score is
    // users->userId->quiz_name->1(attempt)->score
    var attempt =
        await db.collection('users').doc(userId).collection(quizName).get();
    // Setting all values to db
    await db
        .collection('users')
        .doc(userId)
        .collection(quizName)
        .doc((attempt.size + 1).toString())
        .set(
          ({
            'total_time': '$totalTime seconds',
            'total_correct_ans': totalCorrectAns,
            'total_incorrect_ans': totalInCorrectAns,
            'mastery': mastery,
          }),
        );
    // Returning true when value are set to db
    return true;
  } catch (e) {
    // If any exception occur we will return false
    return false;
  }
}
