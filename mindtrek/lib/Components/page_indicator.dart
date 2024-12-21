// page_indicator.dart
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatelessWidget {
  final PageController controller;
  final int count;

  const PageIndicator({
    Key? key,
    required this.controller,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect:  WormEffect(
        dotHeight: 8,
        dotWidth: 8,
        activeDotColor: Color(0xFFFF6852),
        dotColor: Color(0xFF1F2024).withOpacity(0.10),
      ),
    );
  }
}
