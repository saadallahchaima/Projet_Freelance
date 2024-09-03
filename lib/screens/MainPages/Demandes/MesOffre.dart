import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khedma/theme/AppTheme.dart';
import '../../../components/CustomSwitchOffre.dart';
import '../../../components/appBar.dart';
import '../../../components/navbara.dart';
import '../../SideMenu.dart';

class OffreScreen extends StatefulWidget {
   @override
  _OffreScreenState createState() => _OffreScreenState();
}

class _OffreScreenState extends State<OffreScreen> {
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
     
      backgroundColor:AppTheme.primaryColor, // Set the background color to yellow
  endDrawer: _isSettingsDrawer
          ? Builder(
              builder: (context) =>
                  SettingsDrawer(toggleDrawer: () => _toggleDrawer(context)),
            )
          : Builder(
              builder: (context) =>
                  MyDrawer(toggleDrawer: () => _toggleDrawer(context)),
            ),
            appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  title: Stack(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Icon(Icons.notifications, color: Colors.white),
      ),
      Center(
        child: Text(
          ' Mes Offres ',
          style: GoogleFonts.getFont(
            'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    ],
  ),
  elevation: 0,
      // appBar: AppBar(
      //   backgroundColor: Color(0xFFF7AA1E),
      //   iconTheme: IconThemeData(
      //     color: Colors.white, 
      //   ),
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.center, 
      //     children: [
      //       Icon(Icons.notifications, color: Colors.white),
      //       SizedBox(width: 8),
      //       Text(
      //         ' Mes Offres ',
      //         style: GoogleFonts.getFont(
      //           'Roboto',
      //           fontWeight: FontWeight.bold,
      //           fontSize: 20,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ],
      //   ),
      //   elevation: 0,
        // Move the drawer icon to the right
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
        automaticallyImplyLeading: false, // Remove the default leading icon
      ),
      // appBar: CustomAppBar(
      //   notificationIcon: Icon(Icons.notifications, color: Colors.white),
      //   title: ' Mes Offres ',
      //   showSearchBar: false,
      //   backgroundColor: AppTheme.primaryColor, 
        
      // ),

      body: Column(
        children: [
          // Center the switch horizontally
          Expanded(
            child: Center(
              child: CustomSwitchOffre(
                buttonLabels: ['En cours', 'Terminées'],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),

    );
  }
}
