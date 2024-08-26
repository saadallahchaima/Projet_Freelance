import 'package:flutter/material.dart';

import '../../../components/CustomSwitchLocation.dart';
import '../../../components/appBar.dart';

class DemandelocationtScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF7AA1E), // Set the background color to yellow

      appBar: CustomAppBar(
        notificationIcon: Icon(Icons.notifications, color: Colors.white),
        title: 'Demande Location',
        showSearchBar: false,
        backgroundColor: Color(0xFFF7AA1E),
      ),

      body: Column(
        children: [
          // Center the switch horizontally
          Expanded(
            child: Center(
              child: CustomSwitchLocation(
                buttonLabels: ['Disponible', 'Historique'],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
