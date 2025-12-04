import 'package:cvruk/Screens/FAQ.dart';
import 'package:cvruk/Screens/RefundPolicy.dart';
import 'package:cvruk/Screens/Scholarships.dart';
import 'package:cvruk/Screens/howToApply.dart';
import 'package:cvruk/Screens/whyCVRU.dart';
import 'package:flutter/material.dart';

class Admissioncards extends StatelessWidget {
  final String label;
  final String icon;
  final int index;

  const Admissioncards({
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
        // Handle card tap based on index
        switch (index) {
          case 0:
            {
              // Navigate to "Why CVRU?" page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WhyCVRU()),
              );
            }
            break;
          case 1:
            {
              // Navigate to "How to Apply" page
              Navigator.push(context, MaterialPageRoute(builder: (context) => Howtoapply()));
            }
            break;
          case 2:
            {
              // Navigate to "Scholarships" page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scholarships()),
              );
            }
            break;
          case 3:
            {
              // Navigate to "Entrance Exam" page
            }
            break;
          case 4:
            {
              // Navigate to "Refund Policy" page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Refundpolicy()),
              );
            }
            break;
          case 5:
            {
              // Navigate to "FAQ's" page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Faq()),
              );
            }
            break;
          default:
            break;
        }
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isDark
              ? Colors.white.withValues(alpha: 0.06)
              : Colors.white, // cleaner modern background
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withValues(alpha: 0.4)
                  : Colors.grey.withValues(alpha: 0.15),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Modern Icon Circle
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: isDark
                      ? [
                          Colors.blue.withValues(alpha: 0.3),
                          Colors.blue.withValues(alpha: 0.15),
                        ]
                      : [Colors.blue.shade100, Colors.blue.shade50],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Image.asset(icon, fit: BoxFit.contain),
              ),
            ),

            const SizedBox(height: 14),

            // Clean Label Text
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
