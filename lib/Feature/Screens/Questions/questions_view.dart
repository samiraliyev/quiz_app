import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Constants/Strings/strings.dart';
import 'package:quiz_app/Feature/Components/Buttons/answer_button.dart';
import 'package:quiz_app/Models/question_model.dart';
import 'package:quiz_app/Provider/home_provider.dart';

import '../../../Constants/Colors/colors.dart';
import '../../Components/Buttons/next.dart';

class QuestoinsView extends StatefulWidget {
  const QuestoinsView({super.key});

  @override
  State<QuestoinsView> createState() => _QuestoinsViewState();
}

class _QuestoinsViewState extends State<QuestoinsView> {
  @override
  Widget build(BuildContext context) {
    bool isLastQuestion =
        context.watch<HomeProvider>().questionIndex == questionList.length - 1;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            context.route.pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: PageView.builder(
          controller: context.watch<HomeProvider>().controller,
          itemCount: questionList.length,
          itemBuilder: (context, indexPage) {
            return Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Question ${questionList[indexPage].questionCount.toString()} / ${questionList.length}",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      ),
                      DottedLine(
                        dashColor: Colors.white,
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      questionList[indexPage].title,
                      style: TextStyle(color: Colors.white, fontSize: 22.0),
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                        itemCount: questionList[indexPage].options.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: context
                                        .watch<HomeProvider>()
                                        .selectAnswerIndex ==
                                    null
                                ? () {
                                    context
                                        .read<HomeProvider>()
                                        .pickAnswer(indexPage, index);
                                  }
                                : null,
                            child: AnswerButton(
                              correctAnswerIndex:
                                  questionList[indexPage].correctAnswer,
                              currentIndex: index,
                              isSelected: context
                                      .watch<HomeProvider>()
                                      .selectAnswerIndex ==
                                  index,
                              selectedAnswerIndex: context
                                  .watch<HomeProvider>()
                                  .selectAnswerIndex,
                              answerText: questionList[indexPage]
                                  .options[index]
                                  .toString(),
                            ),
                          );
                        }),
                  ),
                  Center(
                    child: isLastQuestion
                        ? NextButton(
                            buttonName: AppStrings.finishBtnName,
                            opTap: context
                                        .watch<HomeProvider>()
                                        .selectAnswerIndex !=
                                    null
                                ? context.read<HomeProvider>().nextQuestion
                                : null,
                          )
                        : NextButton(
                            buttonName: AppStrings.btnName,
                            opTap: context
                                        .watch<HomeProvider>()
                                        .selectAnswerIndex !=
                                    null
                                ? context.read<HomeProvider>().nextQuestion
                                : null,
                          ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
