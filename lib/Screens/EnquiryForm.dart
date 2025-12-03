import 'package:flutter/material.dart';

class EnquiryForm extends StatefulWidget {
  const EnquiryForm({super.key});

  @override
  State<EnquiryForm> createState() => _EnquiryFormState();
}

class _EnquiryFormState extends State<EnquiryForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  // 🔥 Program → Courses Mapping (UPDATED)
  final Map<String, List<String>> programCourses = {
    "Diploma": [
      "Diploma in Medical Laboratory Technology",
      "Diploma in Computer Application",
      "Post Graduate Diploma in Computer Application",
      "Diploma in Pharmacy",
    ],
    // 🔥 UPDATED WITH IMAGE DATA
    "Undergraduate": [
      "Bachelors of Science in Agriculture",
      "Bachelors Of Medical Laboratory Technology",
      "Bachelors of Physiotherapy",
      "Bachelors of Pharmacy",
      "Bachelors of Commerce (Plain)",
      "Bachelors of Science in Micro Biology",
      "Bachelors of Education",
      "Bachelors in Science (Chemistry, Botany & Zoology with Diploma in Medical Laboratory Technology)",
      "Bachelors of Science (Chemistry, Botany & Zoology)",
      "Bachelors of Science (Physics, Chemistry & Maths)",
      "Bachelors of Technology in Agriculture Engineering",
      "Bachelors of Vocational Education in Information Technology",
      "Bachelors of Vocational Education In Bamboo Craft Enterprise",
      "Bachelors of Vocational Education in Medical Laboratory Technician",
      "Bachelors of Business Management",
      "Bachelors of Computer Application",
      "Bachelors of social work",
      "Bachelors of Journalism and Mass Communication",
      "Bachelors of Library Science",
      "Bachelors of Arts",
    ],

    // 🔥 UPDATED WITH IMAGE DATA
    "Postgraduate": [
      "Masters of Science in Agriculture Extension",
      "Masters of Science in Agronomy Education",
      "Masters in Commerce",
      "Masters of Science in Ziology",
      "Masters in Science (Ziology with Post Graduation Diploma in Computer Application)",
      "Masters of Science in Botany",
      "Masters of Science in MatheMatics",
      "Masters of Science in Chemistry",
      "Masters in Science (Chemistry with Post Graduation Diploma in Computer Application)",
      "Masters in Science (Maths with Post Graduation Diploma in Computer Application)",
      "Masters of Science (Botany with Post Graduation Diploma in Computer Application)",
      "Masters in Science (Information Technology)",
      "Masters in Computer Application",
      "Masters in Business Administration",
      "Masters of Social Work",
      "Masters of Library Science",
      "Masters of Arts (English)",
      "Masters of Arts (Hindi)",
      "Masters of Arts (Sociology)",
      "Masters of Arts (Political Science)",
      "Masters of Arts (History)",
    ],

    "PHD": [
      "phD in Education",
      "phD in Management",
      "phD in Commerce",
      "phD in Agriculture",
      "phD in Physics",
      "phD in Chemistry",
      "phD in Zoology",
      "phD in Political Science",
      "phD in English Literature",
      "phD in Hindi Literature",
    ],
  };

  final List<String> programType = [
    "Select Program",
    "Diploma",
    "Undergraduate",
    "Postgraduate",
    "PHD",
  ];

  String? selectedProgram = "Select Program";
  String? selectedCourse;

  InputDecoration modernInput(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.grey.shade300),
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
    return Scaffold(
      appBar: AppBar(title: const Text("Enquiry Form"), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
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
                  // Name
                  TextFormField(
                    controller: nameController,
                    decoration: modernInput("Full Name"),
                    validator: (v) =>
                        v == null || v.isEmpty ? "Enter your name" : null,
                  ),

                  const SizedBox(height: 16),

                  // Email
                  TextFormField(
                    controller: emailController,
                    decoration: modernInput("Email Address"),
                      validator: (v) =>
                        v == null || v.isEmpty ? "Enter your email" : null,
                  ),

                  const SizedBox(height: 16),

                  // Contact
                  TextFormField(
                    controller: contactController,
                    keyboardType: TextInputType.phone,
                    decoration: modernInput("Enter phone"),
                    validator: (v) =>
                        v == null || v.isEmpty ? "Enter your phone number" : null,
                  ),

                  const SizedBox(height: 20),

                  // Program Dropdown
                  const Text("Program Type"),
                  DropdownButtonFormField<String>(
                    initialValue: selectedProgram,
                    items: programType.map((p) {
                      return DropdownMenuItem(value: p, child: Text(p));
                    }).toList(),
                    decoration: const InputDecoration(border: OutlineInputBorder()),
                    onChanged: (value) {
                      setState(() {
                        selectedProgram = value!;
                        selectedCourse = null; // Reset course
                      });
                    },
                    validator: (v) =>
                        v == "Select Program" ? "Select a program" : null,
                  ),

                  const SizedBox(height: 20),

                  // Course Dropdown (only visible after program selected)
                  if (selectedProgram != "Select Program")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Select Course"),

                        DropdownButtonFormField<String>(
                          value: selectedCourse,
                          isExpanded: true,
                          isDense: false, // important → allows height to grow
                          itemHeight: null, // important → removes fixed 48px height

                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                          ),

                          // Selected value widget (dynamic height)
                          selectedItemBuilder: (BuildContext context) {
                            return programCourses[selectedProgram]!.map((value) {
                              return Flexible(
                                child: Text(
                                  value,
                                  style: const TextStyle(color: Colors.black),
                                  softWrap: true,
                                  maxLines: null,
                                  overflow: TextOverflow.visible,
                                ),
                              );
                            }).toList();
                          },

                          // Menu items
                          items: programCourses[selectedProgram]!.map((course) {
                            return DropdownMenuItem(
                              value: course,
                              child: Text(course, softWrap: true, maxLines: null),
                            );
                          }).toList(),

                          onChanged: (value) {
                            setState(() => selectedCourse = value);
                          },

                          validator: (v) =>
                              v == null ? "Please select a course" : null,
                        ),
                      ],
                    ),

                  const SizedBox(height: 30),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      child: const Text("Submit"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Form Submitted Successfully"),
                            ),
                          );
                        }
                      },
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
