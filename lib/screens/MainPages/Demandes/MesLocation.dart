import 'package:flutter/material.dart';
import '../../../components/CustomSwitchOffreLocation.dart';
import '../../../components/appBar.dart';
import '../../../components/navbara.dart';
import '../../SideMenu.dart';

class OffreLocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Color(0xFFF7AA1E), // Set the background color to yellow
      endDrawer: MyDrawer(),  // L'appel du Drawer personnalisé

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
