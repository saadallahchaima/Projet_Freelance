import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedma/theme/AppTheme.dart';

class CustomYesNoButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isYes; // Use this boolean to determine if the button is "Oui" or "Non"

  CustomYesNoButton({
    required this.onPressed,
    required this.isYes,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color borderColor;
    Color textColor;
    String buttonText;

    // Determine colors and text based on button type
    if (isYes) {
      backgroundColor = AppTheme.primaryColor; // Blue for "Oui"
      borderColor = Colors.blueAccent;
      textColor = Colors.white;
      buttonText = 'OUI';

    } else {
      backgroundColor = Color(0xFFDDE0E1); // Gray for "Non"
      borderColor = Color(0xFFDDE0E1);
      textColor = Colors.black;
      buttonText = 'NON';
    }

    return SizedBox(
      width: 80.w, // Fixed width
      height: 39.h, // Fixed height
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Button background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Rounded border
            side: BorderSide(
              color: borderColor, // Border color
              width: 1.0, // Border width
              style: BorderStyle.solid, // Border style
            ),
          ),
          padding: EdgeInsets.zero, // No extra padding
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor, // Text color
              fontSize: 12.sp, // Font size
              fontWeight: FontWeight.bold, // Bold text
            ),
          ),
        ),
      ),
    );
  }
}
