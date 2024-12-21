import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;
  final TextDecoration decoration;
  final Color decorationColor; // Added decorationColor
  final double height;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const AppText({
    required this.text,
    this.color = Colors.black,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = 'DM Sans',
    this.decoration = TextDecoration.none,
    this.decorationColor = Colors.black, // Default to black
    this.height = 1.2,
    this.textAlign,
    this.overflow,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        decoration: decoration,
        decorationColor: decorationColor, // Apply decorationColor
        height: height,
        letterSpacing: 0.24,
      ),
    );
  }
}
