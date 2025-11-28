import 'package:flutter/material.dart';

class EventRegistrationForm extends StatefulWidget {
  final String title;
  const EventRegistrationForm({
    super.key,
    required this.title,
  });

  @override
  State<EventRegistrationForm> createState() => _EventRegistrationFormState();
}

class _EventRegistrationFormState extends State<EventRegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Dropdown values
  String? selectedDepartment;
  String? userType; // Faculty or Student
  String? selectedEvent;

  // Dropdown Lists
  final List<String> departments = [
    "Computer Science",
    "Management",
    "Engineering",
    "Pharmacy",
    "Commerce",
    "Law",
    "Science",
  ];

  final List<String> userTypes = [
    "Student",
    "Faculty",
  ];

  final List<String> events = [
    "AI & Robotics Summit",
    "Cultural Fest 2025",
    "Tech Expo",
    "Sports Meet",
    "Guest Lecture Series",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Event Registration",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                widget.title,
                style: TextStyle(fontSize:20 ,fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 13),
              /// Name
              TextFormField(
                controller: nameController,
                decoration: inputStyle("Full Name"),
                validator: (value) =>
                value!.isEmpty ? "Please enter your name" : null,
              ),
              const SizedBox(height: 16),

              /// Email
              TextFormField(
                controller: emailController,
                decoration: inputStyle("Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                value!.contains("@") ? null : "Enter a valid email",
              ),
              const SizedBox(height: 16),

              /// Phone
              TextFormField(
                controller: phoneController,
                decoration: inputStyle("Phone Number"),
                keyboardType: TextInputType.phone,
                validator: (value) =>
                value!.length == 10 ? null : "Enter 10-digit phone number",
              ),
              const SizedBox(height: 16),

              /// Department
              DropdownButtonFormField(
                decoration: inputStyle("Select Department"),
                initialValue: selectedDepartment,
                items: departments
                    .map((dept) =>
                    DropdownMenuItem(value: dept, child: Text(dept)))
                    .toList(),
                onChanged: (value) {
                  setState(() => selectedDepartment = value);
                },
                validator: (value) =>
                value == null ? "Select a department" : null,
              ),
              const SizedBox(height: 16),

              /// Faculty or Student
              DropdownButtonFormField(
                decoration: inputStyle("You are a?"),
                initialValue: userType,
                items: userTypes
                    .map((type) =>
                    DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) {
                  setState(() => userType = value);
                },
                validator: (value) =>
                value == null ? "Please select your role" : null,
              ),
              const SizedBox(height: 16),

              /// Event Selection
              DropdownButtonFormField(
                decoration: inputStyle("Select Event"),
                initialValue: selectedEvent,
                items: events
                    .map((evt) =>
                    DropdownMenuItem(value: evt, child: Text(evt)))
                    .toList(),
                onChanged: (value) {
                  setState(() => selectedEvent = value);
                },
                validator: (value) =>
                value == null ? "Select an event" : null,
              ),

              const SizedBox(height: 28),

              /// Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      /// Submit data to backend / Firebase here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Registration Submitted Successfully!"),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Input decoration style
  InputDecoration inputStyle(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.blueAccent, width: 1.5),
      ),
    );
  }
}
