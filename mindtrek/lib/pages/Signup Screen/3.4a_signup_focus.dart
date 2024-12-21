import 'package:flutter/material.dart';
import 'package:mindtrek/Components/app_text.dart';
import 'package:mindtrek/pages/Signup%20Screen/3.4c_signup_success.dart';
import 'package:mindtrek/Components/round_button.dart';
import 'package:mindtrek/Components/stepped_progress_bar.dart';

class FocusSelectionScreen extends StatefulWidget {
  @override
  _FocusSelectionScreenState createState() => _FocusSelectionScreenState();
}

class _FocusSelectionScreenState extends State<FocusSelectionScreen> {
  final List<Map<String, dynamic>> _focusOptions = [
    {'icon': '🪷', 'label': 'Find calm and release stress', 'isSelected': false},
    {'icon': '👁️', 'label': 'Clear my mind and sharpen focus', 'isSelected': true},
    {'icon': '⚡', 'label': 'Boost my energy and motivation', 'isSelected': false},
    {'icon': '🎈', 'label': 'Lift my mood naturally', 'isSelected': false},
    {'icon': '🪐', 'label': 'Find wonder & new perspectives', 'isSelected': false},
    {'icon': '🪞', 'label': 'Find inner space and reflection', 'isSelected': false},
    {'icon': '🌻', 'label': 'Simply be in nature', 'isSelected': false},
  ];

  void _toggleSelection(int index) {
    setState(() {
      _focusOptions[index]['isSelected'] = !_focusOptions[index]['isSelected'];
    });
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

              // Title
              AppText(
                text: "What’s your focus right\n now?",
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              SizedBox(height: 16),
              AppText(
                text: "Choose the needs that matter most to you right now. You can always update them in your profile.",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF71727A),
                height: 1.5,
              ),
              SizedBox(height: 16),

              // Focus Options List with Custom Checkboxes
              Expanded(
                child: ListView.builder(
                  itemCount: _focusOptions.length,
                  itemBuilder: (context, index) {
                    final option = _focusOptions[index];
                    return GestureDetector(
                      onTap: () => _toggleSelection(index),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          color: option['isSelected']
                              ? Color(0xFFFFE8E6) // Selected background
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: option['isSelected']
                                ? Color(0xFFFE7762) // Selected border
                                : Color(0xFFE8E9F1), // Default border
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          children: [
                            // Text Icon
                            AppText(
                              text: option['icon'],
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: AppText(
                                text: option['label'],
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            // Custom Checkbox
                            Container(
                              width: 16,
                              height: 16,
                              decoration: ShapeDecoration(
                                color: option['isSelected']
                                    ? Color(0xFFFE7762) // Checkbox background when selected
                                    : Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1.5, color: Color(0xFFFE9281)),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: option['isSelected']
                                  ? Icon(Icons.check, color: Colors.white, size: 12)
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 40),

              // "Learn more about wellness needs" aligned to left
              AppText(
                text: 'Learn more about wellness needs',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFFFE7762),
              ),
              SizedBox(height: 8),
              AppText(
                text: "Need help deciding? Learn more about focus area and its benefits.",
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Color(0xFF71727A),
              ),
              SizedBox(height: 40),

              // Continue Button
              RoundButton(
                label: 'Continue',
                backgroundColor: Color(0xFFFE7762),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupSuccessScreen()),
                        );
                  print('Focus selection completed');
                },
                hasBorder: false,
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
