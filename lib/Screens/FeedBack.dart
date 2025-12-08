import 'package:cvruk/Screens/homeScreen.dart';
import 'package:flutter/material.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  String? selectedFeedbackType;

  final List<String> feedbackTypes = [
    "Suggestion",
    "Complaint",
    "App Feedback",
    "Other",
  ];

  InputDecoration modernInput(String label, bool isDark) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: isDark ? Colors.grey.shade800 : Colors.grey.shade100,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      labelStyle:  TextStyle(fontSize: 15, color: Colors.grey.shade500),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.blue, width: 1.4),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: isDark ? Colors.grey.shade900 : Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: const Offset(0, 2),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "We value your feedback",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Help us improve your experience",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(height: 25),

                  TextFormField(
                    key: UniqueKey(),
                    controller: nameController,
                    decoration: modernInput("Full Name", isDark),
                    validator: (value) =>
                    value!.isEmpty ? "Please enter your name" : null,
                  ),
                  const SizedBox(height: 15),

                  TextFormField(
                    key: UniqueKey(),
                    controller: emailController,
                    decoration: modernInput("Email", isDark),
                    validator: (value) =>
                    value!.contains("@") ? null : "Enter valid email",
                  ),
                  const SizedBox(height: 15),

                  TextFormField(
                    key: UniqueKey(),
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: modernInput("Phone Number", isDark),
                    validator: (value) =>
                    value!.length == 10 ? null : "Enter valid phone number",
                  ),
                  const SizedBox(height: 15),

                  DropdownButtonFormField(
                    value: selectedFeedbackType,
                    decoration: modernInput("Feedback Type", isDark),
                    items: feedbackTypes
                        .map((type) => DropdownMenuItem(
                      value: type,
                      child: Text(type),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedFeedbackType = value;
                      });
                    },
                    validator: (value) => value == null ? "Select feedback type" : null,
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    key: UniqueKey(),
                    controller: messageController,
                    maxLines: 5,
                    decoration: modernInput("Your Message", isDark),
                    validator: (value) =>
                    value!.isEmpty ? "Please enter your message" : null,
                  ),
                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Feedback Submitted!")),
                          );

                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
                            Homescreen()
                          ));

                          _formKey.currentState!.reset();
                        }
                      },

                      child: const Text(
                        "Submit Feedback",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
