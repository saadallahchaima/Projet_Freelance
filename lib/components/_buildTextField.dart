import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/AppTheme.dart';

Widget buildTextField({
  required Map<String, dynamic> textFieldData,
  required TextEditingController controller,
  ValueChanged<String>? onChanged,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
    decoration: BoxDecoration(
      color: AppTheme.grisTextField,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 5.0,
          spreadRadius: 1.0,
          offset: Offset(0, 2.0),
        ),
      ],
    ),
    child: TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: textFieldData['hint'],
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        hintStyle: TextStyle(color: AppTheme.secondaryColor),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.grisTextField),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.grisTextField),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.grisTextField),
        ),
      ),
    ),
  );
}
