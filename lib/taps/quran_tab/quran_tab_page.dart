import 'package:flutter/material.dart';
import 'package:isalmy/common/app_color.dart';
import 'package:isalmy/gen/assets.gen.dart';

class QuranTabPage extends StatelessWidget {
  const QuranTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.quranTabBg.path,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
