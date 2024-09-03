import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/CustomSwitchOffreLocation.dart';
import '../../../components/appBar.dart';
import '../../../components/navbara.dart';
import '../../SideMenu.dart';

class OffreLocationScreen extends StatefulWidget {
   @override
  _OffreLocationScreenState createState() => _OffreLocationScreenState();
}

class _OffreLocationScreenState extends State<OffreLocationScreen> {
  bool _isSettingsDrawer = false;

  void _toggleDrawer(BuildContext context) {
    setState(() {
      _isSettingsDrawer = !_isSettingsDrawer;
    });
    Navigator.of(context).pop(); 
    Scaffold.of(context).openEndDrawer();
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
          ' Mes offres de location ',
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
      //   title: ' Mes offres de location ',
      //   showSearchBar: false,
      //   backgroundColor: Color(0xFFF7AA1E),

      // ),

      body: Column(
        children: [
          // Center the switch horizontally
          Expanded(
            child: Center(
              child: CustomSwitchLocationOffre(
                buttonLabels: ['En cours', 'Historique'],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),

    );
  }
}
