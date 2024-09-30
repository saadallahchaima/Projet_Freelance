import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/MainPages/notification.dart';
import '../theme/AppTheme.dart';
import 'Switch/CustomSwitchRechereche.dart';

class CustomAppBard extends StatelessWidget implements PreferredSizeWidget {
  final Widget notificationIcon;
  final String title;
  final bool showSearchBar;
  final Color backgroundColor;

  const CustomAppBard({
    Key? key,
    required this.notificationIcon,
    required this.title,
    this.showSearchBar = false,
    this.backgroundColor = Colors.blue,  // Default color set to blue
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(showSearchBar ? 150.h : 90.h); // Adjust height based on search bar

  @override
  Widget build(BuildContext context) {
    return ClipRRect(

      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor,
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
              child: Padding(
                padding: EdgeInsets.only(left: 16.w), // Increase left padding
                child: Icon(
                  Icons.notifications, // Change to Icon widget if using a default icon
                  size: 30.sp, // Increase icon size
                  color: Colors.white,
                ),
              ),
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
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
               actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu,color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
        bottom: showSearchBar
            ? PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 25.h), // Adjust padding for smaller search bar
            child: Container(
              height: 40.h,
              width: 250.w, // Set a smaller width for the search bar
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
        )
            : null,
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
                        color: AppTheme.secondaryColor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(width: 90.0),
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
