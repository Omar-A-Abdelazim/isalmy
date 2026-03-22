import 'package:flutter/material.dart';
import 'package:isalmy/common/app_color.dart';

class BgLayoutWidget extends StatelessWidget {
  const BgLayoutWidget({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePath,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.blackColor,
                AppColor.blackColor.withValues(alpha: 0.7),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ],
    );
  }
}
