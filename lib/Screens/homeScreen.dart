import 'package:cvruk/Widgets/FloatingNavigationBar.dart';
import 'package:cvruk/Widgets/affiliated_organizations.dart';
import 'package:flutter/material.dart';
import '../Widgets/UniversityFadeCarousel.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final placedStudents = [
    "assets/images/image1.jpeg",
    "assets/images/image2.jpeg",
    "assets/images/image3.jpeg",
  ];

  int _currentIndex = 0;
  final List<Widget> _pages = [
    const Homescreen(),
    const Center(child: Text("this is gallery"),),
    const Center(child: Text("this is career"),),
    const Center(child: Text("this is contact"),),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),

          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// -------- LEFT SIDE (Logo + Title) ----------
                Row(
                  children: [
                    Image.asset('assets/university-logo.png', height: 45),
                    const SizedBox(width: 14),

                    Text(
                      "CVRUK",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.4,
                      ),
                    ),
                    SizedBox(height: 2),
                  ],
                ),

                /// -------- RIGHT SIDE (Profile Button) ----------
                InkWell(
                  onTap: () {
                    //take to the login screen for student to login
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: const CircleAvatar(
                    radius: 22,
                    backgroundColor: Color(0xFFF0F0F0),
                    child: Icon(Icons.person, size: 28, color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          //CarouselSlider() for showing placement images,
          //const SizedBox(height: 10,),
          //Placedstudentcarousel(studentImages: placedStudents,),
          //fade-in fade-out effect of university images, and top of that about university
          //on bottom of the image
          //const SizedBox(height: 10,),
          UniversityFadeCarousel(
            images: placedStudents,
            aboutText:
                "Our university has a legacy of excellence in education, global research, "
                "and student-centered innovation.",
          ),
          const SizedBox(height: 10),
          //horizontal scrollable list of affiliation
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.topLeft,
                child: const Text(
                    "Accreditation and Affiliation",
                  style: TextStyle(fontSize: 18,
                )),
            ),
          ),
          //const SizedBox(height: 8),
          AffiliatedOrganizationsBox(),
          const SizedBox(height: 10),
          //grid view of explore section for different services
          //bottom navigation bar with home, gallery, course, career
        ],
      ),
      // _pages[_currentIndex],
      // bottomNavigationBar : Floatingnavigationbar(
      //   currentIndex: _currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      // ),
    );
  }
}
