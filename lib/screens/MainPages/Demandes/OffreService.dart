import 'package:flutter/material.dart';
import 'package:khedma/theme/AppTheme.dart';

import '../../../components/CustomSwitchOffreServices.dart';
import '../../../components/appBar.dart';

class OffreservicetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:AppTheme.primaryColor, // Set the background color to yellow

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
