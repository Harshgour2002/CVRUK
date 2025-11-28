import 'package:cvruk/Screens/EventRegistrationForm.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:share_plus/share_plus.dart';

class UpcomingEventDetailPage extends StatefulWidget {
  final Map<String, String> event;

  const UpcomingEventDetailPage({super.key, required this.event});

  @override
  State<UpcomingEventDetailPage> createState() =>
      _UpcomingEventDetailPageState();
}

class _UpcomingEventDetailPageState extends State<UpcomingEventDetailPage> {
  double downloadProgress = 0.0;
  bool isDownloading = false;

  /// ----------------------------
  /// SHARE EVENT
  /// ----------------------------
  void shareEvent(BuildContext context) {
    Share.share(
      "Check out this event: ${widget.event["title"]}\n"
      "Date: ${widget.event["date"]} | Time: ${widget.event["time"]}\n"
      "Venue: ${widget.event["venue"]}",
    );
  }

  /// ----------------------------
  /// DOWNLOAD BROCHURE WITH PROGRESS
  /// ----------------------------
  Future<void> downloadBrochure(BuildContext context) async {
    try {
      setState(() {
        isDownloading = true;
        downloadProgress = 0;
      });

      final downloadsDir = "/storage/emulated/0/Download";
      final fileName = "${widget.event["title"]}_Brochure.pdf";
      final savePath = "$downloadsDir/$fileName";

      Dio dio = Dio();

      await dio.download(
        widget.event["brochureUrl"]!,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            setState(() {
              downloadProgress = received / total;
            });
          }
        },
      );

      setState(() {
        isDownloading = false;
      });

      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text("Downloaded to Downloads folder")),
      // );

      OpenFilex.open(savePath);
    } catch (e) {
      setState(() {
        isDownloading = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Download failed")));
    }
  }

  /// ----------------------------
  /// UI BUILD
  /// ----------------------------
  @override
  Widget build(BuildContext context) {
    final event = widget.event;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// -----------------------------------------------------
            /// TOP IMAGE
            /// -----------------------------------------------------
            Stack(
              children: [
                Hero(
                  tag: event["image"]!,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      event["image"]!,
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
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            /// -----------------------------------------------------
            /// DETAILS CARD
            /// -----------------------------------------------------
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
                    Text(
                      event["title"]!,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      event["subtitle"]!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 20),

                    infoRow(Icons.calendar_today, "Date", event["date"]!),
                    const SizedBox(height: 12),
                    infoRow(Icons.access_time, "Time", event["time"]!),
                    const SizedBox(height: 12),
                    infoRow(Icons.email_outlined, "Email", "abc@example.com"),
                    const SizedBox(height: 12),
                    infoRow(Icons.location_on, "Venue", event["venue"]!),
                    const SizedBox(height: 12),
                    infoRow(
                      Icons.apartment,
                      "Organizing Dept.",
                      event["organisingDepartment"]!,
                    ),
                    const SizedBox(height: 25),

                    Text(
                      "About the Event",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Text(
                      event["description"]!,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade700,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// -------------------------------------------------
                    /// DOWNLOAD BUTTON WITH PROGRESS
                    /// -------------------------------------------------
                    ElevatedButton(
                      onPressed: isDownloading
                          ? null
                          : () => downloadBrochure(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        elevation: 0,
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
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
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.download_rounded,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Download Brochure",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      /// -----------------------------------------------------
      /// BOTTOM BAR
      /// -----------------------------------------------------
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () => shareEvent(context),
              icon: Icon(Icons.share, size: 28),
            ),

            SizedBox(width: 10),

            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  //navigate to register form for event
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventRegistrationForm(title: event["title"]!),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
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

  /// Reusable row
  Widget infoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 22, color: Colors.blueAccent),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              Text(
                value,
                style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
