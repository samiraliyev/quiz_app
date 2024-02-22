import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Constants/Colors/colors.dart';
import 'package:quiz_app/Constants/Strings/strings.dart';
import 'package:quiz_app/Feature/Components/Card/score_card.dart';
import 'package:quiz_app/Provider/home_provider.dart';

import '../../Components/Card/quiz_category_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().fetchUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: [
          ClipOval(
            child: Image.file(
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              File(context.watch<HomeProvider>().selectPath!),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScoreCard(),
              SizedBox(height: 10.0),
              Text(
                AppStrings.quiz,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              QuizCategoryCard(),
            ],
          ),
        ),
      ),
    );
  }
}
