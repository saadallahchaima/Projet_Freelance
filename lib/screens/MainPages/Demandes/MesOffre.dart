import 'package:flutter/material.dart';
import 'package:khedma/theme/AppTheme.dart';
import '../../../components/Switch/CustomSwitchOffre.dart';
import '../../../components/appBar/appBar.dart';
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
    return  Scaffold(
      backgroundColor:AppTheme.primaryColor, // Set the background color to yellow
    //  endDrawer: MyDrawer(),  // L'appel du Drawer personnalisé
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
        title: ' Mes Offres ',
        showSearchBar: false,
        backgroundColor: AppTheme.primaryColor,
      ),
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