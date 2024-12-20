import 'package:flutter/material.dart';
import 'package:mindtrek/Components/input_field.dart';
import 'package:mindtrek/pages/Signup%20Screen/3.2_sign_confirm_screen.dart';
import 'package:mindtrek/Components/round_button.dart';
import 'package:mindtrek/Components/social_button.dart';
import 'package:mindtrek/Components/stepped_progress_bar.dart';
import 'package:mindtrek/Components/app_text.dart'; // Import AppText widget

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool isFirstNameValid = false;
  bool isLastNameValid = false;
  bool isEmailValid = false;
  bool isFormValid = false;

  @override
  void initState() {
    super.initState();
    firstNameController.addListener(_validateForm);
    lastNameController.addListener(_validateForm);
    emailController.addListener(_validateForm);
  }

  // Validate all inputs and enable "Send Code" button
  void _validateForm() {
    setState(() {
      isFirstNameValid = firstNameController.text.isNotEmpty;
      isLastNameValid = lastNameController.text.isNotEmpty;
      isEmailValid = emailController.text.isNotEmpty &&
          emailController.text.contains('@') &&
          emailController.text.contains('.');
      isFormValid = isFirstNameValid && isLastNameValid && isEmailValid;
    });
  }

  // Method to dismiss the keyboard when tapping outside the text field
  void _dismissKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _dismissKeyboard, // Dismiss keyboard when tapping outside text field
      child: Scaffold(
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
                  currentStep: 1,
                  activeColor: Color(0xFFFE7762),
                  inactiveColor: Color(0xFFE8E9F1),
                  barHeight: 8,
                  barWidth: 110,
                  spacing: 6,
                ),
                SizedBox(height: 36),

                // Back button and "Sign Up" header
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
                      fontFamily: 'DM Sans',
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 36),

                // Title and description
                AppText(
                  text: 'What’s your name & email?',
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'DM Sans',
                ),
                SizedBox(height: 16),
                AppText(
                  text: 'We’ll send you an email with a verification code to confirm it’s you.',
                  color: Color(0xFF71727A),
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 32),

                // First Name Input Field
                InputField(
                  label: 'First name',
                  placeholder: 'Enter your first name',
                  controller: firstNameController,
                  validate: (value) => value.isNotEmpty,
                ),
                SizedBox(height: 24),

                // Last Name Input Field
                InputField(
                  label: 'Last name',
                  placeholder: 'Enter your last name',
                  controller: lastNameController,
                  validate: (value) => value.isNotEmpty,
                ),
                SizedBox(height: 24),

                // Email Input Field
                InputField(
                  label: 'Email',
                  placeholder: 'youremail@example.com',
                  controller: emailController,
                  prefixIcon: Image.asset(
                    'assets/images/ic_outline-email.png',
                    width: 16,
                    height: 16,
                  ),
                  validate: (value) =>
                      value.isNotEmpty && value.contains('@') && value.contains('.com'),
                ),
                SizedBox(height: 32),

                // Send Code Button
                RoundButton(
                  label: 'Send Code',
                  backgroundColor: isFormValid
                      ? Color(0xFFFE7762)
                      : Color(0xFFE8E9F1), // Enabled or Disabled
                  textColor: isFormValid ? Colors.white : Color(0xFF8F9098),
                  onPressed: isFormValid
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpConfirmScreen()),
                          );
                          // Handle Send Code
                          print('Navigate to next screen');
                        }
                      : null,
                  hasBorder: false,
                ),
                SizedBox(height: 32),

                // Already have account? Login link
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: 'Already have an account?',
                        color: Color(0xFF71727A),
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Navigate to login
                        },
                        child: AppText(
                          text: 'Login',
                          color: Color(0xFFFE7762),
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFFE7762),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),

                // Divider
                Divider(
                  color: Color(0xFF8F9098),
                  thickness: 1,
                ),
                SizedBox(height: 24),

                // "Or continue with" text
                Center(
                  child: AppText(
                    text: 'Or continue with',
                    color: Color(0xFF71727A),
                    fontSize: 14,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height:16),

                // Social Buttons Row
                SocialButtonsRow(
                  onGooglePressed: () {
                    print('Google Sign-In');
                  },
                  onApplePressed: () {
                    print('Apple Sign-In');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
