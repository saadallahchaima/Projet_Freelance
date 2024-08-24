import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/navbara.dart';
import '../../theme/AppTheme.dart'; // Assurez-vous que ce chemin est correct ou ajustez-le si nécessaire.

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.h),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.h)),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppTheme.primaryColor,
            title: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 60.w),
                Expanded(
                  child: Center(
                    child: Text(
                      'Notifications',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.menu, color: Colors.white),
                onPressed: () {},
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 120.w, vertical: 20.h),
                child: Container(
                  height: 40.h,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Recherche',
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search, color: Colors.blue),
                        onPressed: () {
                          _showSearchCard(context);
                        },
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 5.h),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.w),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.w),
        color: Color(0xFFC8D9FF), // Couleur de fond de l'écran
        child: ListView(
          children: [
            _buildNotificationTile(
              context,
              'Floyd Miles',
              'Mécanicien',
              'Vous avez reçu une nouvelle offre de prix.',
              '10:55',
              'https://www.perfocal.com/blog/content/images/2021/01/Perfocal_24-11-20_J7KEDLQ6_3.jpeg_standard-copy.jpg', // Remplacez par l'URL de l'image réelle
            ),
            _buildNotificationTile(
              context,
              'Savannah Nguyen',
              'Cliente',
              'Savannah a accepté votre offre de prix.',
              '8:01',
              'https://www.elitesingles.com/wp-content/uploads/sites/85/2020/06/elite_singles_slide_6-350x264.png', // Remplacez par l'URL de l'image réelle
            ),
            _buildNotificationTile(
              context,
              'Annette Black',
              'Developer',
              'Annette a répondu à votre demande.',
              '5 Mar',
              'https://www.elitesingles.com.au/wp-content/uploads/sites/77/2020/06/profileprotectionsnap-350x264.jpg', // Remplacez par l'URL de l'image réelle
            ),
            _buildNotificationTile(
              context,
              'Annette Black',
              'Cliente',
              'Annette a refusé votre offre de prix.',
              '5 Mar',
              "https://www.perfocal.com/blog/content/images/size/w1920/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg"
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

void _showSearchCard(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.75,
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recherche Avancée',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryColor,
                ),
              ),
              SizedBox(height: 20.h),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Type de Service',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0.w),
                  ),
                  prefixIcon: Icon(Icons.work_history_outlined, color: Colors.blue),
                ),
                items: ['Demande', 'Location'].map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Gestion du changement de type
                },
              ),
              SizedBox(height: 20.h),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Localisation',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0.w),
                  ),
                  prefixIcon: Icon(Icons.location_on, color: Colors.blue),
                ),
              ),
              SizedBox(height: 20.h),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nom de l\'expert',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0.w),
                  ),
                  prefixIcon: Icon(Icons.person, color: Colors.blue),
                ),
              ),
              SizedBox(height: 20.h),
              RechercheBtn(),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      );
    },
  );
}

class RechercheBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 133.w,
      height: 46.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0.w),
          ),
        ),
        onPressed: () {
          // Action du bouton de recherche
        },
        child: Text(
          'Recherche',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13.sp,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
