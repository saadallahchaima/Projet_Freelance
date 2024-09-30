import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedma/theme/AppTheme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;
  final Color borderColor; // Border color parameter
  final Color textColor; // Text color parameter
  final TextStyle textStyle; // Text style parameter

  CustomButton({
    required this.text,
    required this.color,
    required this.onPressed,
    this.borderColor = AppTheme.PURPLE, // Default border color
    this.textColor = Colors.white, // Default text color
    TextStyle? textStyle, // Optional text style parameter
  }) : textStyle = textStyle ?? TextStyle(
    color: textColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Use backgroundColor for button background
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0), // Rounded corners
          side: BorderSide(
            color: borderColor, // Customizable border color
            width: 2.0, // Border width
            style: BorderStyle.solid, // Border style
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h), // Padding
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            text,
            style: textStyle, // Apply custom text style
          ),
          SizedBox(width: 8.w), // Space between text and icon
          Icon(
            Icons.close,
            color: Colors.white, // Set icon color to match text color
            size: 16.sp,
          ),
        ],
      ),
    );
  }
}
