import 'package:flutter/material.dart';
import 'package:isalmy/common/app_color.dart';
import 'package:isalmy/common/widgets/bg_layout_widget.dart';
import 'package:isalmy/common/widgets/header_widget.dart';
import 'package:isalmy/gen/assets.gen.dart';
import 'package:isalmy/taps/radio_tab/widgets/radio_content.dart';
import 'package:isalmy/taps/radio_tab/widgets/reciters_content.dart';

class RadioTabPage extends StatefulWidget {
  const RadioTabPage({super.key});

  @override
  State<RadioTabPage> createState() => _RadioTabPageState();
}

class _RadioTabPageState extends State<RadioTabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BgLayoutWidget(imagePath: Assets.radioTabBg.path),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const HeaderWidget(),
                const SizedBox(height: 10),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        // الـ TabBar
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: AppColor.blackColor.withValues(alpha: 0.7),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TabBar(
                            dividerColor: Colors.transparent,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: BoxDecoration(
                              color: AppColor.goldColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.white,
                            labelPadding: const EdgeInsets.symmetric(
                              horizontal: 0,
                            ),
                            tabs: const [
                              Tab(text: 'Radio'),
                              Tab(text: 'Reciters'),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),
                        Expanded(
                          child: TabBarView(
                            children: [RadioListView(), RecitersListView()],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecitersContent() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: const [
        Text("Ibrahim Al-Akdar", style: TextStyle(fontSize: 18)),
        Text("Akram Alalaqmi", style: TextStyle(fontSize: 18)),
        Text("Majed Al-Enezi", style: TextStyle(fontSize: 18)),
        Text("Malik shaibat Alhamed", style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
