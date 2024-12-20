import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: const Color(0xFFF9FDF5), // Set the background color of the status bar
      statusBarBrightness: Brightness.dark,     // Use dark icons on light background
      statusBarIconBrightness: Brightness.dark, // Make status bar icons dark for contrast
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Starts with the splash screen
    );
  }
}
