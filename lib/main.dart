import 'package:cvruk/themes/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // <--- Import this
import 'Screens/homeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // --- ADD THIS BLOCK ---
  // This forces the status bar to be transparent and have dark icons by default
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark, // Android: Dark icons
    statusBarBrightness: Brightness.light,    // iOS: Dark icons
  ));
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
