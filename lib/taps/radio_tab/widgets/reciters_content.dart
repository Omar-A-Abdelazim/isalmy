// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:isalmy/common/app_color.dart';
import 'package:isalmy/gen/assets.gen.dart';

class RecitersListView extends StatefulWidget {
  const RecitersListView({super.key});

  @override
  State<RecitersListView> createState() => _RecitersListViewState();
}

class _RecitersListViewState extends State<RecitersListView> {
  final List<Map<String, dynamic>> recitersList = [
    {"name": "Ibrahim Al-Akdar", "isPlaying": false, "isMuted": false},
    {"name": "Akram Alalaqmi", "isPlaying": false, "isMuted": false},
    {"name": "Majed Al-Enezi", "isPlaying": false, "isMuted": false},
    {"name": "Malik shaibat Alhamed", "isPlaying": false, "isMuted": false},
  ];

  int? currentPlayingIndex;

  void _togglePlay(int index) {
    setState(() {
      if (currentPlayingIndex == index) {
        recitersList[index]["isPlaying"] =
            !(recitersList[index]["isPlaying"] as bool);
        print(
          "تم تبديل التشغيل: ${recitersList[index]["name"]} → isPlaying: ${recitersList[index]["isPlaying"]}",
        );
      } else {
        if (currentPlayingIndex != null) {
          recitersList[currentPlayingIndex!]["isPlaying"] = false;
          print(
            "تم إيقاف السابق: ${recitersList[currentPlayingIndex!]["name"]}",
          );
        }
        recitersList[index]["isPlaying"] = true;
        currentPlayingIndex = index;
        print("تم تشغيل: ${recitersList[index]["name"]}");
      }
    });
  }

  void _toggleMute(int index) {
    if (!(recitersList[index]["isPlaying"] as bool)) {
      print("لا يمكن كتم الصوت، القارئ متوقف: ${recitersList[index]["name"]}");
      return;
    }
    setState(() {
      recitersList[index]["isMuted"] =
          !(recitersList[index]["isMuted"] as bool);
      print(
        "تم تغيير الكتم: ${recitersList[index]["name"]} → isMuted: ${recitersList[index]["isMuted"]}",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: recitersList.length,
      itemBuilder: (context, index) {
        final reciter = recitersList[index];
        final bool isPlaying = reciter["isPlaying"] as bool;
        final bool isMuted = reciter["isMuted"] as bool;

        return GestureDetector(
          onTap: () => _togglePlay(index),
          child: Container(
            height: 141,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: AppColor.goldColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Opacity(
                      opacity: 0.80,
                      child: Image.asset(
                        Assets.radioMosque.path,
                        fit: BoxFit.fill,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            reciter["name"] as String,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              height: 1.3,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => _togglePlay(index),
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.12),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                isPlaying
                                    ? Icons.pause_rounded
                                    : Icons.play_arrow_rounded,
                                color: Colors.black87,
                                size: 28,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: () => _toggleMute(index),
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.12),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                isMuted
                                    ? Icons.volume_off_rounded
                                    : Icons.volume_up_rounded,
                                color: Colors.black87,
                                size: 28,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
