import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // For social icons
import 'package:url_launcher/url_launcher.dart';

class RamanVoice extends StatelessWidget {
  const RamanVoice({super.key});

  // Social links
  final String yt = "https://www.youtube.com/@ramanvoiceofficial";
  final String ig = "https://instagram.com/ramanvoiceofficial/";
  final String fb = "https://facebook.com/ramanvoiceofficial/";

  // Open URL
  void openLink(String url) {
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Raman Voice"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [

            // 🔵 Banner
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: AspectRatio(
                aspectRatio: 20 / 9,
                child: Image.asset(
                  "assets/RamanVoice/banner.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // 🔵 Logo (centered)
            Center(
              child: CircleAvatar(
                radius: 60,                   // outer radius → border size
                backgroundColor: Colors.grey,  // border color
                child: CircleAvatar(
                  radius: 59,                 // inner radius → actual image
                  backgroundImage: AssetImage(
                    "assets/ramanVoice/ramanVoice.jpg",
                  ),
                ),
              ),
            ),


            const SizedBox(height: 15),

            // 🔵 Title
            const Text(
              "Raman Voice",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 5),

            // Subtitle
            Text(
              "Voice with Vision",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 15),

            // 🔵 Description
            const Text("Raman Voice is the official web radio platform of Dr. C. V. Raman"
                  " University, Khandwa (M.P.), where students become creators,"
                  " storytellers, and voices of the campus. 🎧 From academic insights and "
                  " campus news to music, talk shows, and cultural highlights — "
                  " every broadcast celebrates creativity, learning, and student expression. 🌟"
                  " 📻 Powered by Students | Inspired by Knowledge | Tuned to Innovation",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),

            // 🔵 Social Media Section Title
            const Text(
              "Connect With Us",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 12),

            // 🔵 Social Media Icons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.youtube, size: 30),
                  color: Colors.red,
                  onPressed: () => openLink(yt),
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () => openLink(ig),
                  icon: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [
                          Color(0xFFF58529), // Orange
                          Color(0xFFDD2A7B), // Pink/Magenta
                          Color(0xFF8134AF), // Purple
                          Color(0xFF515BD4), // Blue
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds);
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.instagram,
                      size: 30,
                      color: Colors.white, // must be white for gradient mask
                    ),
                  ),
                ),

                const SizedBox(width: 20),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.facebook, size: 30),
                  color: Colors.blue,
                  onPressed: () => openLink(fb),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
