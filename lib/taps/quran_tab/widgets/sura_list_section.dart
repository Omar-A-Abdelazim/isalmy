import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isalmy/gen/assets.gen.dart';

class SuraListSection extends StatelessWidget {
  const SuraListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
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
          Expanded(
            child: ListView.builder(
              itemCount: 120,
              itemBuilder: (context, index) {
                return ListTile(
                  minVerticalPadding: 0,
                  contentPadding: EdgeInsets.all(0),
                  title: Text(
                    "data",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "? verses",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    "الفاتحه",
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
                        index.toString(),
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
      ),
    );
  }
}
