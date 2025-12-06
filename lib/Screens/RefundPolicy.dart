import 'package:flutter/material.dart';

class Refundpolicy extends StatelessWidget {
  const Refundpolicy({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      //backgroundColor: Colors.grey.shade100,

      appBar: AppBar(title: const Text("Refund Policy"), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              "Online Payment Refund & Cancellation Policy",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 12),

            // Subtitle
            const Text(
              "The following rules will govern the refund of fee in case of withdrawal of admission:",
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
                //color: Colors.black87,
              ),
            ),

            const SizedBox(height: 20),

            // Card Section 1
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey.shade900 : Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 1,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: const Text(
                "• If the student/candidate withdraws the admission on or before the "
                "closure of the admission process (as per Important Dates), the entire "
                "fee will be refunded after deducting a processing fee of ₹2000.",
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
            ),

            const SizedBox(height: 16),

            // Card Section 2
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey.shade900 : Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 1,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: const Text(
                "• If a candidate withdraws after the closure of the admission process, "
                "regardless of whether they attended classes or not, the admission will "
                "stand cancelled and no fee will be refunded.",
                style: TextStyle(fontSize: 15, height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
