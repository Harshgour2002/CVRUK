import 'package:cvruk/Screens/Achievement.dart';
import 'package:cvruk/Screens/FeedBack.dart';
import 'package:cvruk/Screens/LatestNews.dart';
import 'package:cvruk/Screens/OngoingPrograms.dart';
import 'package:cvruk/Screens/RamanVoice.dart';
import 'package:cvruk/Screens/Sports.dart';
import 'package:cvruk/Screens/UpcomingEvents.dart';
import 'package:flutter/material.dart';

import '../Screens/Placments.dart';

class Explorecardsdesign extends StatelessWidget {
  final String label;
  final IconData icon;
  final int index;

  const Explorecardsdesign({
    super.key,
    required this.label,
    required this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        switch (index) {
          case 0:
            {
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => UpcomingEvents()));
            }
          case 1:
          {
            Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => LatestNews()));
          }
          case 2:
          {
            Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => OngoingPrograms()));
          }
          case 3:
          {
            Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => Sports()));
          }
          case 4:
          {
            Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => Placements()));
          }
          case 5:
          {
            Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => AchievementScreen()));
          };
          case 6:
          {
            Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => RamanVoice()));
          };
          case 7:
          {
            Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => FeedBack()));
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.all(6.0),
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor, // Auto light/dark
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circular Icon Background
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDark
                    ? Colors.blue.withValues(alpha: 0.20) // dark icon bg
                    : Colors.blue.shade50, // light icon bg
              ),
              child: Icon(
                icon,
                size: 28,
                color: isDark ? Colors.blue.shade200 : Colors.blue,
              ),
            ),

            const SizedBox(height: 8),

            // Adaptive Text
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}