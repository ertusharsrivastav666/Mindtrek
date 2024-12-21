import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mindtrek/pages/Signup%20Screen/3.3a_updatenew_password.dart';
import 'package:mindtrek/Components/stepped_progress_bar.dart';
import 'package:mindtrek/Components/app_text.dart'; // Import AppText widget
import 'package:mindtrek/Components/round_button.dart'; // Import your RoundButton component

class SignUpConfirmScreen extends StatefulWidget {
  @override
  _SignUpConfirmScreenState createState() => _SignUpConfirmScreenState();
}

class _SignUpConfirmScreenState extends State<SignUpConfirmScreen> {
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  bool isCodeComplete = false;
  int _resendCountdown = 60;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
    _setupCodeListeners();
  }

  // Setup listener for all input fields
  void _setupCodeListeners() {
    for (var controller in _controllers) {
      controller.addListener(_validateCode);
    }
  }

  // Check if all inputs are filled
  void _validateCode() {
    setState(() {
      isCodeComplete = _controllers.every((c) => c.text.isNotEmpty);
    });
  }

  // Resend code timer logic
  void _startResendTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_resendCountdown > 0) {
        setState(() => _resendCountdown--);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

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
              // Add 16px space at the top of the screen
              SizedBox(height: 16),

              // Step Progress Bar
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: StepProgressBar(
                  totalSteps: 3,
                  currentStep: 1, // Current step to display
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
              SizedBox(height: 36),

              // Heading
              AppText(
                text: 'Confirm your email',
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: 'DM Sans',
              ),
              SizedBox(height: 16),
              AppText(
                text: 'Enter the 6-digit code we just sent to your email to continue.',
                color: Color(0xFF71727A),
                fontSize: 14,
              ),
              SizedBox(height: 40),

              // 6-Digit Code Input
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) => _codeInputField(index)),
              ),
              SizedBox(height: 16),

              // Resend Code
              GestureDetector(
                onTap: _resendCountdown == 0
                    ? () {
                        setState(() {
                          _resendCountdown = 60;
                          _startResendTimer();
                        });
                      }
                    : null,
                child: AppText(
                  text: _resendCountdown > 0
                      ? 'Resend code in $_resendCountdown seconds'
                      : 'Resend Code',
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF1F2024),
                  color: _resendCountdown > 0
                      ? Color(0xFF71727A)
                      : Color(0xFF1F2024),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 40),

              // Verify Button using RoundButton
              RoundButton(
                label: 'Verify',
                backgroundColor:
                    isCodeComplete ? Color(0xFFFE7762) : Color(0xFFE8E9F1),
                textColor: isCodeComplete ? Color(0xFFF8E9F1) : Color(0xFF8F9098),
                hasBorder: false,
                onPressed: isCodeComplete
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateNewPasswordScreen(),
                          ),
                        );
                      }
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Code Input Field Widget
  Widget _codeInputField(int index) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 241, 239, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: _controllers[index],
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
          _validateCode();
        },
      ),
    );
  }
}
