import 'package:flutter/material.dart';
import 'package:isalmy/gen/assets.gen.dart';
import 'package:isalmy/screens/home_screen.dart';
import 'package:isalmy/screens/onBoarding/onBoarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "SplashScreen";
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goHome();
  }

  Future<void> goHome() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    if (!mounted) return;
    Navigator.of(context).pushNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(Assets.splashBg.path, fit: BoxFit.fill),
          ),
          Center(
            child: Image.asset(Assets.islamiLogo.path, width: 174, height: 232),
          ),
        ],
      ),
    );
  }
}
