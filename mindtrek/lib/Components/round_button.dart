import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final VoidCallback? onPressed; // `onPressed` can be null if the button is disabled
  final bool hasBorder;

  const RoundButton({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.borderColor = Colors.transparent,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 342,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(37),
            side: hasBorder ? BorderSide(color: borderColor) : BorderSide.none,
          ),
          elevation: 0,
          //shadowColor is now removed
        ),
        onPressed: onPressed, // Button press handler
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ),
    );
  }
}
