import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedma/components/CustomSwitch1.dart';
import 'package:khedma/components/ServiceCard.dart';
import 'package:khedma/components/appBardemande.dart';
import 'package:khedma/components/navbara.dart';
import 'package:khedma/screens/SideMenu.dart';
import 'package:khedma/theme/AppTheme.dart';

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
      backgroundColor: Colors.white, // Set the background color to white
      endDrawer: _isSettingsDrawer
          ? Builder(
        builder: (context) =>
            SettingsDrawer(toggleDrawer: () => _toggleDrawer(context)),
      )
          : Builder(
              builder: (context) =>
                  MyDrawer(toggleDrawer: () => _toggleDrawer(context)),
            ),
      appBar: CustomAppBard(
        notificationIcon: Icon(Icons.location_on_outlined, color: Colors.white),
        title: 'Mes Demandes',
        showSearchBar: false,
        backgroundColor: AppTheme.primaryColor, // AppBar with primary color
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppTheme.primaryColor, // Set the section's background to primaryColor
              height: 30.h, // Adjust the height as needed for this section
            ),
            _buildHeader(context, true), // Original ServiceCard in the header
SizedBox(height: 20.h),
            // Adding another ServiceCard directly here
    Container(
      width: double.infinity,
      height: 391.h ,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor, // Keeping this primaryColor as per your design
        borderRadius: BorderRadius.all( Radius.circular(30.h)),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(2.h),
                  child: const ServiceCard(
                    title: 'Mon titre',
                    date: 'Hier',
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
    ),

            _buildOffersTitle(),


            ListView.builder(
              itemCount: 3, // Adjust based on your data
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Group(); // Replace with actual dynamic data if needed
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
  
  Widget _buildHeader(BuildContext context, bool isPortrait) {
    return Container(
      width: double.infinity,
      height: isPortrait ? 431.h : 250.h,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor, // Keeping this primaryColor as per your design
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.h)),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: CustomSwitch(buttonLabels: ["en cours", "Terminés"]),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(2.h),
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
          _buildButton('Terminer', AppTheme.primaryColor, Colors.white),
          _buildButton('Modifier', Colors.white, AppTheme.primaryColor, hasIcon: true),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Color bgColor, Color textColor, {bool hasIcon = false}) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(bgColor),
        side: MaterialStateProperty.all<BorderSide>(const BorderSide(color: Colors.white, width: 1)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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


class Group extends StatefulWidget {
  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {
  bool _isChosen = false; // Variable pour suivre l'état du bouton

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 4,
      color: Colors.white,
      child: Container(
        width: 308,
        height: 150,
        child: Stack(
          children: [
            // Autres éléments de votre interface...
            Positioned(
              left: 17.61,
              top: 58.19,
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/award.png",
                    height: 16.1,
                    width: 9.6,
                  ),
                  SizedBox(width: 8),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '2 à 4 ',
                          style: TextStyle(
                            color: const Color(0xFF0C3469),
                            fontSize: 11.20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'ans d\'expérience',
                          style: TextStyle(
                            color: const Color(0xFF0C3469),
                            fontSize: 11.20,
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
              left: 150,
              top: 4.59,
              child: Container(
                width: 62,
                height: 16,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF7AA1E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Top prestataire',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
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
                width: 40.02,
                height: 40.02,
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
              left: 80.02,
              top: 5.60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Prestataire',
                    style: TextStyle(
                      color: const Color(0xFF0C3469),
                      fontSize: 11.20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star_rate_sharp,
                          color: Colors.orange, size: 13),
                      Text(
                        '4,95',
                        style: TextStyle(
                          color: const Color(0xFF0C3469),
                          fontSize: 9.60,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '(65 avis)',
                        style: TextStyle(
                          color: const Color(0xFF0C3469),
                          fontSize: 9.60,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 16,
              bottom: 46,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isChosen = !_isChosen; // Change state when pressed
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor:
                          _isChosen ? Colors.red : Colors.green, // Toggle color
                      foregroundColor: Colors.white,
                      minimumSize: Size(105, 36), // Keep same size
                    ),
                    child: Text(_isChosen ? 'Annuler' : 'Choisir'), // Toggle text
                  ),
                  SizedBox(height: 10), // Space between buttons
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      minimumSize: Size(105, 36),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.chat, size: 16),
                        SizedBox(width: 5),
                        Text('Allez au chat'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
