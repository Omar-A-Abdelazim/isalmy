import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isalmy/data/models/sura_model.dart';
import 'package:isalmy/gen/assets.gen.dart';
import 'package:isalmy/taps/quran_tab/sura_details_page.dart';

class SuraListSection extends StatelessWidget {
  const SuraListSection({super.key, required this.suras, required this.onTap});
  final Future<void> Function(SuraModel) onTap;
  final List<SuraModel> suras;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "Suras List",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: SliverList.builder(
            itemCount: suras.length,
            itemBuilder: (context, index) {
              var sura = suras[index];
              return ListTile(
                onTap: () async {
                  Navigator.of(context)
                      .pushNamed(SuraDetailsPage.routeName, arguments: sura)
                      .then((value) {
                        onTap(sura);
                      });
                },
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  sura.enName,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "${sura.versesNumber} verses",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  sura.arName,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(Assets.verseIcon),
                    Text(
                      sura.number.toString(),
                      style: TextStyle(
                        fontSize: index > 100 ? 14 : 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
