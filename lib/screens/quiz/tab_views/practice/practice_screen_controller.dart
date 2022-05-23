import 'package:get/get.dart';
import 'package:quiz_app/repositories/quiz_repo.dart';

class PracticeScreenController extends GetxController {
  var loading = false.obs;
  var listOfQuiz = RxList<String>();

  @override
  void onInit() {
    super.onInit();
    getAllQuiz();
  }

  // For getting all quiz from repo
  void getAllQuiz() async {
    loading.value = true;
    var response = await getAllQuizRepo();
    if (response != null) {
      listOfQuiz.value = response;
    }
    loading.value = false;
  }
}
