import 'package:flutter/material.dart';

class UniversityFadeCarousel extends StatefulWidget {
  final List<String> images;
  final String aboutText;

  const UniversityFadeCarousel({
    super.key,
    required this.images,
    required this.aboutText,
  });

  @override
  State<UniversityFadeCarousel> createState() => _UniversityFadeCarouselState();
}

class _UniversityFadeCarouselState extends State<UniversityFadeCarousel> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startAutoFade();
  }

  void _startAutoFade() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return false;
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.images.length;
      });
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 230,
        child: Stack(
          children: [
            /// ---------- FADE IMAGES ----------
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: ClipRRect(
                key: ValueKey(_currentIndex),
                //borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  widget.images[_currentIndex],
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// ---------- GRADIENT TEXT BACKGROUND ----------
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  // borderRadius: const BorderRadius.only(
                  //   bottomLeft: Radius.circular(18),
                  //   bottomRight: Radius.circular(18),
                  // ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.0), // transparent top
                      Colors.black.withValues(alpha: 0.5), // mid fade
                      Colors.black.withValues(alpha: 0.85), // darker bottom
                    ],
                  ),
                ),
                child: Text(
                  widget.aboutText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    height: 1.2,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
    );
  }
}
