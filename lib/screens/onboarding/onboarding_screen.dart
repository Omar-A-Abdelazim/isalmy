import 'package:flutter/material.dart';
import 'package:isalmy/common/app_color.dart';
import 'package:isalmy/common/widgets/header_widget.dart';
import 'package:isalmy/screens/home_screen.dart';
import 'package:isalmy/screens/onboarding/first_screen.dart';
import 'package:isalmy/screens/onboarding/second_screen.dart';
import 'package:isalmy/screens/onboarding/third_screen.dart';
import 'package:isalmy/screens/onboarding/fourth_screen.dart';
import 'package:isalmy/screens/onboarding/fifth_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static const routeName = "OnboardingScreen";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (currentPage < 4) {
      _controller.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushNamed(HomeScreen.routeName);
    }
  }

  void _previousPage() {
    if (currentPage > 0) {
      _controller.animateToPage(
        currentPage - 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isLastPage = currentPage == 4;
    final bool showBackButton = currentPage > 0;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(20.0), child: HeaderWidget()),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (value) {
                  setState(() => currentPage = value);
                },
                children: const [
                  FirstScreen(),
                  SecondScreen(),
                  ThirdScreen(),
                  FourthScreen(),
                  FifthScreen(),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(24, 10, 24, 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 80,
                    child: showBackButton
                        ? TextButton(
                            onPressed: _previousPage,
                            child: const Text(
                              "Back",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFFB19768),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : const SizedBox(width: 80),
                  ),

                  // الـ Dots
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 5,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      expansionFactor: 3,
                      spacing: 6,
                      dotColor: AppColor.grayColor,
                      activeDotColor: AppColor.goldColor,
                    ),
                  ),

                  SizedBox(
                    width: 80,
                    child: TextButton(
                      onPressed: _nextPage,
                      child: Text(
                        isLastPage ? "Finish" : "Next",
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColor.goldColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
