import 'package:flutter/material.dart';

class WhyCVRU extends StatelessWidget {
  const WhyCVRU({super.key});

  final List<String> whyCVRU = const [
    "CVRU Khandwa is imbued with the learning outcome centric paradigm in all its programmes wherein the students learn to practise as professionals.",
    "Research and innovation drive the learning in all CVRU Khandwa Programmes.",
    "Strong industry linkages - Microsoft, Tata Motors, Reliance, HCL, BSNL.",
    "An eco-friendly destination for quality learning and research-driven education.",
    "CVRU Khandwa is a fully NEP 2020-compliant university with a multiple entry and multiple exit process, a choice-based credit system (CBCS), a wide range of generic and skill enhancement electives, and regular courses from multi-disciplinary options available to all students.",
    "Ever-evolving laboratories, live laboratories, and on-site and on-the-job learning experiences in real time and space.",
    "Ever-evolving and compatible infrastructure provides the best student facilities, amenities, and opportunities to practise and perform sports, arts, literary, and cultural initiatives.",
    "CVRU Khandwa works in the institutional ecosystem, wherein the students get first-hand experience from across the spectrum. CVRU Khandwa has signed Memorandums of Understanding (MoUs) with all kinds of institutions, may it be academic, research, corporate, or development, both in the government and voluntary sectors.",
    "CVRU Khandwa has state-of-the-art IOT labs, a digital learning school, science and technology dexterity, field-based projects, missions like Mission HAPPY and Mission Samarth Bharat, and incubator centres to aid in real-time learning.",
    "Ever-growing library, Cybrary (Cyber Library), online digital learning platform like AISECT Learn, open house learning sources, team of mentors, visiting faculties, and host of other learning opportunities available to its students.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Why CVRU?"),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: whyCVRU.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shadowColor: Colors.deepPurpleAccent.withValues(alpha: 0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      color: Colors.blue,
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        whyCVRU[index],
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
