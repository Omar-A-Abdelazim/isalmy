import 'package:flutter/material.dart';
import 'package:isalmy/common/app_color.dart';
import 'package:isalmy/common/widgets/header_widget.dart';
import 'package:isalmy/data/static/onboarding_data.dart';
import 'package:isalmy/gen/assets.gen.dart';
import 'package:isalmy/screens/onboarding/widgets/onboarding_body_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static const routeName = "OnboardingScreen";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(top: 16, left: 0, right: 0, child: HeaderWidget()),
            Positioned(
              top: 250,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height - 270,
              child: PageView(
                children: [
                  OnBoardingBodyWidget(
                    controller: _controller,
                    title: Onboarding[0].title,
                    subTitle: Onboarding[0].subTitle,
                    image: Onboarding[0].image,
                  ),
                  OnBoardingBodyWidget(
                    controller: _controller,
                    title: Onboarding[1].title,
                    subTitle: Onboarding[1].subTitle,
                    image: Onboarding[1].image,
                  ),
                  OnBoardingBodyWidget(
                    controller: _controller,
                    title: Onboarding[2].title,
                    subTitle: Onboarding[2].subTitle,
                    image: Onboarding[2].image,
                  ),
                  OnBoardingBodyWidget(
                    controller: _controller,
                    title: Onboarding[3].title,
                    subTitle: Onboarding[3].subTitle,
                    image: Onboarding[3].image,
                  ),
                  OnBoardingBodyWidget(
                    controller: _controller,
                    title: Onboarding[4].title,
                    subTitle: Onboarding[4].subTitle,
                    image: Onboarding[4].image,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              left: 150,
              child: SmoothPageIndicator(
                controller: _controller,
                count: 5,
                effect: SwapEffect(
                  dotWidth: 7,
                  dotHeight: 7,
                  dotColor: AppColor.grayColor,
                  activeDotColor: AppColor.goldColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
