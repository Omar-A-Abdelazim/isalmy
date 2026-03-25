import 'package:flutter/material.dart';

class PrayerTimesCarousel extends StatefulWidget {
  const PrayerTimesCarousel({super.key});

  @override
  State<PrayerTimesCarousel> createState() => _PrayerTimesCarouselState();
}

class _PrayerTimesCarouselState extends State<PrayerTimesCarousel> {
  final PageController _controller = PageController(
    viewportFraction: 0.47,
    initialPage: 2,
  );

  int currentPage = 2;

  final List<Map<String, String>> prayerTimes = [
    {"name": "Fajr", "time": "04:04", "period": "AM"},
    {"name": "Dhuhr", "time": "01:01", "period": "PM"},
    {"name": "Asr", "time": "04:38", "period": "PM"},
    {"name": "Maghrib", "time": "07:57", "period": "PM"},
    {"name": "Isha", "time": "09:12", "period": "PM"},
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.page != null) {
        setState(() => currentPage = _controller.page!.round());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155,
      child: PageView.builder(
        controller: _controller,
        itemCount: prayerTimes.length,
        onPageChanged: (value) => setState(() => currentPage = value),
        itemBuilder: (context, index) {
          final prayer = prayerTimes[index];
          final bool isActive = index == currentPage;

          final double cardWidth = isActive ? 85 : 69;
          final double cardHeight = isActive ? 90 : 80;

          return AnimatedPadding(
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeOut,
            padding: EdgeInsets.symmetric(
              vertical: isActive ? 6 : 22,
              horizontal: 4,
            ),
            child: Transform.scale(
              scale: isActive ? 1.0 : 0.90,
              child: Container(
                width: cardWidth,
                height: cardHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF202020), Color(0xFFB19768)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.55),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      prayer["name"]!,
                      style: TextStyle(
                        fontSize: isActive ? 16.5 : 13.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      prayer["time"]!,
                      style: TextStyle(
                        fontSize: isActive ? 32 : 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                    Text(
                      prayer["period"]!,
                      style: TextStyle(
                        fontSize: isActive ? 15 : 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
