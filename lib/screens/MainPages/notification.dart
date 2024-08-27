import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/appBar.dart';
import '../../components/navbara.dart';
import '../../theme/AppTheme.dart';
import '../SideMenu.dart'; // Assurez-vous que ce chemin est correct ou ajustez-le si nécessaire.

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MyDrawer(),  // L'appel du Drawer personnalisé

      backgroundColor:Color(0xFFC8D9FF), // Set the background color to purple
      appBar: CustomAppBar(
        notificationIcon: Icon(Icons.notifications, color: Colors.white),
    title: 'Notifications',
    showSearchBar: true,
    backgroundColor: Color(0xFF0099D6),
    ),// Use the new CustomAppBar

    body: Container(
        padding: EdgeInsets.all(16.w),
        color: Color(0xFFC8D9FF), // Light purple color for the container
        child: ListView(
          children: [
            _buildNotificationTile(
              context,
              'Floyd Miles',
              'Mécanicien',
              'Vous avez reçu une nouvelle offre de prix.',
              '10:55',
              'https://www.perfocal.com/blog/content/images/2021/01/Perfocal_24-11-20_J7KEDLQ6_3.jpeg_standard-copy.jpg',
            ),
            _buildNotificationTile(
              context,
              'Savannah Nguyen',
              'Cliente',
              'Savannah a accepté votre offre de prix.',
              '8:01',
              'https://www.elitesingles.com/wp-content/uploads/sites/85/2020/06/elite_singles_slide_6-350x264.png',
            ),
            _buildNotificationTile(
              context,
              'Annette Black',
              'Developer',
              'Annette a répondu à votre demande.',
              '5 Mar',
              'https://www.elitesingles.com.au/wp-content/uploads/sites/77/2020/06/profileprotectionsnap-350x264.jpg',
            ),
            _buildNotificationTile(
              context,
              'Annette Black',
              'Cliente',
              'Annette a refusé votre offre de prix.',
              '5 Mar',
              'https://www.perfocal.com/blog/content/images/size/w1920/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg',
            ),
            _buildNotificationTile(
              context,
              'RentMe',
              '',
              'Vous avez reçu un paiement de 98€.',
              '3 Feb',
              null,
              icon: Icons.account_balance_wallet,
            ),
            _buildNotificationTile(
              context,
              'RentMe',
              '',
              'Vous avez transféré un montant de 102€ à Annette Black.',
              '3 Feb',
              null,
              icon: Icons.account_balance_wallet,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildNotificationTile(
      BuildContext context,
      String title,
      String subtitle,
      String message,
      String time,
      String? imageUrl, {
        IconData? icon,
      }) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0.w),
      ),
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: imageUrl != null
            ? CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        )
            : Icon(icon, size: 40.w),
        title: Text(title),
        subtitle: Text('$subtitle\n$message'),
        trailing: Text(time, style: TextStyle(color: Colors.grey)),
        isThreeLine: true,
      ),
    );
  }
}

class RechercheBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w, // Reduced width for a smaller button
      height: 40.h, // Height remains the same
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0.w),
          ),
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w), // Reduced padding
        ),
        onPressed: () {
          // Action du bouton de recherche
        },
        child: Text(
          'Términer',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.sp,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
