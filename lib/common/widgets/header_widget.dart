import 'package:flutter/material.dart';
import 'package:isalmy/gen/assets.gen.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Image.asset(Assets.imgHeader.path, width: 300, height: 140)],
    );
  }
}
