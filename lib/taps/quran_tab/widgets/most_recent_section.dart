import 'package:flutter/material.dart';
import 'package:isalmy/common/app_color.dart';
import 'package:isalmy/data/models/sura_model.dart';
import 'package:isalmy/gen/assets.gen.dart';

class MostRecentSection extends StatelessWidget {
  final List<SuraModel> mostRecent;
  const MostRecentSection({super.key, required this.mostRecent});

  @override
  Widget build(BuildContext context) {
    if (mostRecent.isEmpty) {
      return SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: Text(
            "Most Recently",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: mostRecent.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              SuraModel suraModel = mostRecent[index];
              return Card(
                color: AppColor.goldColor,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        bottom: 20,
                        left: 17,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            suraModel.enName,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            suraModel.arName,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            suraModel.versesNumber,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(Assets.imgMostRecent.path),
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
