import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/AppTheme.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
        double iconSize = isLandscape ? 36.sp : 28.sp;

        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/Home.png", height: iconSize, width: iconSize),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/journal.png", height: iconSize * 0.9, width: iconSize * 0.9),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: iconSize * 1.5,
                width: iconSize * 1.5,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor, // Adjust the color as per your theme
                  borderRadius: BorderRadius.circular(iconSize * 0.75),
                ),
                child: Center(
                  child: Image.asset("assets/icons/plus.png", height: iconSize * 0.8, width: iconSize * 0.8),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/chat.png", height: iconSize, width: iconSize),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icons/profile.png", height: iconSize * 0.8, width: iconSize * 0.8),
              label: '',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppTheme.primaryColor,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        );
      },
    );
  }
}
