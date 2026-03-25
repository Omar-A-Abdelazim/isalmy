import 'package:flutter/material.dart';
import 'package:isalmy/common/app_color.dart';
import 'package:isalmy/gen/assets.gen.dart';
import 'package:isalmy/taps/times_tab/widgets/prayer_times_carousel.dart';

class PrayerTimesCard extends StatelessWidget {
  const PrayerTimesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // الصورة الرئيسية
        Image.asset(
          Assets.timesBg.path,
          width: double.infinity,
          fit: BoxFit.contain,
        ),
        Positioned(
          left: 26,
          top: 14,
          child: Text(
            "16 Jul,\n2024",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          right: 26,
          top: 14,
          child: Text(
            "09 Muh,\n     1446",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 6,
          child: Text(
            "Pray Time",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.blackColor.withValues(alpha: 0.71),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 38,
          child: Text(
            "Tuesday",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.blackColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 250,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Next Pray",
                  style: TextStyle(
                    color: AppColor.blackColor.withValues(alpha: .75),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: " - 02:32",
                  style: TextStyle(
                    color: AppColor.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(top: 248, right: 27.5, child: Icon(Icons.volume_off)),
        Positioned(top: 80, left: 0, right: 0, child: PrayerTimesCarousel()),
      ],
    );
  }
}
