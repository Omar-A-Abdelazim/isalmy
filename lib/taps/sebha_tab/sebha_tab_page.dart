import 'package:flutter/material.dart';
import 'package:isalmy/common/app_color.dart';
import 'package:isalmy/common/widgets/bg_layout_widget.dart';
import 'package:isalmy/common/widgets/header_widget.dart';
import 'package:isalmy/gen/assets.gen.dart';

class SebhaTabPage extends StatefulWidget {
  const SebhaTabPage({super.key});

  @override
  State<SebhaTabPage> createState() => _SebhaTabPageState();
}

class _SebhaTabPageState extends State<SebhaTabPage> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BgLayoutWidget(imagePath: Assets.sebhaTabBg.path),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: HeaderWidget(),
          ),
        ),
        Positioned(
          top: 217,
          left: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              number = number + 1;
              setState(() {});
            },
            child: Text(
              textAlign: TextAlign.center,
              "رَبِّحِ اسْمَ رَبِّكَ الأعلى",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),

        Positioned(
          top: 300,
          left: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              number = number + 1;
              setState(() {});
            },
            child: Image.asset(
              Assets.sebha.path,
              width: 270,
              height: 360,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          top: 453,
          left: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              number = number + 1;
              setState(() {});
            },
            child: Text(
              textAlign: TextAlign.center,
              "سبحان الله",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          top: 528,
          left: 0,
          right: 0,
          child: Text(
            textAlign: TextAlign.center,
            number.toString(),
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
