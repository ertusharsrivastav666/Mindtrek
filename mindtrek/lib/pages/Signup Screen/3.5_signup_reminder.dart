import 'package:flutter/material.dart';
import 'package:mindtrek/Components/app_text.dart';
import 'package:mindtrek/pages/Signup%20Screen/3.6a_signup_notification.dart';
import 'package:mindtrek/Components/round_button.dart';
import 'package:mindtrek/Components/stepped_progress_bar.dart';

class SignupReminderScreen extends StatelessWidget {
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
              SizedBox(height: 16),

              // Step Progress Bar
              StepProgressBar(
                totalSteps: 3,
                currentStep: 3, // Final step
                activeColor: Color(0xFFFE7762),
                inactiveColor: Color(0xFFE8E9F1),
                barHeight: 8,
                barWidth: 110,
                spacing: 6,
              ),
              SizedBox(height: 34),

              // Back Button and Sign Up Label
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      'assets/images/left_button.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                  SizedBox(width: 125),
                  AppText(
                    text: 'Sign up',
                    color: Color(0xFF1F2024),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 42),

              // Title Text
              AppText(
                text: "Let’s find the perfect trails\nnear you.",
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              SizedBox(height: 16),

              // Subtitle Text
              AppText(
                text:
                    "We use your location to suggest hidden gems nearby, guide you safely on your walks, and make your experience effortless. Your privacy stays protected—always.",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF71727A),
                height: 1.5,
              ),
              SizedBox(height: 72),

              // Enable Location Button
              Center(
                child: RoundButton(
                  label: "Enable Location to Start Exploring",
                  backgroundColor: Color(0xFFFE7762),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupNotificationScreen()),
                        );
                    print("Enable Location Button Pressed");
                  },
                  hasBorder: false,
                ),
              ),
              SizedBox(height: 24),

              // Disclaimer Text
              AppText(
                text:
                    "MindTrek only uses your location to enhance your experience. You can update this anytime in settings.",
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Color(0xFF71727A),
                height: 1.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
