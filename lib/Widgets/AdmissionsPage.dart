import 'package:cvruk/Cards/admissionCards.dart';
import 'package:flutter/material.dart';

class AdmissionsPage extends StatelessWidget {
  const AdmissionsPage({super.key});

  // Your 6 cards data
  final List<Map<String, String>> cardsData = const [
    {
      "label": "Why CVRU?",
      "icon": "assets/admissionCardImage/question-mark.png",
    },
    {
      "label": "How to Apply",
      "icon": "assets/admissionCardImage/apply.png"},
    {
      "label": "Scholarships",
      "icon": "assets/admissionCardImage/scholarship.png",
    },
    {
      "label": "Entrance Exam",
      "icon": "assets/admissionCardImage/exam-results.png",
    },
    {
      "label": "Refund Policy",
      "icon": "assets/admissionCardImage/cash-back.png",
    },
    {
      "label": "FAQ's",
      "icon": "assets/admissionCardImage/faq.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cardsData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return Admissioncards(
              label: cardsData[index]["label"] as String,
              icon: cardsData[index]["icon"]!,
              index: index, // pass correct index
            );
          },
        ),
      ),
    );
  }
}
