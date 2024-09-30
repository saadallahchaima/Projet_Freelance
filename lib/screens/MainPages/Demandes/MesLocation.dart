import 'package:flutter/material.dart';
import '../../../components/Switch/CustomSwitchOffreLocation.dart';
import '../../../components/appBar/appBar.dart';
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
    Navigator.of(context).pop(); // Close the current drawer
    Scaffold.of(context).openEndDrawer(); // Open the new drawer
  }
  
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Color(0xFFF7AA1E), // Set the background color to yellow
      //endDrawer: MyDrawer(),  // L'appel du Drawer personnalisé

     endDrawer: _isSettingsDrawer
          ? Builder(
              builder: (context) =>
                  SettingsDrawer(toggleDrawer: () => _toggleDrawer(context)),
            )
          : Builder(
              builder: (context) =>
                  MyDrawer(toggleDrawer: () => _toggleDrawer(context)),
            ),
   appBar: CustomAppBar(
        notificationIcon: Icon(Icons.notifications, color: Colors.white),
        title: ' Mes offres de location ',
        showSearchBar: false,
        backgroundColor: Color(0xFFF7AA1E),
      ),

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