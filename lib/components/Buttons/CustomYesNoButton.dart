import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedma/theme/AppTheme.dart';

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

    // Détermine les couleurs en fonction de l'état sélectionné
    if (isSelected) {
      backgroundColor = AppTheme.primaryColor; // Bleu pour le bouton sélectionné
      borderColor = AppTheme.primaryColor;
      textColor = Colors.white;
    } else {
      backgroundColor = Color(0xFFDDE0E1); // Gris pour le bouton non sélectionné
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
          foregroundColor: textColor, backgroundColor: backgroundColor, // Utilise onPrimary pour la couleur du texte
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
