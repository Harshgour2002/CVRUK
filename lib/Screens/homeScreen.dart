import 'package:cvruk/Screens/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Widgets/AdmissionsPage.dart';
import '../Widgets/ContactPage.dart';
import '../Widgets/CoursesPage.dart';
import '../Widgets/HomeContent.dart';
import '../Widgets/BottomNavBar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = const [
    HomeContent(),
    CoursesPage(),
    AdmissionsPage(),
    ContactPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/university-logo.png', height: 45),
                    const SizedBox(width: 14),
                    Text(
                      "CVRUK",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Profilepage()));
                  },
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.tertiaryContainer,
                    child: Icon(
                      Icons.person,
                      size: 28,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: _screens[_selectedIndex],

      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
