// Question model
class QuestionModel {
  List<dynamic> choices;
  int answer;
  String question;

  QuestionModel(
      {required this.choices, required this.answer, required this.question});
}
