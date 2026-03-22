import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isalmy/common/app_color.dart';
import 'package:isalmy/common/widgets/bg_layout_widget.dart';
import 'package:isalmy/common/widgets/header_widget.dart';
import 'package:isalmy/gen/assets.gen.dart';
import 'package:isalmy/taps/quran_tab/widgets/custom_text_field.dart';
import 'package:isalmy/taps/quran_tab/widgets/most_recent_section.dart';
import 'package:isalmy/taps/quran_tab/widgets/sura_list_section.dart';

class QuranTabPage extends StatelessWidget {
  QuranTabPage({super.key});
  final List<String> mostRecently = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BgLayoutWidget(imagePath: Assets.quranTabBg.path),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                HeaderWidget(),
                SizedBox(height: 30),
                CustomTextField(
                  hintText: 'Sura Name',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset(
                      Assets.quranTabIcon,
                      colorFilter: ColorFilter.mode(
                        AppColor.goldColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                MostRecentSection(),
                SuraListSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
