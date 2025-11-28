import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NewsDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final String publishedBy;
  final String publishDate;
  final String image;
  final List<String> images;

  const NewsDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.publishedBy,
    required this.publishDate,
    required this.image,
    required this.images,
  });

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Details",
            style: TextStyle(fontWeight: FontWeight.w600)),
        elevation: 0.4,
      ),

      body: Column(
        children: [
          // ---------- CAROUSEL + INDICATORS ----------
          SizedBox(
            height: 260,
            child: Stack(
              children: [
                CarouselSlider(
                  items: widget.images.map((img) {
                    return ClipRRect(
                      child: Image.asset(
                        img,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 260,
                    viewportFraction: 1,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() => currentIndex = index);
                    },
                  ),
                ),

                Positioned(
                  bottom: 12,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      widget.images.length,
                          (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: currentIndex == index ? 18 : 8,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? Colors.white
                              : Colors.white54,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // -----------------------
          // CONTENT SECTION
          // -----------------------
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ----------------- TITLE -----------------
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                      letterSpacing: 0.2,
                    ),
                  ),

                  const SizedBox(height: 14),

                  // ----------------- META CARD -----------------
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.04),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _metaRow("Publishing Date", widget.publishDate),
                        const SizedBox(height: 8),
                        Divider(color: Colors.grey.shade300, height: 1),
                        const SizedBox(height: 8),
                        _metaRow("Published By", widget.publishedBy),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ----------------- DESCRIPTION -----------------
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.55,
                      color: Colors.black87,
                      letterSpacing: 0.1,
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _metaRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            )),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14.5,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
