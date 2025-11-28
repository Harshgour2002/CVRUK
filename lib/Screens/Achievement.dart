import 'package:flutter/material.dart';
import '../Cards/achievementCard.dart';

class AchievementScreen extends StatelessWidget {
  AchievementScreen({super.key});

  final List<Map<String, String>> achievements = [
    {
      "title": "The Most Upcoming University by ABP News during the 10th National Education Awards 2019",
      "image": "assets/achievements/img48.jpg",
    },
    {
      "title": "Dr. C.V. Raman University, Khandwa (Madhya Pradesh) awarded The Most Upcoming University by Dabang Duniya 2019.",
      "image": "assets/achievements/img44.jpg",
    },
    {
      "title": "55th SKOCH Summit - The Economic Manifesto 2018",
      "image": "assets/achievements/img40.jpg",
    },
    {
      "title": "Edupreneur Award 2016",
      "image": "assets/achievements/img36.jpg",
    },
    {
      "title": "Navduniya’s 4th ‘Captains of Industry’ Award 2015",
      "image": "assets/achievements/img32.jpg",
    },
    {
      "title": "Skoch Corporate Leadership Award 2013 for Excellence in Education",
      "image": "assets/achievements/img27.jpg",
    },
    {
      "title": "Lifetime Achievement Award for Technical and Societal Contributions - 2013",
      "image": "assets/achievements/img22.jpg",
    },
    {
      "title": "The Social Entrepreneur of the Year Award - 2010",
      "image": "assets/achievements/img17.jpg",
    },
    {
      "title": "NASSCOM Emerge 50 Leader Award - 2009",
      "image": "assets/achievements/img13.jpg",
    },
    {
      "title": "TiE-Lumis Entrepreneurial Excellence Award - 2009",
      "image": "assets/achievements/img8.jpg",
    },
    {
      "title": "NASSCOM IT Innovation Award - 2006",
      "image": "assets/achievements/img4.jpg",
    },
    {
      "title": "Indian Innovation Award - 2005",
      "image": "assets/achievements/img103.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Achievements")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),  // ← Global padding (10)
        child: Column(
          children: [
            /// Banner
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 21 / 9, // adjust as per your banner
                child: Image.asset(
                  "assets/achievements/img.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),

            /// Achievements List
            Column(
              children: achievements.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: AchievementCard(
                      image: item["image"]!,
                      title: item["title"]!,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 33 / 9, // adjust as per your banner
                child: Image.asset(
                  "assets/achievements/AwardsandAccolades.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),

          ],
        ),
      ),
    );
  }
}
