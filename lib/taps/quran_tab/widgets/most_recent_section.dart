import 'package:flutter/material.dart';
import 'package:isalmy/common/app_color.dart';
import 'package:isalmy/gen/assets.gen.dart';

class MostRecentSection extends StatelessWidget {
  const MostRecentSection({super.key});

  @override
  Widget build(BuildContext context) {
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
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Card(
                color: AppColor.goldColor,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 20, left: 17),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Al-Anbiya",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "الأنبياء",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "112 verses",
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
