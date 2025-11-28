import 'package:flutter/material.dart';
import '../Cards/CarouselStackCards.dart';
import '../Cards/exploreCardsDesign.dart';
import '../Widgets/UniversityFadeCarousel.dart';
import '../Widgets/affiliated_organizations.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  final placedStudents = const [
    "assets/images/image1.jpeg",
    "assets/images/image2.jpeg",
    "assets/images/image3.jpeg",
  ];

  final carousel = const [
    {"image": "assets/event_carousel/test01.png"},
    {"image": "assets/event_carousel/test02.png"},
  ];

  final items = const [
    {"title": "Upcoming \n events", "icon": Icons.event_available},
    {"title": "Latest \n News", "icon": Icons.article_rounded},
    {"title": "Ongoing \n Programs", "icon": Icons.autorenew},
    {"title": "Sports", "icon": Icons.sports_soccer},
    {"title": "Placement", "icon": Icons.business_center_rounded},
    {"title": "Achievement", "icon": Icons.emoji_events_rounded},
    {"title": "Raman \n Radio", "icon": Icons.radio_rounded},
    {"title": "Feedback", "icon": Icons.feedback_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UniversityFadeCarousel(
            images: placedStudents,
            aboutText:
            "Our university has a legacy of excellence in education, global research, and innovation.",
          ),

          const SizedBox(height: 10),

          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text("Accreditation and Affiliation",
                style: TextStyle(fontSize: 18)),
          ),

          AffiliatedOrganizationsBox(),

          const SizedBox(height: 10),

          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text("Trending", style: TextStyle(fontSize: 18)),
          ),

          const SizedBox(height: 8),

          BannerCarousel(
            images: carousel.map((e) => e["image"]!).toList(),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text("Explore", style: TextStyle(fontSize: 18)),
          ),

          const SizedBox(height: 10),

          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 0.85,
            children: List.generate(8, (index) {
              return Explorecardsdesign(
                label: items[index]["title"] as String,
                icon: items[index]["icon"] as IconData,
                index : index
              );
            }),
          )
        ],
      ),
    );
  }
}
