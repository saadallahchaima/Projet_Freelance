import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/AppTheme.dart';

final Map<String, TextEditingController> _dateControllers = {
  'Day': TextEditingController(text: '23'),
  'Month': TextEditingController(text: '11'),
  'Year': TextEditingController(text: '2000'),
};

Widget buildDateField(String label, String initialValue) {
  final TextEditingController controller = _dateControllers[label]!;

  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        color: AppTheme.grisTextField, // Couleur de fond
        borderRadius: BorderRadius.circular(10.r),
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
        decoration: InputDecoration(
          labelText: label,
          hintStyle: TextStyle(color: AppTheme.secondaryColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide:
            BorderSide(color: Colors.blue, width: 1.0), // Bordure bleue
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide:
            BorderSide(color: Colors.blue, width: 1.0), // Bordure bleue
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0), // Bordure bleue plus épaisse quand actif
          ),
        ),
      ),
    ),
  );
}