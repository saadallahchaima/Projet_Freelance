import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/CustomSwitchLocation.dart';
import '../../../components/appBar.dart';
import '../../../components/navbara.dart';
import '../../SideMenu.dart';

class DemandelocationtScreen extends StatefulWidget {
  @override
  _DemandelocationtScreenState createState() => _DemandelocationtScreenState();
}

class _DemandelocationtScreenState extends State<DemandelocationtScreen> {
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
     
      backgroundColor: Color(0xFFF7AA1E), // Set the background color to yellow
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
  backgroundColor: Color(0xFFF7AA1E),
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
          'Demande Location',
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
      // appBar: CustomAppBar(
      //   notificationIcon: Icon(Icons.notifications, color: Colors.white),
      //   title: 'Demande Location',
      //   showSearchBar: false,
      //   backgroundColor: Color(0xFFF7AA1E),
      //   // Pass the scaffold key if needed for further use
      //    actions: [
      //     Builder(
      //       builder: (context) => IconButton(
      //         icon: Icon(Icons.menu),
      //         onPressed: () {
      //           Scaffold.of(context).openEndDrawer();
      //         },
      //       ),
      //     ),
        
      //    ],
      // ),

      body: Column(
        children: [
          CustomSwitchLocation(
            buttonLabels: ['Disponible', 'Historique'],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),

      // Add a button to trigger the drawer for testing purposes
    
    );
  }
}
