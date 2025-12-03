import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final List<Map<String, String>> faqList = [
      {
        'question': 'Is there any Entrance Exam?',
        'answer':
        'Yes, the AISECT Group of University conducts an entrance exam called the '
            'AISECT Joint Entrance Examination (AJEE) for admission to UG, PG, and Doctoral programs.'
      },
      {
        'question': 'What documents are required for admission?',
        'answer':
        '10th Marksheet\n12th Marksheet\nGraduation Marksheet\nAadhar Card\n'
            'Passport Size Photos\nTransfer Certificate\nMigration Certificate'
      },
      {
        'question': 'Is the university well-recognized and approved?',
        'answer':
        'Yes, Dr. C.V. Raman University is approved and recognized by NCTE, AICTE, MP Govt., '
            'UGC, MP Paramedical Council, and AIU.'
      },
      {
        'question': 'Does the university provide transport facility?',
        'answer':
        'Yes. A fleet of buses is available for students within a 40 km radius from the campus.'
      },
      {
        'question': 'What major awards has CVRU received?',
        'answer':
        '• ASSOCHAM India Excellence in Education Award 2018\n'
            '• World Education Award 2016\n'
            '• World Education Summit Award for Innovation\n'
            '• Felicitated for accepting NIELIT qualifiers for higher studies'
      },
    ];

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          "FAQ",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 1,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          final faq = faqList[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              color: isDark ? Colors.grey.shade900 : Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurRadius: 12,
                  spreadRadius: 1,
                  offset: const Offset(0, 3),
                  color: Colors.black.withOpacity(0.07),
                ),
              ],
            ),

            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),

                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

                leading: Icon(
                  Icons.question_mark_outlined,
                  color: Colors.blueAccent,
                  size: 20,
                ),

              title: Text(
                  faq['question']!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),

                iconColor: Colors.blueAccent,
                collapsedIconColor: Colors.blueAccent,

                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      faq['answer']!,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        color: isDark ? Colors.grey.shade300 : Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
