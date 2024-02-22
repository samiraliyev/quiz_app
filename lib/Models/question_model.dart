// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuestionModel {
  final int correctAnswer;
  final String title;
  final List<dynamic> options;
  final int point = 5;

  final int questionCount;

  QuestionModel(
      {required this.questionCount,
      required this.correctAnswer,
      required this.title,
      required this.options});
}

List<QuestionModel> questionList = [
  QuestionModel(
    questionCount: 1,
    correctAnswer: 2,
    title:
        "What is the radius of a circle that has a circumference of 3.14 meters?",
    options: [3, 5, 6],
  ),
  QuestionModel(
    questionCount: 2,
    correctAnswer: 0,
    title:
        "Carlos is looking to buy a house where the floor plan shows the ratio of the area of the living room to the kitchen to the bedroom is 5 : 3 : 4. If the combined area of those three rooms is 360 square feet, how much larger, in square feet, is the living room than the bedroom?",
    options: [30, 45, 2],
  ),
  QuestionModel(
    questionCount: 3,
    correctAnswer: 1,
    title:
        "A florist hired this moving company to move 578 clay pots. The moving company lost 6 pots, broke 12 pots, and delivered the rest of the pots safely. How much did the florist pay the moving company?",
    options: [2440, 2350, 2512],
  ),
];
