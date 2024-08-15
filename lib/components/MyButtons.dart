import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedma/theme/AppTheme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  CustomButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Utiliser backgroundColor au lieu de primary
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0), // Coins arrondis
          side: BorderSide(color: AppTheme.PURPLE, width: 2.0), // Bordure violette
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h), // Padding
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(color: Color(0xFF064BA6), fontSize: 16.sp),
          ),
          SizedBox(width: 8.w), // Espace entre le texte et l'icône
          Icon(
            Icons.close,
            color: Colors.deepPurple,
            size: 16.sp,
          ),
        ],
      ),
    );
  }
}
