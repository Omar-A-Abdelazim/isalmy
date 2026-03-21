import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isalmy/common/app_color.dart';
import 'package:isalmy/gen/assets.gen.dart';
import 'package:isalmy/taps/hadeeth_tab/hadeeth_tab_page.dart';
import 'package:isalmy/taps/quran_tab/quran_tab_page.dart';
import 'package:isalmy/taps/radio_tab/radio_tab_page.dart';
import 'package:isalmy/taps/sebha_tab/sebha_tab_page.dart';
import 'package:isalmy/taps/times_tab/times_tab_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> taps = [
    QuranTabPage(),
    HadeethTabPage(),
    SebhaTabPage(),
    RadioTabPage(),
    TimesTabPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: taps[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: [
          customBottomNavItem(icon: Assets.quranTabIcon, label: "Quran"),
          customBottomNavItem(icon: Assets.hadeethTabIcon, label: "Hadith"),
          customBottomNavItem(icon: Assets.sebhaTabIcon, label: "Sebha"),
          customBottomNavItem(icon: Assets.radioTabIcon, label: "Radio"),
          customBottomNavItem(icon: Assets.timesTabIcon, label: "Times"),
        ],
      ),
    );
  }

  BottomNavigationBarItem customBottomNavItem({
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(icon),
      activeIcon: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
        decoration: BoxDecoration(
          color: AppColor.blackColor.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(66),
        ),
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
      label: label,
    );
  }
}
