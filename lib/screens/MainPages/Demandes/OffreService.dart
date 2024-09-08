import 'package:flutter/material.dart';
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
   appBar: CustomAppBar(
        notificationIcon: Icon(Icons.notifications, color: Colors.white),
        title: 'Offre de Services',
        showSearchBar: false,
        backgroundColor: AppTheme.primaryColor,
      ),

      body: Column(
        children: [

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
