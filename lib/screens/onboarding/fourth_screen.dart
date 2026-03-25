import 'package:flutter/material.dart';
import 'package:isalmy/common/app_color.dart';
import 'package:isalmy/gen/assets.gen.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Image.asset(
              Assets.onboardingBgFour.path,
              width: MediaQuery.of(context).size.width * 0.925,
              height: MediaQuery.of(context).size.height * 0.445,

              fit: BoxFit.fill,
            ),
          ),
          Spacer(),
          Text(
            textAlign: TextAlign.center,
            "Bearish",
            style: TextStyle(
              color: AppColor.goldColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              textAlign: TextAlign.center,
              "Praise the name of your Lord, the Most High",
              style: TextStyle(
                color: AppColor.goldColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
