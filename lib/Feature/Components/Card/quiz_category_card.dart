import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:quiz_app/Constants/Colors/colors.dart';
import 'package:quiz_app/Constants/Strings/strings.dart';
import 'package:quiz_app/Feature/Screens/Questions/questions_view.dart';

class QuizCategoryCard extends StatefulWidget {
  const QuizCategoryCard({super.key});

  @override
  State<QuizCategoryCard> createState() => _QuizCategoryCardState();
}

class _QuizCategoryCardState extends State<QuizCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        context.route.navigateToPage(QuestoinsView());
      },
      child: Stack(
        children: [
          SizedBox(
            height: 150,
          ),
          Container(
            width: double.infinity,
            height: 120,
            child: Card(
              color: AppColors.btnColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Image.asset("assets/Images/mathcategory.png"),
                    SizedBox(width: 8),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.quizTitleMath,
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          Text(
                            'step 03 / 10',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12.0),
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: 200,
                            child: LinearProgressIndicator(
                              value: 0.1,
                              backgroundColor: Colors.grey,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 209, 161, 158),
                    Color.fromARGB(255, 230, 106, 147),
                  ],
                ),
              ),
              child: Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
            top: 100,
            right: 20,
          )
        ],
      ),
    );
  }
}
