import 'package:flutter/material.dart';
import 'Screens/homeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CVRUApp());
}

class CVRUApp extends StatelessWidget {
  const CVRUApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CVRU University',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3B82F6)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3B82F6),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
      ),
      home: const Homescreen(),
    );
  }
}
