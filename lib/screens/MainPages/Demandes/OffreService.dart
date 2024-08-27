import 'package:flutter/material.dart';
import 'package:khedma/theme/AppTheme.dart';

import '../../../components/CustomSwitchOffreServices.dart';
import '../../../components/appBar.dart';
import '../../SideMenu.dart';

class OffreservicetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:AppTheme.primaryColor, // Set the background color to yellow
      endDrawer: MyDrawer(),  // L'appel du Drawer personnalisé

      appBar: CustomAppBar(
        notificationIcon: Icon(Icons.notifications, color: Colors.white),
        title: 'Offre de Services',
        showSearchBar: false,
        backgroundColor: AppTheme.primaryColor,
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
