
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCard(double size, Color color, String imagePath) {
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
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: size * 0.1),
                child: Image.asset(
                  imagePath,
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
    ],
  );
}

