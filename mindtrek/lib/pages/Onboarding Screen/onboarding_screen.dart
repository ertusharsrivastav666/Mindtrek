import 'package:flutter/material.dart';
import 'package:mindtrek/pages/Login%20Screen/2.1a_login_screen.dart';
import 'package:mindtrek/Components/page_indicator.dart';
import 'package:mindtrek/pages/Signup%20Screen/3.1a_signup_screen.dart';
import 'package:mindtrek/Components/round_button.dart';
import 'package:mindtrek/Components/social_button.dart';
import 'package:mindtrek/Components/app_text.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  Widget buildSlide(String text, String imagePath) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Text container with fixed height
        SizedBox(
          width: 390,
          height: 93, // Fixed height for the text container
          child: AppText(
            text: text,
            textAlign: TextAlign.center,
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 24), // Spacing between text and image
        // Image container wrapped in Flexible for dynamic layout
        Flexible(
          child: Container(
            width: 342,
            height: 313, // Fixed height maintained
            decoration: ShapeDecoration(
              color: const Color(0xFFEAF2FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FDF5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 64),
            PageIndicator(
              controller: _controller,
              count: 3,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: PageView(
                controller: _controller,
                children: [
                  buildSlide(
                    'Explore nearby trails that fit your wellness goals.',
                    'assets/images/sample_image.png',
                  ),
                  buildSlide(
                    'Wander freely on daily walks that nurture your well-being, anytime, anywhere.',
                    'assets/images/sample_image.png',
                  ),
                  buildSlide(
                    'Track progress with goals that adapt to you.',
                    'assets/images/sample_image.png',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            RoundButton(
              label: 'Sign up',
              backgroundColor: const Color(0xFFFF6852),
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
            ),
            const SizedBox(height: 31.7),
            RoundButton(
              label: 'Log in',
              backgroundColor: const Color(0xFFF9FDF5),
              textColor: const Color(0xFFFF6852),
              borderColor: const Color(0xFFFF6852),
              hasBorder: true,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            const SizedBox(height: 30),
            AppText(
              text: 'Or continue with',
              textAlign: TextAlign.center,
              color: const Color(0xFF71727A),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 0.10,
            ),
            const SizedBox(height: 16),
            SocialButtonsRow(
              onGooglePressed: () {
                // Handle Google sign-in
              },
              onApplePressed: () {
                // Handle Apple sign-in
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 342,
              height: 18,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'User Terms',
                      style: const TextStyle(
                        color: Color(0xFF8F9098),
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF8F9098),
                        height: 0,
                      ),
                    ),
                    const TextSpan(
                      text: '              ',
                      style: TextStyle(
                        color: Color(0xFF8F9098),
                        fontSize: 14,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy',
                      style: const TextStyle(
                        color: Color(0xFF8F9098),
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF8F9098),
                        height: 0,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
