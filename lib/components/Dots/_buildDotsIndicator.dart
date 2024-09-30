import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildDotsIndicator(int step) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16.h),
    child: DotsIndicator(
      dotsCount: 2,
      position: step == 7 ? 0 : 1,
      decorator: DotsDecorator(
        activeColor: Colors.blue,
        color: Colors.grey,
        size: Size.square(9.0),
        activeSize: Size.square(12.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    ),
  );
}