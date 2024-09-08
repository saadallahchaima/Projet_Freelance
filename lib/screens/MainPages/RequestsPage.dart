import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/CustomSwitch1.dart';
import '../../components/ServiceCard.dart';
import '../../components/appBar.dart';
import '../../components/navbara.dart';
import '../../theme/AppTheme.dart';
import '../SideMenu.dart';


class MyRequestsPage extends StatefulWidget {
   @override
  _MyRequestsPageState createState() => _MyRequestsPageState();
}

class _MyRequestsPageState extends State<MyRequestsPage> {
  bool _isSettingsDrawer = false;

  void _toggleDrawer(BuildContext context) {
    setState(() {
      _isSettingsDrawer = !_isSettingsDrawer;
    });
    Navigator.of(context).pop(); // Close the current drawer
    Scaffold.of(context).openEndDrawer(); // Open the new drawer
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFF0099D6),
 endDrawer: _isSettingsDrawer
          ? Builder(
              builder: (context) =>
                  SettingsDrawer(toggleDrawer: () => _toggleDrawer(context)),
            )
          : Builder(
              builder: (context) =>
                  MyDrawer(toggleDrawer: () => _toggleDrawer(context)),
            ),

      appBar:  CustomAppBar(
        notificationIcon: Icon(Icons.location_on_outlined, color: Colors.white),
        title: 'demandes',
        showSearchBar: false,
        backgroundColor: Color(0xFF0099D6),
      ),// Use
      body: LayoutBuilder(

        builder: (context, constraints) {
          bool isPortrait = constraints.maxHeight > constraints.maxWidth;
          return SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(context, isPortrait),
                _buildOffersTitle(),
                ListView.builder(
                  itemCount: 3, // Adjust based on your data
                  shrinkWrap: true, // Ensure it doesn't overflow
                  physics: const NeverScrollableScrollPhysics(), // Disable scrolling in nested ListView
                  itemBuilder: (context, index) {
                    return Group(); // Replace with actual dynamic data if needed
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }



  Widget _buildHeader(BuildContext context, bool isPortrait) {
    return Container(
      width: double.infinity,
      height: isPortrait ? 431.h : 250.h,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.h)),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: CustomSwitch(buttonLabels: ["en cours","Terminés"],),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(20.h),
                  child: const ServiceCard(
                    title: 'Mon titre',
                    date: 'Aujourd\'hui',
                    offers: 2,
                    profileImages: [
                      'https://via.placeholder.com/150',
                      'https://via.placeholder.com/150'
                    ],
                  ),
                ),
              ),
            ),
          ),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton('Détails', AppTheme.primaryColor, Colors.white),
          _buildButton('Modifier', Colors.white, AppTheme.primaryColor, hasIcon: true),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Color bgColor, Color textColor, {bool hasIcon = false}) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(bgColor),
        side: WidgetStateProperty.all<BorderSide>(const BorderSide(color: Colors.white, width: 1)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
      onPressed: () {},
      child: Container(
        width: 90.75.w,
        height: 20.87.h,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (hasIcon)
              Image.asset("assets/images/edit.png", width: 16.sp, height: 16.sp),
            if (hasIcon) SizedBox(width: 8.w),
            Text(
              text,
              style: TextStyle(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildOffersTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Offres (4)',
          style: TextStyle(
            color: const Color(0xFF141414),
            fontSize: 14.44.sp,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}


class Group extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),

      ),
      elevation: 4,
      color: Colors.white, // Set the background color here

      child: Container(
        width: 308.w,
        height: 100.60.h,
        child: Stack(
          children: [
            Positioned(
              left: 17.61.w,
              top: 58.19.h,
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/award.png",
                    height: 16.1.h,
                    width: 9.6.w,
                  ),
                  SizedBox(width: 8.w), // Spacing between the icon and text
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '2 à 4 ',
                          style: TextStyle(
                            color: const Color(0xFF0C3469),
                            fontSize: 11.20.sp,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'ans d\'expérience',
                          style: TextStyle(
                            color: const Color(0xFF0C3469),
                            fontSize: 11.20.sp,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 150.w,
              top: 4.59.h,
              child: Container(
                width: 62.w,
                height: 16.h,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF7AA1E),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Top prestataire',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8.sp,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 8,
              top: 0,
              child: Container(
                width: 40.02.w,
                height: 40.02.w,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/40x40"),
                    fit: BoxFit.cover,
                  ),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 80.02.w,
              top: 5.60.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Prestataire',
                    style: TextStyle(
                      color: const Color(0xFF0C3469),
                      fontSize: 11.20.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      const Icon(Icons.star_rate_sharp, color: Colors.orange, size: 13),
                      Text(
                        '4,95',
                        style: TextStyle(
                          color: const Color(0xFF0C3469),
                          fontSize: 9.60.sp,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '(65 avis)',
                        style: TextStyle(
                          color: const Color(0xFF707070),
                          fontSize: 9.60.sp,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 245.w,
              top: 5.59.h,
              child: Column(
                children: [
                  _buildActionButton('Choisir', const Color(0xFF0AA655)),
                  SizedBox(height: 8.h),
                  _buildActionButton('Voir Profile', const Color(0xFF0099D6)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildActionButton(String text, Color color) {
    return Container(
      width: 105.w,
      height: 26.h,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.38),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.56.sp,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
