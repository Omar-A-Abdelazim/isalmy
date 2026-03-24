import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isalmy/common/app_color.dart';
import 'package:isalmy/common/widgets/bg_layout_widget.dart';
import 'package:isalmy/common/widgets/header_widget.dart';
import 'package:isalmy/data/models/hadeeth_model.dart';
import 'package:isalmy/gen/assets.gen.dart';

class HadeethTabPage extends StatefulWidget {
  const HadeethTabPage({super.key});

  @override
  State<HadeethTabPage> createState() => _HadeethTabPageState();
}

class _HadeethTabPageState extends State<HadeethTabPage> {
  final PageController _controller = PageController(
    viewportFraction: .75,
    initialPage: 0,
  );
  int currentPage = 0;
  bool isActive = false;
  List<HadeethModel> hadeethModelList = [];
  @override
  void initState() {
    super.initState();
    loadAhadeeth();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BgLayoutWidget(imagePath: Assets.hadeethTabBg.path),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: Column(
              children: [
                HeaderWidget(),
                SizedBox(height: 55),
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (value) {
                      currentPage = value;
                      setState(() {});
                    },
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: hadeethModelList.length,
                    itemBuilder: (context, index) {
                      bool isActive = index == currentPage;
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: isActive ? 0 : 20.0,
                          horizontal: 4,
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          color: AppColor.goldColor,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Stack(
                              alignment: Alignment(0, 0),
                              children: [
                                Image.asset(
                                  Assets.hadeethCardBg.path,
                                  width: 312,
                                  fit: BoxFit.fill,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 43.0,
                                    right: 22,
                                    left: 22,
                                    bottom: 43,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        hadeethModelList[index].title,
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: AppColor.blackColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Text(
                                            textAlign: TextAlign.justify,
                                            textDirection: TextDirection.rtl,
                                            hadeethModelList[index].content,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: AppColor.blackColor,
                                              fontWeight: FontWeight.bold,
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
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> loadAhadeeth() async {
    String ahadeeth = await rootBundle.loadString(
      'assets/Hadeeth/ahadeeth.txt',
    );
    List<String> ahadeethList = ahadeeth.trim().split("#");
    List<HadeethModel> ahadeethFinalList = [];
    for (var i = 0; i < ahadeethList.length; i++) {
      String hadeeth = ahadeethList[i].trim();
      String title = hadeeth.split("\n").first;
      int titleLength = title.length;
      String hadeethContent = hadeeth.substring(titleLength);
      ahadeethFinalList.add(
        HadeethModel(content: hadeethContent, title: title, number: i + 1),
      );
    }
    hadeethModelList = ahadeethFinalList;
    setState(() {});
  }
}
