import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isalmy/common/app_theme.dart';
import 'package:isalmy/screens/home_screen.dart';
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
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsPage.routeName: (context) => SuraDetailsPage(),
      },
    );
  }
}
