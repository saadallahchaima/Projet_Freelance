import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khedma/theme/AppTheme.dart';

import '../../../components/CustomSwitchOffreServices.dart';
import '../../../components/appBar.dart';
import '../../SideMenu.dart';

class OffreservicetScreen extends StatefulWidget {
   @override
  _OffreservicetScreenState createState() => _OffreservicetScreenState();
}

class _OffreservicetScreenState extends State<OffreservicetScreen> {
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
    return  Scaffold(
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
          'Offre de Services',
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

      body: Column(
        children: [
          // Center the switch horizontally
          Expanded(
            child: Center(
              child: CustomSwitchOffreServices(
                buttonLabels: ['Disponible', 'Terminées'],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
