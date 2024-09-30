import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences

import '../theme/AppTheme.dart';

Widget buildDateField(String label, String initialValue, String prefKey) {
  final TextEditingController controller = TextEditingController(text: initialValue);

  // Function to save the value to SharedPreferences
  void _saveToPreferences(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(prefKey, value);
  }

  // Listen for changes in the text field and save the value
  controller.addListener(() {
    _saveToPreferences(controller.text);
  });

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
            borderSide: BorderSide(color: Colors.blue, width: 1.0), // Bordure bleue
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.blue, width: 1.0), // Bordure bleue
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: Colors.blue, width: 2.0), // Bordure bleue plus épaisse quand actif
          ),
        ),
      ),
    ),
  );
}
