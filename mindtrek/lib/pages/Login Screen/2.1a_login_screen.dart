import 'package:flutter/material.dart';
import 'package:mindtrek/Components/input_field.dart';
import 'package:mindtrek/pages/Login%20Screen/2.2a_forgotpass_screen.dart';
import 'package:mindtrek/pages/Signup%20Screen/3.1a_signup_screen.dart';
import 'package:mindtrek/Components/round_button.dart';
import 'package:mindtrek/Components/app_text.dart';
import 'package:mindtrek/Components/social_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isChecked = false;
  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isLoginEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_validateInputs);
    passwordController.addListener(_validateInputs);
  }

  void _validateInputs() {
    setState(() {
      isEmailValid = emailController.text.contains('@') &&
          emailController.text.contains('.');
      isPasswordValid = passwordController.text.length >= 6;
      isLoginEnabled = isEmailValid && isPasswordValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardVisible = keyboardHeight > 0;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF7FDFA),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: isKeyboardVisible ? 56.0 : 16.0,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Image.asset(
                        'assets/images/left_button.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Spacer(),
                    AppText(
                      text: 'Login',
                      color: Color(0xFF1F2024),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 24.0,
                      right: 24.0,
                      bottom: keyboardHeight > 0 ? keyboardHeight : 40.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isKeyboardVisible) ...[
                          SizedBox(height: 42),
                          AppText(
                            text: 'Welcome back[Name]!',
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(height: 16),
                          AppText(
                            text: 'Enter your email and password to login',
                            color: Color(0xFF71727A),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: 64),
                        ],

                        InputField(
                          label: 'Email',
                          placeholder: 'youremail@example.com',
                          controller: emailController,
                          prefixIcon: Image.asset(
                            'assets/images/ic_outline-email.png',
                            width: 16,
                            height: 16,
                          ),
                          validate: (email) =>
                              email.contains('@') && email.contains('.com'),
                        ),
                        SizedBox(height: 24),

                        InputField(
                          label: 'Password',
                          placeholder: 'Enter your password',
                          isPassword: true,
                          controller: passwordController,
                          prefixIcon: Image.asset(
                            'assets/images/mdi_password-outline.png',
                            width: 16,
                            height: 16,
                          ),
                          validate: (password) => password.length >= 8,
                        ),
                        SizedBox(height: 8),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () => setState(() {
                                    isChecked = !isChecked;
                                  }),
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: isChecked
                                          ? Color(0xFFFE7762)
                                          : Colors.transparent,
                                      border: Border.all(
                                        color: Color(0xFFFE9281),
                                        width: 1.5,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
 child: isChecked
                                        ? Icon(Icons.check,
                                            size: 12, color: Colors.white)
                                        : null,
                                  ),
                                ),
                                SizedBox(width: 8),
                                AppText(
                                  text: 'Remember me',
                                  color: Color(0xFFFE7762),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgotPasswordScreen()),
                              ),
                              child: AppText(
                                text: 'Forgot password?',
                                color: Color(0xFFFE7762),
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFFFE7762),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),

                        RoundButton(
                          label: 'Log in',
                          backgroundColor: isLoginEnabled
                              ? Color(0xFFFE7762)
                              : Color(0xFFE8E9F1),
                          textColor: isLoginEnabled
                              ? Colors.white
                              : Color(0xFF8F9098),
                          onPressed: isLoginEnabled ? () {} : null,
                        ),
                        SizedBox(height: 32),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              text: 'Don’t have an account?',
                              color: Color(0xFF71727A),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(width: 4),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()),
                              ),
                              child: AppText(
                                text: 'Sign up',
                                color: Color(0xFFFE7762),
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFFFE7762),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 40),
                        Divider(
                          color: Color(0xFF8F9098),
                          thickness: 0,
                        ),
                        const SizedBox(height: 40),

                        Center(
                          child: AppText(
                            text: 'Or continue with',
                            color: Color(0xFF71727A),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 16),

                        SocialButtonsRow(
                          onGooglePressed: () {},
                          onApplePressed: () {},
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}