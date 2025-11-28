import 'package:flutter/material.dart';

import '../Cards/latestNewsCard.dart';
import 'NewsDetailPage.dart';

class LatestNews extends StatelessWidget {
   LatestNews({super.key});

   final List<Map<String, dynamic>> latestNews = [
     {
       "title": "this is the title for news 1",
       "description": "this is the description of news 1",
       "image": "assets/images/image1.jpeg",
       "published_by": "CVRUK",
       "publishing_date": "21 feb 2022",
       "images": [
         "assets/images/image1.jpeg",
         "assets/images/image2.jpeg",
         "assets/images/image3.jpeg",
       ]
     },
     {
       "title": "this is the title for news 2",
       "description": "this is the description of news 2",
       "image": "assets/images/image2.jpeg",
       "published_by": "CVRUK",
       "publishing_date": "17 mar 2024",
       "images": [
         "assets/images/image2.jpeg",
         "assets/images/image3.jpeg",
       ]
     },
     {
       "title": "this is the title for news 3",
       "description": "this is the description of news 3",
       "image": "assets/images/image3.jpeg",
       "published_by": "CVRUK",
       "publishing_date": "24 dec 2025",
       "images": [
         "assets/images/image3.jpeg",
         "assets/images/image1.jpeg",
         "assets/images/image2.jpeg",
       ]
     }
   ];

   //publishing date, published by, carousel for news images,

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latest News"),
        elevation: 1,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: latestNews.length,
        itemBuilder: (context, index) {
          final event = latestNews[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailPage(
                    title: event["title"]!,
                    description: event["description"]!,
                    publishedBy: event["published_by"]!,
                    publishDate: event["publishing_date"]!,
                    image: event["image"]!,
                    images: List<String>.from(event["images"]!),
                  ),
                ),
              );
            },
            child: LatestNewsCard(latestNews: event),
          );
        },
      ),
    );
  }
}
