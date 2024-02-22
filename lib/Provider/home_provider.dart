import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_app/Picker/pick_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/question_model.dart';

class HomeProvider extends ChangeNotifier {
  String username = '';
  bool logged = false;
  XFile? selectImage;
  String? selectPath;
  int score = 0;
  int? selectAnswerIndex;
  int questionIndex = 0;

  final PageController controller = PageController();

  void fetchUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    username = prefs.getString("name") ?? "empty";
    notifyListeners();
  }

  Future<bool> checkUserLogin() async {
    await Future.delayed(
      Duration(seconds: 3),
    );
    final prefs = await SharedPreferences.getInstance();

    logged = prefs.getBool('logged') ?? false;

    print(logged);
    notifyListeners();
    return logged;
  }

  Future<void> pickUserImage() async {
    selectImage = await PickImage().pickImageFromGalery();
    selectPath = await selectImage?.path;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("image", selectPath ?? '');
    notifyListeners();
  }

  void fetchUserImage() async {
    final prefs = await SharedPreferences.getInstance();
    selectPath = await prefs.getString("image");
    notifyListeners();
  }

  Future<void> pickAnswer(int pageIndex, int value) async {
    selectAnswerIndex = value;
    if (selectAnswerIndex == questionList[pageIndex].correctAnswer) {
      score = score + 5;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt("score", score);
    }
    notifyListeners();
  }

  Future<void> getScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    score = prefs.getInt("score") ?? 0;
    // print(score);
  }

  void nextQuestion() {
    questionIndex++;
    controller.jumpToPage(questionIndex);
    selectAnswerIndex = null;
    notifyListeners();
  }
}
