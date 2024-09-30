// card_societe.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCardSociete(String title, double size, Color color, String imagePath)
{
  // The implementation of buildCardSociete remains the same
  return Column(
    children: [
      Stack(
        children: [
          Container(
            width: size * 0.9,
            height: size * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0, 10.0),
                ),
              ],
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: size * 0.1),
                child: Image.asset(
                  imagePath, // Use the imagePath parameter here
                  width: size * 0.4,
                  height: size * 0.4,
                ),
              ),
            ),
          ),
          Positioned(
            top: size * 0.0,
            right: size * 0.0,
            child: Container(
              width: size * 0.20,
              height: size * 0.20,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: size * 0.18,
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 8.h),
      Text(
        title,
        style: TextStyle(
          fontSize: size * 0.14,
          color: color,
        ),
      ),
    ],
  );
}
