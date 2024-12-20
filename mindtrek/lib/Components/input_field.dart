import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For TextInputFormatter

class InputField extends StatefulWidget {
  final String label;
  final String placeholder;
  final bool isPassword;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final bool Function(String)? validate;
  final FocusNode? focusNode; // Add focusNode as a parameter
  final double borderWidth; // Customizable border width
  final BorderRadiusGeometry borderRadius; // Customizable border radius

  const InputField({
    Key? key,
    required this.label,
    required this.placeholder,
    this.isPassword = false,
    this.controller,
    this.onChanged,
    this.prefixIcon,
    this.validate = _defaultValidation, // Default validation function
    this.focusNode, // Initialize the focusNode parameter
    this.borderWidth = 1.5, // Default border width
    this.borderRadius = const BorderRadius.all(Radius.circular(8)), // Default border radius
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();

  // Default email validation
  static bool _defaultValidation(String value) {
    return value.isNotEmpty && value.contains('@') && value.contains('.');
  }
}

class _InputFieldState extends State<InputField> {
  bool _isPasswordVisible = false;
  bool _isFocused = false;
  bool _isValid = false; // Track if input is valid

  @override
  void initState() {
    super.initState();
    // If a custom focusNode is provided, listen for changes
    if (widget.focusNode != null) {
      widget.focusNode!.addListener(_onFocusChange);
    }
  }

  @override
  void dispose() {
    // Remove the focus listener when disposing
    if (widget.focusNode != null) {
      widget.focusNode!.removeListener(_onFocusChange);
    }
    super.dispose();
  }

  // Callback to handle focus changes
  void _onFocusChange() {
    setState(() {
      _isFocused = widget.focusNode!.hasFocus; // Update the focus state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 72,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label and prefix icon (if any)
          Container(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.prefixIcon != null) widget.prefixIcon!,
                if (widget.prefixIcon != null) SizedBox(width: 8),
                Text(
                  widget.label,
                  style: TextStyle(
                    color: Color(0xFF1F2024),
                    fontSize: 12,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),

          // The TextFormField for the input
          Container(
            width: double.infinity,
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Color(0xFFFFF1EF),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: widget.borderWidth, // Custom border width
                  color: _isFocused
                      ? Color(0xFF6F9381) // Green color when focused
                      : _isValid
                          ? Color(0xFF6F9381) // Green color when valid
                          : Color(0xFFC5C6CC), // Gray color when not focused or valid
                ),
                borderRadius: widget.borderRadius, // Custom border radius
              ),
            ),
            child: TextFormField(
              controller: widget.controller,
              focusNode: widget.focusNode, // Assign the focusNode here
              onChanged: (value) {
                setState(() {
                  _isValid = widget.validate!(value); // Run validation on change
                });
                if (widget.onChanged != null) widget.onChanged!(value);
              },
              obscureText: widget.isPassword && !_isPasswordVisible,
              onTap: () {
                setState(() {
                  _isFocused = true; // Set to true when the field is tapped
                });
              },
              decoration: InputDecoration(
                hintText: widget.placeholder,
                hintStyle: TextStyle(
                  color: Color(0xFF8F9098),
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible; // Toggle visibility
                          });
                        },
                        child: Image.asset(
                          _isPasswordVisible
                              ? 'assets/images/open_eyeicon.png' // Replace with your open eye image
                              : 'assets/images/close_eyeicon.png', // Replace with your closed eye image
                          width: 16, // Set width to 16
                          height: 16, // Set height to 16
                        ),
                      )
                    : _isValid
                        ? Container(
                            width: 16, // Set width to 16
                            height: 16, // Set height to 16
                            child: Icon(
                              Icons.check,
                              color: Colors.green, // Green tick icon
                            ),
                          )
                        : null, // Show tick if valid  
              ),
            ),
          ),
        ],
      ),
    );
  }
}
