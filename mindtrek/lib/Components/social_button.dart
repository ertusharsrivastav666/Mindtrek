import 'package:flutter/material.dart';

class SocialButtonsRow extends StatelessWidget {
  final VoidCallback onGooglePressed;
  final VoidCallback onApplePressed;

  const SocialButtonsRow({
    Key? key,
    required this.onGooglePressed,
    required this.onApplePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: onGooglePressed,
              icon: Image.asset(
                'assets/images/google_icon.png',
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(width: 12),
            IconButton(
              onPressed: onApplePressed,
              icon: Image.asset(
                'assets/images/apple_icon.png',
                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
