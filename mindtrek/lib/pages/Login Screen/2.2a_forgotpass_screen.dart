import 'package:flutter/material.dart';
import 'package:mindtrek/Components/input_field.dart';
import 'package:mindtrek/pages/Login%20Screen/2.2b_confirmscreen.dart';
import 'package:mindtrek/Components/round_button.dart';
import 'package:mindtrek/Components/stepped_progress_bar.dart';
import 'package:mindtrek/Components/app_text.dart'; // Import AppText widget

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isEmailValid = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_validateEmail);
  }

  // Method to validate email
  void _validateEmail() {
    setState(() {
      isEmailValid = emailController.text.isNotEmpty &&
          emailController.text.contains('@') &&
          emailController.text.contains('.');
    });
  }

  // Method to dismiss the keyboard when tapping outside the text field
  void _dismissKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _dismissKeyboard, // Dismiss keyboard when tapping outside
      child: Scaffold(
        backgroundColor: Color(0xFFF7FDFA),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0), // Apply 24px padding to left and right
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Add 16px space at the top of the screen
                SizedBox(height: 16), // Space at the top

                // Step Progress Bar at the top
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0), // Padding for top header
                  child: StepProgressBar(
                    totalSteps: 3,
                    currentStep: 1, // Current step to display (this is the first step)
                    activeColor: Color(0xFFFE7762),
                    inactiveColor: Color(0xFFE8E9F1),
                    barHeight: 8,
                    barWidth: 110,
                    spacing: 6,
                  ),
                ),
                SizedBox(height: 34),

                // Back button and title
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        'assets/images/left_button.png', // Back button icon
                        width: 20,
                        height: 20,
                      ),
                    ),
                    SizedBox(width: 96),
                    AppText(
                      text: 'Password Reset',
                      color: Color(0xFF1F2024),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 42),
                AppText(
                  text: 'Forgot your password?',
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 16),
                AppText(
                  text: 'Enter your email address, and we’ll send you a code to reset your password.',
                  color: Color(0xFF71727A),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 48),

                // Email input field
                InputField(
                  label: 'Email',
                  placeholder: 'youremail@example.com',
                  controller: emailController,
                  prefixIcon: SizedBox(
                    width: 16,
                    height: 16,
                    child: Image.asset(
                      'assets/images/ic_outline-email.png', // Email icon
                    ),
                  ),
                  validate: (email) {
                    return email.isNotEmpty && email.contains('@') && email.contains('.com');
                  },
                ),
                SizedBox(height: 40),

                // Send Code button
                RoundButton(
                  label: 'Send Code',
                  backgroundColor: isEmailValid
                      ? Color(0xFFFE7762) // Active color when valid
                      : Color(0xFFE8E9F1), // Disabled color when invalid
                  textColor: isEmailValid ? Colors.white : Color(0xFF8F9098),
                  onPressed: isEmailValid
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ConfirmEmailScreen()),
                          );
                          // Handle sending the reset code
                        }
                      : null, // Disable button when invalid
                  hasBorder: false,
                ),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
