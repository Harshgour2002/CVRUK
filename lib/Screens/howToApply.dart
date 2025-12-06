import 'package:flutter/material.dart';

class Howtoapply extends StatelessWidget {
  const Howtoapply({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("How to Apply"),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // ---------- STEPS ----------
            Column(
              children: const [
                StepModern(
                  stepNumber: 1,
                  title: "Obtain the Admission Form",
                  description:
                  "The Admission Form is available at a cost of ₹500.\n\n"
                      "• Get it directly from the University Office or City Khandwa "
                      "by paying ₹500 in cash or via Demand Draft issued in favor of "
                      "“Dr. C.V. Raman University”, payable at Khandwa.\n\n"
                      "• Or download it from www.cvrump.ac.in and submit the form along "
                      "with a ₹500 DD. If sending by post, include an additional ₹100 "
                      "in the DD for postal charges.",
                ),
                StepModern(
                  stepNumber: 2,
                  title: "Select Your Course",
                  description:
                  "Dr. C.V. Raman University offers a wide range of degrees and programs.\n\n"
                      "Refer to Annexure-1 for:\n"
                      "• Complete program list\n"
                      "• Eligibility criteria\n"
                      "• Admission procedure\n"
                      "• Fee structure\n\n"
                      "Choose the program that aligns with your interests and goals.",
                ),
                StepModern(
                  stepNumber: 3,
                  title: "Complete the Application Form",
                  description:
                  "Follow the form instructions carefully.\n\n"
                      "• Fill the form in your own handwriting using black ink.\n"
                      "• Students awaiting results may apply provisionally at their own risk.\n"
                      "• Provide a clear email ID and phone number for communication.\n"
                      "• Attach self-attested copies of marksheets and testimonials.\n"
                      "• Do NOT send original documents — they will not be returned.\n"
                      "• No changes will be allowed after submission.\n\n"
                      "A sample completed Application Form is provided for reference.",
                ),
              ],
            ),

            const SizedBox(height: 10),
            const Divider(height: 10, color: Colors.grey),
            const SizedBox(height: 10),

            // ---------- CARD 1 ----------
            _buildInfoCard(
              title: "Submitting the Application Form",
              content:
              "Duly attested documents along with the Application Forms "
                  "should be submitted/sent to the following address:",
            ),

            const SizedBox(height: 15),

            // ---------- CARD 2 ----------
            _buildInfoCard(
              title: "DR. C. V. RAMAN UNIVERSITY",
              content:
              "Indore-Khandwa Highway, Village Chhaigaon Makhan,\n"
                  "Khandwa, M.P.- 450771, India\n\n"
                  "Phone: 07320-247700/01\n"
                  "Mobile: 8357908226, 8226037873, 8103941458, 7987980525\n\n"
                  "Email: registrarcvruk@gmail.com\n"
                  "admission@cvrump.ac.in",
            ),

            const SizedBox(height: 15),

            // ---------- CARD 3 ----------
            _buildInfoCard(
              title: "DR. C. V. RAMAN UNIVERSITY - CITY OFFICE",
              content:
              "Vaikunth Nagar, In front of S.N. College,\n"
                  "Distt. Khandwa, Pin: 450001 (M.P.)\n\n"
                  "Phone: 0733 221209\n"
                  "Mobile: 9907037693",
            ),
          ],
        ),
      ),
    );
  }

  // ---------- CARD BUILDER ----------
  static Widget _buildInfoCard({
    required String title,
    required String content,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class StepModern extends StatelessWidget {
  final int stepNumber;
  final String title;
  final String description;

  const StepModern({
    super.key,
    required this.stepNumber,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                // Step circle
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.shade500,
                        Colors.blue.shade700,
                      ],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withValues(alpha: 0.25),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "$stepNumber",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

              ],
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
