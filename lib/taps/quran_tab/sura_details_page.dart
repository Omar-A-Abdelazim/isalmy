import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isalmy/common/app_color.dart';
import 'package:isalmy/data/models/sura_model.dart';
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
    SuraModel suraData =
        ModalRoute.of(context)?.settings.arguments as SuraModel;

    if (isFirstBuild) {
      loadSura(suraData.number);
      isFirstBuild = false;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(suraData.enName),
        backgroundColor: AppColor.blackColor,
      ),
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
                  suraData.arName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.goldColor,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.goldColor,
                        ),
                        children: List.generate(
                          suraAyat.length,
                          (index) => TextSpan(
                            text: '${suraAyat[index]}(${index + 1}) ',
                          ),
                        ),
                      ),
                    ),
                  ),
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
    List<String> ayat = suraContent.trim().split('\n');
    suraAyat = ayat;
    setState(() {});
  }
}
