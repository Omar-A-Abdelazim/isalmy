import 'package:flutter/material.dart';
import 'package:isalmy/common/widgets/bg_layout_widget.dart';
import 'package:isalmy/gen/assets.gen.dart';

class HadeethTabPage extends StatelessWidget {
  const HadeethTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [BgLayoutWidget(imagePath: Assets.hadeethTabBg.path)],
    );
  }
}
