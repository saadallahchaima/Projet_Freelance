import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/MainPages/HomePage.dart';
import '../screens/MainPages/RequestsPage.dart';
import '../theme/AppTheme.dart'; // Make sure this path is correct

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the desired screen based on the index
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(), // Replace with your actual screen
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyRequestsPage(), // Replace with your actual screen
          ),
        );
        break;
      case 2:
      // Handle the middle button (like add action)
        break;
      case 3:
      // Navigate to the chat screen
        break;
      case 4:
      // Navigate to the profile screen
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    double iconSize = isLandscape ? 36.sp : 28.sp;

    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped, // Set the onTap handler
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
  }
}
