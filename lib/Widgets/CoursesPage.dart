import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  final List<Map<String, dynamic>> departments = const [
    {
      "title": "Agriculture",
      "image": "assets/departments/agriculture.jpg",
      "ug": [
        "Bachelor of Science in Agriculture",
      ],
      "pg": [
        "Master of Science in Agriculture Extension",
        "Master of Science in Agronomy Education",
      ],
      "diploma": [],
    },
    {
      "title": "Liberal Arts, Humanities and Languages",
      "image": "assets/departments/liberal_arts.jpg",
      "ug": [
        "Bachelor of Arts",
        "Bachelor of Library Science",
        "Bachelor of Social Work",
      ],
      "pg": [
        "Master of Arts (English)",
        "Master of Arts (Sociology)",
        "Master of Arts (History)",
        "Master of Arts (Political Science)",
      ],
      "diploma": [],
    },
    {
      "title": "Commerce",
      "image": "assets/departments/commerce.jpg",
      "ug": [
        "Bachelor of Commerce (Plain)",
      ],
      "pg": [
        "Master of Commerce",
      ],
      "diploma": [],
    },
    {
      "title": "Education",
      "image": "assets/departments/education.jpg",
      "ug": [
        "Bachelor of Education",
      ],
      "pg": [],
      "diploma": [],
    },
    {
      "title": "Rural Technology",
      "image": "assets/departments/rural_tech.jpg",
      "ug": [
        "Bachelor of Technology in Agriculture Engineering",
      ],
      "pg": [],
      "diploma": [],
    },
    {
      "title": "Vocational Education",
      "image": "assets/departments/vocational.jpg",
      "ug": [
        "Bachelor of Vocation in Bamboo Craft Enterprise",
        "Bachelor of Vocation in Information Technology",
        "Bachelor of Vocation in Medical Laboratory Technician",
      ],
      "pg": [],
      "diploma": [],
    },
    {
      "title": "Rural Management",
      "image": "assets/departments/rural_mgmt.jpg",
      "ug": [],
      "pg": [
        "Master of Business Administration",
      ],
      "diploma": [],
    },
    {
      "title": "Paramedical Science",
      "image": "assets/departments/paramedical.jpg",
      "diploma": [
        "Diploma in Medical Laboratory Technology",
      ],
      "ug": [
        "Bachelor of Medical Laboratory Technology",
        "Bachelor of Physiotherapy",
      ],
      "pg": [],
    },
    {
      "title": "Science",
      "image": "assets/departments/science.jpg",
      "ug": [
        "Bachelor of Science (Chemistry, Botany & Zoology)",
        "Bachelor of Science (Physics, Chemistry & Mathematics)",
        "Bachelor of Science in Microbiology",
        "Bachelor of Science (CBZ + Diploma in Medical Lab Technology)",
      ],
      "pg": [],
      "diploma": [],
    },
    {
      "title": "CS & IT",
      "image": "assets/departments/csit.jpg",
      "diploma": [
        "Diploma in Computer Application",
        "Post Graduate Diploma in Computer Application",
      ],
      "ug": [
        "Bachelor of Computer Application",
      ],
      "pg": [
        "Master of Science (Information Technology)",
        "Master of Computer Application",
      ],
    },
    {
      "title": "Management Studies and Entrepreneurial Development",
      "image": "assets/departments/management.jpg",
      "ug": [
        "Bachelor of Business Management",
      ],
      "pg": [],
      "diploma": [],
    },
    {
      "title": "Pharmacy",
      "image": "assets/departments/pharmacy.jpg",
      "diploma": [
        "Diploma in Pharmacy",
      ],
      "ug": [
        "Bachelor of Pharmacy",
      ],
      "pg": [],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context). brightness == Brightness.dark;
    return Scaffold(
      //backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: departments.map((dept) {
            return Container(
              margin: const EdgeInsets.only(bottom: 22),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey.shade900 : Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Image
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18)
                    ),
                    child: AspectRatio(
                      aspectRatio: 16 / 7,
                      child: Image.asset(
                        dept["image"],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Body Content
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dept["title"],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        divider(isDark),

                        const SizedBox(height: 18),

                        // Diploma
                        if ((dept["diploma"] as List).isNotEmpty) ...[
                          sectionTitle("Diploma Programs"),
                          bulletList(dept["diploma"]),
                          const SizedBox(height: 16),
                          divider(isDark),
                        ],

                        // UG
                        if ((dept["ug"] as List).isNotEmpty) ...[
                          sectionTitle("Undergraduate Programs"),
                          bulletList(dept["ug"]),
                          const SizedBox(height: 16),
                          divider(isDark),
                        ],

                        // PG
                        if ((dept["pg"] as List).isNotEmpty) ...[
                          sectionTitle("Postgraduate Programs"),
                          bulletList(dept["pg"]),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // --------- Helper Widgets ----------

  Widget sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget bulletList(List items) {
    return Column(
      children: items.map((course) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("•  ", style: TextStyle(fontSize: 16)),
            Expanded(
              child: Text(
                course,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget divider(bool isDark) {
    return Divider(
      height: 20,
      thickness: 1,
      color: isDark ? Colors.grey.shade800 : Colors.grey.shade300,
    );
  }
}
