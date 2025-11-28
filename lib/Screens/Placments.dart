import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../Widgets/AutoScrollImageList.dart';

class Placements extends StatefulWidget {
  const Placements({super.key});

  @override
  State<Placements> createState() => _PlacementsState();
}

class _PlacementsState extends State<Placements> {
  int currIndex = 0;
  final List<String> starAchiever = [
    "assets/placement/achiever1.jpeg",
    "assets/placement/achiever2.jpeg",
    "assets/placement/achiever3.jpeg",
    "assets/placement/achiever4.jpeg",
    "assets/placement/achiever5.jpeg",
    "assets/placement/achiever6.jpeg",
  ];
  final List<String> companies =[
    "assets/companies/3i.jpg",
    "assets/companies/airtel.png",
    "assets/companies/AU.png",
    "assets/companies/bsnl.jpg",
    "assets/companies/byjus.png",
    "assets/companies/glenmark.png",
    "assets/companies/HA.jpeg",
    "assets/companies/hbd.png",
    "assets/companies/hcl.png",
    "assets/companies/hexawear.png",
    "assets/companies/ibm.png",
    "assets/companies/icici.png",
    "assets/companies/kisan.png",
    "assets/companies/n&t.png",
    "assets/companies/reliance.jpg",
    "assets/companies/oracle.png",
    "assets/companies/patni.jpg",
    "assets/companies/sapandana.png",
    "assets/companies/satyam.jpg",
    "assets/companies/tcs.png",
    "assets/companies/texmo.png"
  ];

  final List<Map<String, String>> placementStats = [
    {"value": "18Lacs", "label": "Highest Package"},
    {"value": "6000+", "label": "Students Placed"},
    {"value": "250+", "label": "Campus Drives"},
    {"value": "600+", "label": "Companies Visited"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Placement",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        elevation: 0.4,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 220,
                child: Stack(
                  children: [
                    CarouselSlider(
                      items: starAchiever.map((img) {
                        return ClipRRect(
                          child: Image.asset(
                            img,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 220,
                        viewportFraction: 1,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currIndex = index;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          starAchiever.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 8,
                            width: currIndex == index ? 18 : 8,
                            decoration: BoxDecoration(
                              color: currIndex == index
                                  ? Colors.blue
                                  : Colors.white54,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Divider(thickness: 1, height: 32, color: Colors.grey.shade300),
              const SizedBox(height: 5),

              Align(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Training And Placement OverView",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Our Training & Placement Cell works to empower students "
                "through career guidance, industry-oriented training, and "
                "strong collaborations with top recruiters.",
                style: TextStyle(fontSize: 15, height: 1.6),
              ),
              const SizedBox(height: 5),
              Divider(thickness: 1, height: 32, color: Colors.grey.shade300),
              const SizedBox(height: 5),

              Align(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Our Recruiters",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 15),

              AutoScrollImageList(images: companies),

              const SizedBox(height: 5),
              Divider(thickness: 1, height: 32, color: Colors.grey.shade300),
              const SizedBox(height: 5),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.8,
                ),
                itemCount: placementStats.length,
                itemBuilder: (context, index) {
                  final stat = placementStats[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          stat['value']!,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          stat['label']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              SizedBox(
                height: 220,
                child: Stack(
                  children: [
                    CarouselSlider(
                      items: starAchiever.map((img) {
                        return ClipRRect(
                          child: Image.asset(
                            img,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 220,
                        viewportFraction: 1,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currIndex = index;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          starAchiever.length,
                              (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 8,
                            width: currIndex == index ? 18 : 8,
                            decoration: BoxDecoration(
                              color: currIndex == index
                                  ? Colors.blue
                                  : Colors.white54,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
