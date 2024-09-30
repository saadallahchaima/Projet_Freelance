import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndependentButtonGroup extends StatefulWidget {
  @override
  _IndependentButtonGroupState createState() => _IndependentButtonGroupState();
}

class _IndependentButtonGroupState extends State<IndependentButtonGroup> {
  // State variables for the first group of buttons
  bool isYesSelected1 = false;
  bool isNoSelected1 = false;

  // State variables for the second group of buttons
  bool isYesSelected2 = false;
  bool isNoSelected2 = false;

  // Toggle function for the first group
  void toggleButtonGroup1(bool isYes) {
    setState(() {
      if (isYes) {
        isYesSelected1 = true;
        isNoSelected1 = false;
      } else {
        isYesSelected1 = false;
        isNoSelected1 = true;
      }
    });
  }

  // Toggle function for the second group
  void toggleButtonGroup2(bool isYes) {
    setState(() {
      if (isYes) {
        isYesSelected2 = true;
        isNoSelected2 = false;
      } else {
        isYesSelected2 = false;
        isNoSelected2 = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // First group of buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomYesNoButton(
              isYes: true,
              isSelected: isYesSelected1,
              onPressed: () => toggleButtonGroup1(true),
            ),
            SizedBox(width: 20.w),
            CustomYesNoButton(
              isYes: false,
              isSelected: isNoSelected1,
              onPressed: () => toggleButtonGroup1(false),
            ),
          ],
        ),
        SizedBox(height: 20.h),

        // Second group of buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomYesNoButton(
              isYes: true,
              isSelected: isYesSelected2,
              onPressed: () => toggleButtonGroup2(true),
            ),
            SizedBox(width: 20.w),
            CustomYesNoButton(
              isYes: false,
              isSelected: isNoSelected2,
              onPressed: () => toggleButtonGroup2(false),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomYesNoButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isYes;
  final bool isSelected;

  CustomYesNoButton({
    required this.onPressed,
    required this.isYes,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color borderColor;
    Color textColor;
    String buttonText;

    // Colors based on the selection state
    if (isSelected) {
      backgroundColor = Colors.blue;
      borderColor = Colors.blueAccent;
      textColor = Colors.white;
    } else {
      backgroundColor = Color(0xFFDDE0E1);
      borderColor = Color(0xFFDDE0E1);
      textColor = Colors.black;
    }

    buttonText = isYes ? 'OUI' : 'NON';

    return SizedBox(
      width: 80.w,
      height: 39.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
              color: borderColor,
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
