import 'package:flutter/material.dart';

class StepProgressBar extends StatelessWidget {
  final int totalSteps; // Total number of steps
  final int currentStep; // The current step that is active
  final Color activeColor; // Color for active steps
  final Color inactiveColor; // Color for inactive steps
  final double barHeight; // Height of each step bar
  final double barWidth; // Width of each step bar
  final double spacing; // Space between each step

  // Constructor to allow customization of the StepProgressBar
  const StepProgressBar({
    Key? key,
    required this.totalSteps,
    required this.currentStep,
    this.activeColor = const Color(0xFFFE7762), // Default color for active steps
    this.inactiveColor = const Color(0xFFE8E9F1), // Default color for inactive steps
    this.barHeight = 8.0, // Height of the bars
    this.barWidth = 110.0, // Width of each step bar
    this.spacing = 6.0, // Space between bars
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(totalSteps, (index) {
        return Row(
          children: [
            // Creating a container for each step
            Container(
              width: barWidth,
              height: barHeight,
              decoration: BoxDecoration(
                color: index < currentStep ? activeColor : inactiveColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            // If this is not the last step, add some space between bars
            if (index < totalSteps - 1) SizedBox(width: spacing),
          ],
        );
      }),
    );
  }
}
