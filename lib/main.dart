import 'package:cvruk/themes/AppTheme.dart';
import 'package:flutter/material.dart';
import 'Screens/homeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      const CVRUApp()
  );
}

class CVRUApp extends StatelessWidget {
  const CVRUApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CVRU University',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,     // Light Theme
      darkTheme: AppTheme.darkTheme, // Dark Theme
      themeMode: ThemeMode.system,
      home: const Homescreen(),
    );
  }
}
