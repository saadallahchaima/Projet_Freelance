import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSwitch extends StatefulWidget {
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9.0),
        boxShadow: [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 24,
            offset: Offset(0, 8),
            spreadRadius: 0,
          )
        ],
      ),
      child: ToggleButtons(
        borderRadius: BorderRadius.circular(9.0),
        borderColor: Colors.transparent,
        selectedBorderColor: Colors.transparent,
        fillColor: Color(0xFF2DC3FF),
        selectedColor: Colors.white,
        color: Colors.grey,
        constraints: BoxConstraints(
          minWidth: 150.0.w,
          minHeight: 44.0.h,
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'En cours',
              style: TextStyle(
                fontSize: 14.19,
                fontWeight: FontWeight.bold,
                color: isSelected[0] ? Colors.white : Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Terminées',
              style: TextStyle(
                fontSize: 14.19,
                fontWeight: FontWeight.bold,
                color: isSelected[1] ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ],
        onPressed: (int index) {
          setState(() {
            for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
              if (buttonIndex == index) {
                isSelected[buttonIndex] = true;
              } else {
                isSelected[buttonIndex] = false;
              }
            }
          });
        },
        isSelected: isSelected,
      ),
    );
  }
}
