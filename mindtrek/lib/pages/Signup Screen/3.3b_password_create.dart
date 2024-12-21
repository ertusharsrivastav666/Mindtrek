import 'package:flutter/material.dart';
import 'package:mindtrek/Components/app_text.dart';
import 'package:mindtrek/Components/round_button.dart';
import 'package:mindtrek/Components/stepped_progress_bar.dart';
import 'package:mindtrek/pages/Signup%20Screen/3.4a_signup_focus.dart';

class PasswordCreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7FDFA), // Light background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align everything to the start
            children: [
              // Top Progress Bar (Center-aligned)
              SizedBox(height: 16),
              Center(
                child: StepProgressBar(
                  totalSteps: 3,
                  currentStep: 2, // Final step
                  activeColor: Color(0xFFFE7762),
                  inactiveColor: Color(0xFFE8E9F1),
                  barHeight: 8,
                  barWidth: 110,
                  spacing: 6,
                ),
              ),
              SizedBox(height: 35),

              // Back Button
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
                    SizedBox(width: 117),
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

              // Success Message (Left-aligned)
              AppText(
                text: 'Password created\nsuccessfully!',
                color: Color(0xFF1F2024),
                fontSize: 24,
                fontWeight: FontWeight.w700,
               // letterSpacing: 0.24,
              ),
              SizedBox(height: 16),

              AppText(
                text: 'Your password has been created successfully. Let’s proceed to personalize the app experience for you..',
                color: Color(0xFF71727A),
                fontSize: 14,
              ),
              SizedBox(height: 48),

              // "Go To Login" Button
              RoundButton(
                label: 'Continue',
                backgroundColor: Color(0xFFFE7762),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FocusSelectionScreen()),
                        );
                },
                hasBorder: false,
              ),

              Spacer(), // Push everything upwards
            ],
          ),
        ),
      ),
    );
  }
}
