import 'package:flutter/material.dart';
import 'package:isalmy/common/app_theme.dart';
import 'package:isalmy/screens/home_screen.dart';
import 'package:isalmy/screens/onBoarding/onBoarding_screen.dart';
import 'package:isalmy/screens/splash_screen.dart';
import 'package:isalmy/taps/quran_tab/sura_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsPage.routeName: (context) => SuraDetailsPage(),
      },
    );
  }
}
