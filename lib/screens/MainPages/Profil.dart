import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/navbara.dart';
import '../../theme/AppTheme.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.h),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.h)),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppTheme.primaryColor,
            title: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 40.sp,
                  onPressed: () {
                    // Handle back button press
                  },
                ),
                Spacer(), // Use Spacer to push the title to the center
                Text(
                  'Profile Professionnel',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 1.2, // Line height
                  ),
                ),
                Spacer(), // Use Spacer to balance the row
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  // Handle menu button press
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w), // Responsive padding
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 70.w,
                          height: 70.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage('https://example.com/image.jpg'), // Replace with your image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Graphic Designer',
                              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4.h),
                            Text('Type: Professionnel', style: TextStyle(fontSize: 14.sp)),
                            Text('Joined: Sep 2018', style: TextStyle(fontSize: 14.sp)),
                            Text('Experience: 4 Years', style: TextStyle(fontSize: 14.sp)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Icon(Icons.verified, color: Colors.green, size: 24.sp),
                        SizedBox(width: 8.w),
                        Text(
                          'Identité vérifiée',
                          style: TextStyle(fontSize: 16.sp, color: Colors.blue),
                        ),
                        Spacer(),
                        Icon(Icons.star, color: Colors.yellow, size: 24.sp),
                        SizedBox(width: 4.w),
                        Text(
                          '4.95 (65 avis)',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.blue, size: 24.sp),
                        SizedBox(width: 8.w),
                        Text(
                          '4 Rue de l\'Abbé Groult, 750515 Paris',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Icon(Icons.attach_money, color: Colors.green, size: 24.sp),
                        SizedBox(width: 8.w),
                        Text(
                          '20€ / Heure',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
