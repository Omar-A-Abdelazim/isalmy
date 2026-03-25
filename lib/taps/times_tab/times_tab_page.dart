import 'package:flutter/material.dart';
import 'package:isalmy/common/app_color.dart';
import 'package:isalmy/common/widgets/bg_layout_widget.dart';
import 'package:isalmy/common/widgets/header_widget.dart';
import 'package:isalmy/gen/assets.gen.dart';
import 'package:isalmy/taps/times_tab/widgets/prayer_times_card.dart';

class TimesTabPage extends StatelessWidget {
  const TimesTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BgLayoutWidget(imagePath: Assets.timesTabBg.path),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const HeaderWidget(),
                  const SizedBox(height: 20),
                  PrayerTimesCard(),
                  const SizedBox(height: 30),

                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: 185,
                              height: 259,
                              decoration: BoxDecoration(
                                color: AppColor.blackColor,
                                border: Border.all(
                                  width: 2,
                                  color: AppColor.goldColor,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 24),
                                  Image.asset(Assets.morningAzkar.path),
                                  Text(
                                    "Morning Azkar",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              width: 185,
                              height: 259,
                              decoration: BoxDecoration(
                                color: AppColor.blackColor,
                                border: Border.all(
                                  width: 2,
                                  color: AppColor.goldColor,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 24),
                                  Image.asset(Assets.eveningZakar.path),
                                  Text(
                                    "Evening Azkar",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
