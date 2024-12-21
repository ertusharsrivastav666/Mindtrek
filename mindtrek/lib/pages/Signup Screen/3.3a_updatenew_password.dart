import 'package:flutter/material.dart';
import 'package:mindtrek/Components/input_field.dart';
import 'package:mindtrek/pages/Signup%20Screen/3.3b_password_create.dart';
import 'package:mindtrek/Components/round_button.dart';
import 'package:mindtrek/Components/stepped_progress_bar.dart';
import 'package:mindtrek/Components/app_text.dart';

// Main Entry Point
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: UpdateNewPasswordScreen(),
  ));
}

// Screen 1: Create New Password
class UpdateNewPasswordScreen extends StatefulWidget {
  @override
  _UpdateNewPasswordScreenState createState() =>
      _UpdateNewPasswordScreenState();
}

class _UpdateNewPasswordScreenState extends State<UpdateNewPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordValid = false;
  bool isConfirmPasswordValid = false;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(_validatePassword);
    confirmPasswordController.addListener(_validateConfirmPassword);
  }

  // Method to validate password
  void _validatePassword() {
    setState(() {
      isPasswordValid = passwordController.text.isNotEmpty &&
          passwordController.text.length >= 8;
    });
  }

  // Method to validate confirm password
  void _validateConfirmPassword() {
    setState(() {
      isConfirmPasswordValid = confirmPasswordController.text.isNotEmpty &&
          confirmPasswordController.text == passwordController.text;
    });
  }

  // Method to dismiss the keyboard when tapping outside the text field
  void _dismissKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    // Get the available height excluding the keyboard height
    final double availableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: _dismissKeyboard, // Dismiss keyboard when tapping outside
      child: Scaffold(
        backgroundColor: Color(0xFFF7FDFA),
        resizeToAvoidBottomInset: true, // Ensure layout adjusts for keyboard
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16), // Add 16px space at the top of the screen

                  // Step Progress Bar
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: StepProgressBar(
                      totalSteps: 3,
                      currentStep: 2, // Current step to display
                      activeColor: Color(0xFFFE7762),
                      inactiveColor: Color(0xFFE8E9F1),
                      barHeight: 8,
                      barWidth: 110,
                      spacing: 6,
                    ),
                  ),
                  SizedBox(height: 35),

                  // Back Button and Title
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

                  // Heading
                  AppText(
                    text: 'Create new password',
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 8),
                  AppText(
                    text:
                        'Your password should be at least 8 characters long, and contain alphabets, symbols & numbers.',
                    color: Color(0xFF71727A),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 48),

                  // Password Input Fields
                  InputField(
                    label: 'New Password',
                    placeholder: 'Enter a strong password',
                    controller: passwordController,
                    isPassword: true, // Enable eye toggle
                    prefixIcon: Image.asset(
                      'assets/images/mdi_password-outline.png',
                      width: 16,
                      height: 16,
                    ),
                    validate: (password) {
                      return password.isNotEmpty && password.length >= 6;
                    },
                  ),
                  SizedBox(height: 8),
                 // _buildPasswordStrengthIndicator(),
                  SizedBox(height: 40),
                  InputField(
                    label: 'Confirm Password',
                    placeholder: 'Re-enter new password',
                    controller: confirmPasswordController,
                    isPassword: true, // Enable eye toggle
                    prefixIcon: Image.asset(
                      'assets/images/mdi_password-outline.png',
                      width: 16,
                      height: 16,
                    ),
                    validate: (password) {
                      return password.isNotEmpty &&
                          password == passwordController.text;
                    },
                  ),

                  SizedBox(height: 40),

                  // Update Password Button
                  RoundButton(
                    label: 'Create Password',
                    backgroundColor: isPasswordValid && isConfirmPasswordValid
                        ? Color(0xFFFE7762)
                        : Color(0xFFE8E9F1),
                    textColor: isPasswordValid && isConfirmPasswordValid
                        ? Colors.white
                        : Color(0xFF8F9098),
                    onPressed: isPasswordValid && isConfirmPasswordValid
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PasswordCreateScreen(),
                              ),
                            );
                          }
                        : null,
                    hasBorder: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Password Strength Indicator
  // Widget _buildPasswordStrengthIndicator() {
  //   return Row(
  //     children: [
  //       AppText(
  //         text: 'Password Strength',
  //         color: Color(0xFF8F9098),
  //         fontSize: 10,
  //         fontWeight: FontWeight.w400,
  //       ),
  //       SizedBox(width: 8),
  //       Expanded(
  //         child: LinearProgressIndicator(
  //           value: 0.25,
  //           backgroundColor: Color(0xFFE8E9F1),
  //           valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
  //         ),
  //       ),
  //       SizedBox(width: 8),
  //       AppText(
  //         text: 'Weak',
  //         color: Color(0xFFFE7762),
  //         fontSize: 10,
  //         fontWeight: FontWeight.w400,
  //       ),
  //     ],
  //   );
  // }
}
