import 'package:flutter/material.dart';
import '../Cards/SportsAchievmentCards.dart';
class Sports extends StatelessWidget {
  const Sports({super.key});

  final List<Map<String, String>> sportsData = const [
    {
      "title":"National, Inter University Wrestling Championship 2023, At Chandigarh",
      "image":"assets/sports/sports1.jpeg"
    },
    {
      "title":"National, Inter University Athletics Championship 2023, At Bhuvneshwar Neha Yadav, Urmila Solanki, Saloni Patel, Jayshri Patel",
      "image":"assets/sports/sports2.jpeg"
    },
    {
      "title":"West Zone Table Tennis Championship, At Bhopal Ammar Saifee,  Satyam Laad, Jay Rav Tikekar, Piyush Raghuwanshi",
      "image":"assets/sports/sports3.jpeg"
    },
    {
      "title":"State Table Tennis Championship, At Indore Ammar Saifee, Neha Yadav,  Aayushi Birla, Satyam Laad, Jay Rav Tikekar",
      "image":"assets/sports/sports4.jpeg"
    },
    {
      "title":"West Zone Inter University Wrestling Championship 2023 At Chandigarh Neeraj Patel",
      "image":"assets/sports/sports5.jpeg"
    },
    {
      "title":"West Zone Inter University Wrestling Championship 2023 At Chandigarh Rohit Patel",
      "image":"assets/sports/sports6.jpeg"
    },
    {
      "title":"West Zone Inter University Shooting Competition 2023 At Kurukshetr Aksha Siddhiqui",
      "image":"assets/sports/sports7.jpeg"
    },
    {
      "title":"West Zone Inter University Shooting Competition 2023 At Kurukshetr Ritik Shriwas",
      "image":"assets/sports/sports8.jpeg"
    },
    {
      "title":"West Zone Inter University Kabaddi Championship 2023 At Indore",
      "image":"assets/sports/sports9.jpeg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sports",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AspectRatio(
                aspectRatio: 45 / 9,
                child: Image.asset(
                  "assets/sports/sports.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              "Sports and Recreation Facilities",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),

            const SizedBox(height: 8),

            const Text(
              "We believe in nurturing well-rounded individuals, and physical "
                  "fitness plays a crucial role in achieving that balance. Our campus "
                  "offers a range of sports and recreational facilities, including "
                  "a gymnasium, sports fields, tennis courts, and swimming pools. "
                  "These spaces encourage students to lead active and healthy "
                  "lifestyles, fostering teamwork and personal growth.",
              style: TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 8),
            const Divider(height: 1, color: Colors.grey,),
            const SizedBox(height: 8,),

            const Text(
              "Our Achievements",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),

            const SizedBox(height: 8,),
            // ⭐ Grid inside Expanded
            Expanded(
              child: GridView.builder(
                itemCount: sportsData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.70,
                ),

                itemBuilder: (context, index) {
                  return SportsAchievementCard(
                    cardData: sportsData[index],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
