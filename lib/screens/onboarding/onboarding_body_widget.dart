import 'package:flutter/material.dart';
import 'package:isalmy/common/app_color.dart';

class OnBoardingBodyWidget extends StatelessWidget {
  String title;
  String subTitle;
  String image;
  OnBoardingBodyWidget({
    super.key,
    required PageController controller,
    required this.title,
    required this.subTitle,
    required this.image,
  }) : _controller = controller;

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        Column(
          children: [
            Image.asset(image, height: 338),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                color: AppColor.goldColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              textAlign: TextAlign.center,
              subTitle,
              style: TextStyle(
                color: AppColor.goldColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
