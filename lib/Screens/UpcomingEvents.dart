import 'package:flutter/material.dart';

import '../Cards/upcomingEventCard.dart';

class UpcomingEvents extends StatelessWidget {
  final List<Map<String, String>> upcomingEvents = [
    {
      "title": "AI & Robotics Summit 2025",
      "subtitle": "Join the national tech conference held at CVRU auditorium.",
      "description":
      "A national summit on Artificial Intelligence and Robotics featuring expert talks, demonstrations, workshops, and discussions on the future of automation.",
      "image": "assets/images/image1.jpeg",
      "venue": "Dr. C.V. Raman University, Khandwa",
      "date": "14 Dec 2025",
      "time": "6:00 PM",
      "organisingDepartment": "Department of Computer Science & Engineering",
      "brochureUrl":
      "https://s3.tebi.io/cvru/dummyBrochure.pdf" // replace with real link
    },
    {
      "title": "Sports Meet 2025",
      "subtitle": "Annual inter-department sports tournament.",
      "description":
      "A university-wide​ sports competition where students participate in track, field, indoor and outdoor games, promoting fitness and team spirit.",
      "image": "assets/images/image2.jpeg",
      "venue": "Dr. C.V. Raman University, Khandwa",
      "date": "17 Dec 2025",
      "time": "2:00 PM",
      "organisingDepartment": "Department of Physical Education",
      "brochureUrl":
      "https://s3.tebi.io/cvru/dummyBrochure.pdf"
    },
    {
      "title": "Cultural Fest",
      "subtitle": "Music, dance, drama and food festival.",
      "description":
      "A celebration of art and culture with performances, competitions, food stalls, exhibitions and a full evening of entertainment.",
      "image": "assets/images/image3.jpeg",
      "venue": "Dr. C.V. Raman University, Khandwa",
      "date": "24 Dec 2025",
      "time": "3:00 PM",
      "organisingDepartment": "Department of Cultural Activities",
      "brochureUrl":
      "https://s3.tebi.io/cvru/dummyBrochure.pdf"
    },
  ];


  //name, email, phone no, department, faculty ya student, event selection

  UpcomingEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upcoming Events"),
        elevation: 1,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: upcomingEvents.length,
        itemBuilder: (context, index) {
          final event = upcomingEvents[index];
          return UpcomingEventCard(event: event);
        },
      ),
    );
  }
}
