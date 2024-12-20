import 'dart:async';
import 'package:flutter/material.dart';
import 'Onboarding Screen/onboarding_screen.dart';
import 'package:flutter/services.dart'; // Add this import

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Set the status bar color to match the splash screen background only for this screen
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: const Color(0xFF2A4337), // Set the background color of the status bar
        statusBarBrightness: Brightness.dark,     // Use dark icons on light background
        statusBarIconBrightness: Brightness.dark, // Make status bar icons dark for contrast
      ),
    );

    // Navigate to OnboardingScreen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      // Reset the status bar style when navigating away from SplashScreen
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // Reset status bar to default
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A4337), // Background color for splash
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo image
            Image.asset(
              'assets/images/mindtrek-logo.png', // Replace with your image path
              width: 100,
              height: 100,
            ),
            SizedBox(
              width: 342,
              child: Text(
                'mindtrek',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
