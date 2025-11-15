import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

class Placedstudentcarousel extends StatefulWidget {
  final List<String> studentImages;
  const Placedstudentcarousel({super.key, required this.studentImages});

  @override
  State<Placedstudentcarousel> createState() => _PlacedstudentcarouselState();
}

class _PlacedstudentcarouselState extends State<Placedstudentcarousel> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.studentImages.map((student) {
            return ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(15),
              child: Image.asset(
                student,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 210,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.95,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 5,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
            widget.studentImages.map((images){
              int index = widget.studentImages.indexOf(images);
              return Container(
                width: _currentIndex == index ? 10 : 8,
                height: _currentIndex == index ? 10 : 8,
                margin: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? const Color(0xFF3B82F6)
                      : const Color(0xFFBDBDBD),
                ),
              );
            }).toList(),
        ),
      ],
    );
  }
}
