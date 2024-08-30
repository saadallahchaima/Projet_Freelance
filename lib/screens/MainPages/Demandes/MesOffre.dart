import 'package:flutter/material.dart';
import 'package:khedma/theme/AppTheme.dart';
import '../../../components/CustomSwitchOffre.dart';
import '../../../components/appBar.dart';
import '../../../components/navbara.dart';
import '../../SideMenu.dart';

class OffreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:AppTheme.primaryColor, // Set the background color to yellow
      endDrawer: MyDrawer(),  // L'appel du Drawer personnalisé

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
