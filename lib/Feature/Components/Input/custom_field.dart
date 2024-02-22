import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/Colors/colors.dart';
import 'package:quiz_app/Constants/Strings/strings.dart';

class CustomField extends StatelessWidget {
  const CustomField({super.key, required this.textEditingController});
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextField(
          controller: textEditingController,
          decoration: const InputDecoration(
            hintText: AppStrings.hintUsername,
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
