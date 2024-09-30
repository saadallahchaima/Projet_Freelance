import 'package:flutter/material.dart';
import '../theme/AppTheme.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final InputBorder? inputBorder;
  final ValueChanged<String>? onChanged;

  CustomInput({
    required this.controller,
    required this.hint,
    this.inputBorder,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
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
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          hintStyle: TextStyle(color: AppTheme.secondaryColor),
          border: inputBorder ??
              UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.grisTextField),
              ),
          enabledBorder: inputBorder ??
              UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.grisTextField),
              ),
          focusedBorder: inputBorder ??
              UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.grisTextField),
              ),
        ),
      ),
    );
  }
}

