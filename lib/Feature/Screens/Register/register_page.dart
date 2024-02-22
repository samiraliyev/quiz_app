import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Constants/Strings/strings.dart';
import 'package:quiz_app/Feature/Components/Buttons/playbtn.dart';
import 'package:quiz_app/Provider/home_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Constants/Colors/colors.dart';
import '../../Components/Input/custom_field.dart';
import '../Home/home.dart';
import 'Widgets/select_profile.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
                onTap: () async {
                  await context.read<HomeProvider>().pickUserImage();
                },
                child: context.watch<HomeProvider>().selectPath != null
                    ? Center(
                        child: ClipOval(
                          child: Image.file(
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                              File(context.watch<HomeProvider>().selectPath!)),
                        ),
                      )
                    : const SelectProfile()),
            const SizedBox(height: 10.0),
            const Text(
              AppStrings.welcome,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            const SizedBox(height: 10.0),
            CustomField(
              textEditingController: userNameController,
            ),
            const SizedBox(height: 10.0),
            PlayButton(
              onpressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setString("name", userNameController.text);
                prefs.setBool("logged", true);

                context.route.navigateToPage(const Home());
              },
            )
          ],
        ),
      ),
    );
  }
}
