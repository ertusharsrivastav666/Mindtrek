import 'package:flutter/material.dart';
import 'package:mindtrek/Components/round_button.dart';
import 'package:mindtrek/Components/stepped_progress_bar.dart';
import 'package:mindtrek/Components/app_text.dart'; // Import AppText widget

class PasswordUpdatedScreen extends StatelessWidget {
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
                  currentStep: 3, // Final step
                  activeColor: Color(0xFFFE7762),
                  inactiveColor: Color(0xFFE8E9F1),
                  barHeight: 8,
                  barWidth: 110,
                  spacing: 6,
                ),
              ),
              SizedBox(height: 34),

              // Align Password Reset Text with exact spacing
              Row(
                children: [
                  SizedBox(width: 130), // 91px gap
                  AppText(
                    text: 'Password Reset',
                    color: Color(0xFF1F2024),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              SizedBox(height: 42),

              // Success Message (Left-aligned)
              AppText(
                text: 'Password updated\nsuccessfully!',
                color: Color(0xFF1F2024),
                fontSize: 24,
                fontWeight: FontWeight.w700,
               // letterSpacing: 0.24,
              ),
              SizedBox(height: 16),

              AppText(
                text: 'Your password has been updated. You can now log in with your new password.',
                color: Color(0xFF71727A),
                fontSize: 14,
              ),
              SizedBox(height: 48),

              // "Go To Login" Button
              RoundButton(
                label: 'Go To Login',
                backgroundColor: Color(0xFFFE7762),
                textColor: Colors.white,
                onPressed: () {
                  // Navigate back to Login screen
                  Navigator.popUntil(context, (route) => route.isFirst);
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
