import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  final List<Map<String, dynamic>> departments = const [
    {
      "title": "Computer Science & Engineering",
      "courses": [
        "B.Tech CSE",
        "B.Tech AI & ML",
        "B.Tech Data Science",
        "M.Tech CSE",
        "PhD in CSE",
      ],
    },
    {
      "title": "Electronics & Communication",
      "courses": [
        "B.Tech ECE",
        "M.Tech VLSI",
        "Diploma in ECE",
      ],
    },
    {
      "title": "Mechanical Engineering",
      "courses": [
        "B.Tech Mechanical",
        "M.Tech Thermal",
        "Diploma in Mechanical",
      ],
    },
    {
      "title": "Management Studies",
      "courses": [
        "BBA",
        "MBA",
        "B.Com (Hons)",
      ],
    },
    {
      "title": "Science Department",
      "courses": [
        "B.Sc Mathematics",
        "B.Sc Chemistry",
        "B.Sc Physics",
        "M.Sc Physics",
      ],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: departments.map((dept) {
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Department Title
                  Text(
                    dept["title"],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // List of courses using Wrap
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: (
                        dept["courses"] as List<String>).map((course) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Text(
                          course,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
