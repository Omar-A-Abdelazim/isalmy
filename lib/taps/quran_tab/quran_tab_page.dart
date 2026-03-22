import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isalmy/common/app_color.dart';
import 'package:isalmy/common/widgets/bg_layout_widget.dart';
import 'package:isalmy/common/widgets/header_widget.dart';
import 'package:isalmy/data/models/sura_model.dart';
import 'package:isalmy/data/quran_data.dart';
import 'package:isalmy/gen/assets.gen.dart';
import 'package:isalmy/taps/quran_tab/widgets/custom_text_field.dart';
import 'package:isalmy/taps/quran_tab/widgets/most_recent_section.dart';
import 'package:isalmy/taps/quran_tab/widgets/sura_list_section.dart';

class QuranTabPage extends StatefulWidget {
  const QuranTabPage({super.key});

  @override
  State<QuranTabPage> createState() => _QuranTabPageState();
}

class _QuranTabPageState extends State<QuranTabPage> {
  final TextEditingController controller = TextEditingController();
  final List<String> mostRecently = [];

  List<SuraModel> _filteredSuras = QuranData.suras;

  void _onSearchChanged(String q) {
    setState(() {
      if (q.isEmpty) {
        _filteredSuras = QuranData.suras;
      } else {
        _filteredSuras = QuranData.suras.where((sura) {
          return sura.enName.toLowerCase().contains(q) ||
              sura.arName.toLowerCase().contains(q) ||
              sura.number.toString() == q;
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BgLayoutWidget(imagePath: Assets.quranTabBg.path),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20, top: 30),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 30)),
                SliverToBoxAdapter(child: HeaderWidget()),
                SliverToBoxAdapter(child: SizedBox(height: 30)),
                SliverToBoxAdapter(
                  child: CustomTextField(
                    onChanged: _onSearchChanged,
                    controller: controller,
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
                ),
                SliverToBoxAdapter(child: MostRecentSection()),
                SuraListSection(suras: _filteredSuras),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
