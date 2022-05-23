import 'package:get/get.dart';
import 'package:quiz_app/repositories/score_repo.dart';

class ScoreScreenController extends GetxController {
  var isLoading = false.obs;

  // For uploading scores on db
  void uploadScore({
    required String userId,
    required String quizName,
    required String totalTime,
    required int totalCorrectAns,
    required int totalInCorrectAns,
    required int mastery,
  }) async {
    isLoading.value = true;
    var response = await uploadScoreRepo(
        userId: userId,
        quizName: quizName,
        totalTime: totalTime,
        totalCorrectAns: totalCorrectAns,
        totalInCorrectAns: totalInCorrectAns,
        mastery: mastery);
    if (response) {
      Get.snackbar('Info', 'Score upload success');
    } else {
      Get.snackbar('Info', 'Score upload fails');
    }
    isLoading.value = false;
  }
}
