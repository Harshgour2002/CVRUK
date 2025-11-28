import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:share_plus/share_plus.dart';

class OngoingProgramDetailPage extends StatefulWidget {
  final Map<String, String> program;

  const OngoingProgramDetailPage({super.key, required this.program});

  @override
  State<OngoingProgramDetailPage> createState() =>
      _OngoingProgramDetailPageState();
}

class _OngoingProgramDetailPageState extends State<OngoingProgramDetailPage> {
  double downloadProgress = 0.0;
  bool isDownloading = false;

  /// ----------------------------------
  /// SHARE PROGRAM
  /// ----------------------------------
  void shareProgram() {
    Share.share(
      "Check out this program: ${widget.program["title"]}\n"
          "Date: ${widget.program["date"]} at ${widget.program["time"]}\n"
          "Venue: ${widget.program["venue"]}",
    );
  }

  /// ----------------------------------
  /// DOWNLOAD BROCHURE
  /// ----------------------------------
  Future<void> downloadBrochure() async {
    try {
      setState(() {
        isDownloading = true;
        downloadProgress = 0;
      });

      final downloadsDir = "/storage/emulated/0/Download";
      final fileName = "${widget.program["title"]}_Brochure.pdf";
      final savePath = "$downloadsDir/$fileName";

      Dio dio = Dio();

      await dio.download(
        widget.program["brochureUrl"]!,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            setState(() {
              downloadProgress = received / total;
            });
          }
        },
      );

      setState(() => isDownloading = false);

      OpenFilex.open(savePath);
    } catch (e) {
      setState(() => isDownloading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Download failed")),
      );
    }
  }

  /// ----------------------------------
  /// UI BUILD
  /// ----------------------------------
  @override
  Widget build(BuildContext context) {
    final program = widget.program;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// -----------------------------------------
            /// TOP IMAGE + BACK BUTTON + HERO ANIMATION
            /// -----------------------------------------
            Stack(
              children: [
                Hero(
                  tag: program["image"]!,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      program["image"]!,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  top: 40,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(Icons.arrow_back,
                          color: Colors.white, size: 24),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            /// -----------------------------------------
            /// DETAILS CARD
            /// -----------------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(program["title"]!,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 6),

                    Text(program["subtitle"]!,
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey.shade700)),
                    const SizedBox(height: 20),

                    infoRow(Icons.calendar_month, "Date", program["date"]!),
                    const SizedBox(height: 12),

                    infoRow(Icons.access_time, "Time", program["time"]!),
                    const SizedBox(height: 12),

                    infoRow(Icons.location_on, "Venue", program["venue"]!),
                    const SizedBox(height: 12),

                    infoRow(Icons.business, "Organizing Dept.",
                        program["organisingDepartment"]!),
                    const SizedBox(height: 25),

                    Text("About the Program",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10),

                    Text(
                      program["description"]!,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        color: Colors.grey.shade700,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// --------------------------
                    /// DOWNLOAD BROCHURE BUTTON
                    /// --------------------------
                    ElevatedButton(
                      onPressed: isDownloading ? null : downloadBrochure,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        elevation: 0,
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: isDownloading
                          ? SizedBox(
                        width: 25,
                        height: 25,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: downloadProgress,
                              strokeWidth: 3,
                              color: Colors.black,
                            ),
                            Text(
                              "${(downloadProgress * 100).toStringAsFixed(0)}%",
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                          : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.download_rounded,
                              size: 20, color: Colors.black),
                          SizedBox(width: 8),
                          Text(
                            "Download Brochure",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      /// -----------------------------------------
      /// BOTTOM SHARE + REGISTER BAR
      /// -----------------------------------------
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, -2)),
          ],
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: shareProgram,
              icon: Icon(Icons.share, size: 28),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Navigate to registration
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  "Register Now",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// REUSABLE INFO ROW
  Widget infoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 22, color: Colors.blueAccent),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              Text(value,
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade700)),
            ],
          ),
        ),
      ],
    );
  }
}
