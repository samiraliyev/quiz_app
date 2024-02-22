// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    Key? key,
    required this.answerText,
    required this.isSelected,
    required this.currentIndex,
    required this.correctAnswerIndex,
    required this.selectedAnswerIndex,
  }) : super(key: key);

  final String answerText;
  final bool isSelected;

  final int currentIndex;
  final int? correctAnswerIndex;
  final int? selectedAnswerIndex;

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentIndex == correctAnswerIndex;
    bool isWrongAnswer = !isCorrectAnswer && isSelected;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: selectedAnswerIndex != null
          ? Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.teal,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      answerText,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  isCorrectAnswer
                      ? Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : isWrongAnswer
                          ? Icon(
                              Icons.close,
                              color: Colors.red,
                            )
                          : SizedBox.shrink(),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.teal,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        answerText,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ]),
            ),
    );
  }
}
