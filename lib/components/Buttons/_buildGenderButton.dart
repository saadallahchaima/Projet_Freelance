import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildGenderButton(
    String label, IconData iconData, bool isSelected, VoidCallback onTap) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70.h, // Set the height
        width: 70.w, // Set the width
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r), // Set the border radius
          border: Border.all(color: isSelected ? Colors.green : Colors.grey),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(4.w), // Set padding
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(6.r), // Set border radius
                ),
                child: Icon(
                  iconData,
                  size: 24.sp, // Set the size of the icon
                  color: isSelected ? Colors.green : Colors.grey,
                ),
              ),
              SizedBox(width: 8.w), // Set spacing
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp, // Set font size
                  color: isSelected ? Colors.green : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
