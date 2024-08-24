import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/MainPages/notification.dart';
import '../theme/AppTheme.dart';
import 'CustomSwitchRechereche.dart'; // Assuming this is your custom widget

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget notificationIcon;
  final String title;

  const CustomAppBar({
    Key? key,
    required this.notificationIcon,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(150.h);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.h)),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
              child: notificationIcon,
            ),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    fontSize: 18.sp,
                  ),
                  overflow: TextOverflow.ellipsis, // This will ensure long titles get truncated
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 20.h), // Adjusted padding for responsiveness
            child: Container(
              height: 40.h,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Recherche',
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search, color: Colors.blue),
                    onPressed: () {
                      _showSearchCard(context);
                    },
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 5.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showSearchCard(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            padding: EdgeInsets.all(40.0),
            child: ListView(
              children: [
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        color: AppTheme.secondaryColor, // Change the color to match your theme
                        onPressed: () {
                          Navigator.pop(context); // Close the Bottom Sheet
                        },
                      ),
                    ),
                    SizedBox(width: 90.0), // Add spacing between the IconButton and the Text if needed
                    Text(
                      'Recherche',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.secondaryColor,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),
                Text(
                  'Type de recherche',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.secondaryColor,
                  ),
                ),
                SizedBox(height: 20.h),
                CustomSwitchRecherche(
                  buttonLabels: ['Profile', 'Location'],
                ),
                SizedBox(height: 20.h),
                RechercheBtn(), // Assuming this is your custom search button widget
                SizedBox(height: 16.h),
              ],
            ),
          ),
        );
      },
    );
  }
}