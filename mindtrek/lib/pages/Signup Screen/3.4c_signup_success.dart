import 'package:flutter/material.dart';
import 'package:mindtrek/Components/app_text.dart';
import 'package:mindtrek/pages/Signup%20Screen/3.5_signup_reminder.dart';
import 'package:mindtrek/Components/round_button.dart';
import 'package:mindtrek/Components/stepped_progress_bar.dart';

class SignupSuccessScreen extends StatelessWidget {
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
                currentStep: 3, // Last step
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
                text: 'Your Profile is Ready!',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              SizedBox(height: 16),

              // Subtitle Text
              AppText(
                text: "Great job! We’ve set up your profile based on your focus areas.",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF71727A),
                height: 1.5,
              ),
              SizedBox(height: 12),

              AppText(
                text: "Now, let’s make sure you never miss a moment to reconnect with nature.",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF71727A),
                height: 1.5,
              ),
              SizedBox(height: 48),

              // Centered Continue Button
              Center(
                child: RoundButton(
                  label: "Let's Go",
                  backgroundColor: Color(0xFFFE7762),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupReminderScreen()),
                        );
                    print("Sign-up Success - Let's Go Button Clicked");
                  },
                  hasBorder: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
