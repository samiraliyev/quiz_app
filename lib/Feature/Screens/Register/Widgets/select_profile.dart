import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/Path/img_path.dart';

class SelectProfile extends StatelessWidget {
  const SelectProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Image.asset(
          ImagePath.profImage,
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
