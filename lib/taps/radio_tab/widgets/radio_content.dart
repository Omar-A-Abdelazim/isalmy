// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:isalmy/common/app_color.dart';
import 'package:isalmy/gen/assets.gen.dart';

class RadioListView extends StatefulWidget {
  const RadioListView({super.key});

  @override
  State<RadioListView> createState() => _RadioListViewState();
}

class _RadioListViewState extends State<RadioListView> {
  final List<Map<String, dynamic>> radioList = [
    {"name": "Radio Ibrahim Al-Akdar", "isPlaying": true, "isMuted": false},
    {"name": "Radio Al-Qaria Yassen", "isPlaying": false, "isMuted": false},
    {"name": "Radio Ahmed Al-trabulsi", "isPlaying": false, "isMuted": false},
    {
      "name": "Radio Addokali Mohammad Alalim",
      "isPlaying": false,
      "isMuted": false,
    },
  ];

  int? currentPlayingIndex;

  void _togglePlay(int index) {
    setState(() {
      if (currentPlayingIndex == index) {
        radioList[index]["isPlaying"] =
            !(radioList[index]["isPlaying"] as bool);
        print(
          "تم تبديل التشغيل: ${radioList[index]["name"]} → isPlaying: ${radioList[index]["isPlaying"]}",
        );
      } else {
        if (currentPlayingIndex != null) {
          radioList[currentPlayingIndex!]["isPlaying"] = false;
          print("تم إيقاف السابق: ${radioList[currentPlayingIndex!]["name"]}");
        }
        radioList[index]["isPlaying"] = true;
        currentPlayingIndex = index;
        print("تم تشغيل: ${radioList[index]["name"]}");
      }
    });
  }

  void _toggleMute(int index) {
    if (!(radioList[index]["isPlaying"] as bool)) {
      print("لا يمكن كتم الصوت، الراديو متوقف: ${radioList[index]["name"]}");
      return;
    }
    setState(() {
      radioList[index]["isMuted"] = !(radioList[index]["isMuted"] as bool);
      print(
        "تم تغيير الكتم: ${radioList[index]["name"]} → isMuted: ${radioList[index]["isMuted"]}",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: radioList.length,
      itemBuilder: (context, index) {
        final radio = radioList[index];
        final bool isPlaying = radio["isPlaying"] as bool;
        final bool isMuted = radio["isMuted"] as bool;

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            radio["name"] as String,
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
