// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quiz_app/Constants/Colors/colors.dart';

class NextButton extends StatefulWidget {
  const NextButton({
    Key? key,
    required this.opTap,
    required this.buttonName,
  }) : super(key: key);
  final VoidCallback? opTap;
  final String buttonName;
  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.btnColor),
      child: Text(
        widget.buttonName,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
        ),
      ),
      onPressed: widget.opTap,
    );
  }
}
