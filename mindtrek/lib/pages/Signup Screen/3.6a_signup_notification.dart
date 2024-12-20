import 'package:flutter/material.dart';
import 'package:mindtrek/Components/app_text.dart';
import 'package:mindtrek/pages/Signup%20Screen/3.7_signup_successfinal.dart';
import 'package:mindtrek/Components/round_button.dart';
import 'package:mindtrek/Components/stepped_progress_bar.dart';

class SignupNotificationScreen extends StatelessWidget {
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
                text: "Let us keep you motivated.",
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              SizedBox(height: 16),

              // Subtitle Text
              AppText(
                text: "We’ll send quick nudges to help you stay consistent with your wellness goals. No spam, just thoughtful reminders and tips to make every day better.",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF71727A),
                height: 1.5,
              ),
              SizedBox(height: 72),

              // Enable Notifications Button
              Center(
                child: RoundButton(
                  label: "Enable Notifications",
                  backgroundColor: Color(0xFFFE7762),
                  textColor: Colors.white,
                  onPressed: () {
                     Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupSuccessfinalScreen()),
                        );
                    print("Enable Notifications Pressed");
                  },
                  hasBorder: false,
                ),
              ),
              SizedBox(height: 24),

              // Set Up Later Text Button
              Center(
                child: GestureDetector(
                  onTap: () {
                    print("Set it up later Pressed");
                  },
                  child: AppText(
                    text: "Set it up later",
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFE7762),
                  ),
                ),
              ),
              SizedBox(height: 8),

              // Disclaimer Text
              Center(
                child: AppText(
                  text: "Notifications are designed to keep you consistent and inspired. You can manage them anytime in settings.",
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF71727A),
                  height: 1.5,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
