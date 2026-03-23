import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isalmy/common/app_color.dart';
import 'package:isalmy/gen/assets.gen.dart';

class SuraDetailsPage extends StatefulWidget {
  const SuraDetailsPage({super.key});
  static const String routeName = "/suraDetails";

  @override
  State<SuraDetailsPage> createState() => _SuraDetailsPageState();
}

class _SuraDetailsPageState extends State<SuraDetailsPage> {
  List<String> suraAyat = [];
  bool isFirstBuild = true;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> suraData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    int suraId = suraData['id'];
    String name = suraData['name'];
    if (isFirstBuild) {
      loadSura(suraId);
      isFirstBuild = false;
    }
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(name)),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Assets.suraDetailsBg.path)),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 40),
                child: Text(
                  "data",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.goldColor,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: suraAyat.length,
                  itemBuilder: (context, index) {
                    return Text(
                      suraAyat[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.goldColor,
                      ),
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                    );
                  },
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadSura(int id) async {
    String suraContent = await rootBundle.loadString("assets/Suras/$id.txt");
    List<String> ayat = suraContent.split('\n');
    suraAyat = ayat;
    setState(() {});
  }
}
