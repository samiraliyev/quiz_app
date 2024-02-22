import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Feature/Screens/Home/home.dart';
import 'package:quiz_app/Feature/Screens/Register/register_page.dart';
import 'package:quiz_app/Provider/home_provider.dart';

import '../../../Constants/Colors/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<HomeProvider>().checkUserLogin(),
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return Home();
          } else if (snapshot.data == false) {
            return RegisterPage();
          } else {
            return Scaffold(
              backgroundColor: AppColors.bgColor,
              body: Center(
                child: Lottie.asset('assets/Lottie/quizanimation.json'),
              ),
            );
          }
        });
  }
}
