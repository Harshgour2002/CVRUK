import 'package:cvruk/Screens/OngoingProgramDetail.dart';
import 'package:flutter/material.dart';

import '../Cards/ongoingProgramsCard.dart';

class OngoingPrograms extends StatelessWidget {
  final List<Map<String, String>> ongoingProgramsList = [
    {
      "title": "AI & Robotics Summit 2025",
      "subtitle": "National-level conference on future technologies.",
      "description":
      "A national summit on Artificial Intelligence and Robotics featuring keynote sessions, hands-on workshops, project exhibitions, and panel discussions led by industry experts and researchers.",
      "image": "assets/images/image1.jpeg",
      "venue": "Dr. C.V. Raman University, Khandwa",
      "date": "14 Dec 2025",
      "time": "6:00 PM",
      "organisingDepartment": "Department of Computer Science & Engineering",
      "brochureUrl": "https://s3.tebi.io/cvru/dummyBrochure.pdf"
    },
    {
      "title": "Sports Meet 2025",
      "subtitle": "Annual inter-departmental sports championship.",
      "description":
      "The university’s largest sports event featuring athletics, indoor games, outdoor tournaments, fitness challenges, and team competitions encouraging sportsmanship and teamwork.",
      "image": "assets/images/image2.jpeg",
      "venue": "Dr. C.V. Raman University, Khandwa",
      "date": "17 Dec 2025",
      "time": "2:00 PM",
      "organisingDepartment": "Department of Physical Education",
      "brochureUrl": "https://s3.tebi.io/cvru/dummyBrochure.pdf"
    },
    {
      "title": "Cultural Fest 2025",
      "subtitle": "A celebration of creativity, talent, and culture.",
      "description":
      "A vibrant cultural festival featuring dance, music, drama, fashion shows, art displays, food stalls, and competitions where students showcase their artistic talents.",
      "image": "assets/images/image3.jpeg",
      "venue": "Dr. C.V. Raman University, Khandwa",
      "date": "24 Dec 2025",
      "time": "3:00 PM",
      "organisingDepartment": "Department of Cultural Activities",
      "brochureUrl": "https://s3.tebi.io/cvru/dummyBrochure.pdf"
    },
  ];

  OngoingPrograms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ongoing Programs"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
          itemCount: ongoingProgramsList.length,
          itemBuilder: (context, index){
          final program = ongoingProgramsList[index];
          return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OngoingProgramDetailPage(program : program
                    ),
                  ),
                );
              },
              child: ongoingProgramsCard( ongoingProgram : program));
          }),
    );
  }
}
