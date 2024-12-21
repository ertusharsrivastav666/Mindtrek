import 'package:flutter/material.dart';
import 'package:mindtrek/Components/app_text.dart';
import 'package:mindtrek/pages/Onboarding%20Screen/onboarding_screen.dart';
import 'package:mindtrek/Components/round_button.dart';

class SignupSuccessfinalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7FDFA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 84),

              // Title Text
              AppText(
                text: "You’re All Set!",
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              SizedBox(height: 16),

              // Subtitle Text
              AppText(
                text:
                    "Your wellness journey is ready to begin. Let’s explore how MindTrek can help you connect with nature, stay mindful, and feel recharged every day.",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF71727A),
                height: 1.5,
              ),
              SizedBox(height: 48),

              // Done Button
              RoundButton(
                label: "Finish",
                backgroundColor: Color(0xFFFE7762),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OnboardingScreen()),
                        );
                  print("Done Button Pressed");
                },
                hasBorder: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
