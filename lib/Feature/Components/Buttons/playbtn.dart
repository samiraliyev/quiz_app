import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/Colors/colors.dart';

import '../../../Constants/Strings/strings.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key, required this.onpressed});
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.btnColor),
      onPressed: onpressed,
      child: const Center(
        child: Text(
          AppStrings.play,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
