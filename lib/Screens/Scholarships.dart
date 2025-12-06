import 'package:flutter/material.dart';

class Scholarships extends StatelessWidget {
  const Scholarships({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final List<Map<String, String>> clubs = const [
      {
        "title": "Registrar Club",
        "description":
        "If the student score highest percentage in first year of their discipline, actively participates in extra curriculum activities and have minimum 75% attendance and disciplines student he/she will get 25% discount in there 2nd year tuition fee.",
      },
      {
        "title": "VC Club",
        "description":
        "If the same student score highest percentage in 2nd year of their discipline, actively participates in extra curriculum activites and have minimum 75% attendance and disciplines student he/she will get 50% discount in there 3rd year of tuition fee.",
      },
      {
        "title": "Chancellor Club",
        "description":
        "If the same student score highest percentage in 3rd year of their discipline, actively participates in extra curriculum activities and have minimum 75% attendance and disciplines student he/she will get 100% discount in their 4th year tuition fee.",
      },
    ];

    final List<Map<String, String>> shikshaMitra = const [
      {"marks": "Above 91%", "waiver": "40% tuition fees waiver"},
      {"marks": "85% - 90%", "waiver": "25% tuition fees waiver"},
      {"marks": "80% - 84%", "waiver": "20% tuition fees waiver"},
      {"marks": "70% - 79%", "waiver": "15% tuition fees waiver"},
      {"marks": "60% - 69%", "waiver": "10% tuition fees waiver"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Scholarships"), centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Modern Shiksha Mitra Scholarship Card
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Shiksha Mitra Scholarship Scheme - 2021",
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "NOTE: (Not for B.Sc. (Agriculture), B.Sc.(Nursing), GNM, LLM, B.Ed., B.Ed. (PT), B.P.Ed.)",
                      style: TextStyle(
                          fontSize: 13, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 12),
                    // Modern table
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        children: shikshaMitra.asMap().entries.map((entry) {
                          int idx = entry.key;
                          Map<String, String> item = entry.value;
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            decoration: BoxDecoration(
                            color: isDark ? Colors.grey.shade900 : Colors.white,
                              border: idx != shikshaMitra.length - 1
                                  ? const Border(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 0.3))
                                  : null,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item['marks']!,
                                  style: const TextStyle(fontSize: 15),
                                ),
                                Text(
                                  item['waiver']!,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),
            const Text(
              "Special Category Scholarship Scheme for First Three Students",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "Rules for special category scholarship as follow:",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),

            // Clubs List
            Column(
              children: clubs.map((club) {
                return Card(
                  elevation: 4,
                  color: isDark ? Colors.grey.shade900 : Colors.white,
                  shadowColor: Colors.deepPurpleAccent.withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          club['title']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          club['description']!,
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
