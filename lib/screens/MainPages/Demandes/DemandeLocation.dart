import 'package:flutter/material.dart';
import '../../../components/CustomSwitchLocation.dart';
import '../../../components/appBar.dart';
import '../../../components/navbara.dart';
import '../../SideMenu.dart';

class DemandelocationtScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MyDrawer(),

      backgroundColor: Color(0xFFF7AA1E), // Set the background color to yellow

      appBar: CustomAppBar(
        notificationIcon: Icon(Icons.notifications, color: Colors.white),
        title: 'Demande Location',
        showSearchBar: false,
        backgroundColor: Color(0xFFF7AA1E),
      ),

      body: Column(
        children: [
          // Consider using a Container or SizedBox if the height is known
          // Alternatively, make sure `CustomSwitchLocation` handles its own sizing appropriately
          CustomSwitchLocation(
            buttonLabels: ['Disponible', 'Historique'],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
