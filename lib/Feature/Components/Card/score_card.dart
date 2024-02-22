import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Constants/Colors/colors.dart';
import 'package:quiz_app/Provider/home_provider.dart';

class ScoreCard extends StatefulWidget {
  const ScoreCard({super.key});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  String scoreIcon = 'assets/Icons/score.png';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor,
      child: Center(
        child: Card(
            color: AppColors.cardColor,
            child: SizedBox(
              width: double.infinity,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.sports_score,
                    size: 60.0,
                    color: Colors.white,
                  ),
                  Text(
                    'Your score:  ${context.watch<HomeProvider>().score} ',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
