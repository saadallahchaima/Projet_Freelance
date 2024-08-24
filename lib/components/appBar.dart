import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/MainPages/notification.dart';
import '../theme/AppTheme.dart';

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
                // Action à effectuer lors du clic sur l'icône de notification
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
                  title,  // Utilisation du titre passé en paramètre
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    fontSize: 18.sp,
                  ),
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
            padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 20.0),
            child: Container(
              height: 40,
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
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
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
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recherche Avancée',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
                SizedBox(height: 20.h),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Type de Service',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.work_history_outlined, color: Colors.blue),
                  ),
                  items: ['Demande', 'Location'].map((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Handle type change
                  },
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Localisation',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.location_on, color: Colors.blue),
                  ),
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nom de l\'expert',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(Icons.person, color: Colors.blue),
                  ),
                ),
                SizedBox(height: 20.h),
                RechercheBtn(),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
