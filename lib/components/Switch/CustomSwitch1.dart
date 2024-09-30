import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSwitch extends StatefulWidget {
  final List<String> buttonLabels;

  CustomSwitch({required this.buttonLabels});

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ToggleButtons for selection
        Container(
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
                  widget.buttonLabels[0],
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
                  widget.buttonLabels[1],
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
                  isSelected[buttonIndex] = (buttonIndex == index);
                }
              });
            },
            isSelected: isSelected,
          ),
        ),

        SizedBox(height: 20.h), // Space between buttons and content

        // Content display based on selection
        _buildContent(widget.buttonLabels),
      ],
    );
  }

  Widget _buildContent(List<String> buttonLabels) {
    if (isSelected[0]) {
      return Container(

      );
    } else if (isSelected[1]) {
      return Container(
      );
    } else {
      return Container();
    }
  }
}

class CustomSwitchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Toggle Buttons Example')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomSwitch(
              buttonLabels: ['En cours', 'Terminées'],
            ),
            SizedBox(height: 30.h), // Spacing between switches
            CustomSwitch(
              buttonLabels: ['Service', 'Location'],
            ),
          ],
        ),
      ),
    );
  }
}
