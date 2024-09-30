import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/appBar/appBar.dart';
import '../../components/navbara.dart';
import '../../theme/AppTheme.dart';
import '../SideMenu.dart'; // Assurez-vous que ce chemin est correct ou ajustez-le si nécessaire.
import 'dart:io'; // Pour manipuler le fichier

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
    return Scaffold(
      backgroundColor: Color(0xFFC8D9FF),
      // Set the background color

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
        title: 'Notifications',
        showSearchBar: true,
        backgroundColor: Color(0xFF0099D6),
      ),
      // Use the new CustomAppBar

      body: Container(
        padding: EdgeInsets.all(16.w),
        color: Color(0xFFC8D9FF), // Light purple color for the container
        child: ListView(
          children: [
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

  Widget _buildNotificationTile(BuildContext context,
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
        onTap: () {
          _showEvaluationBottomSheet(
              context); // Opens the bottom sheet when tapped
        },
      ),
    );
  }


  void _showEvaluationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
          ),
          padding: EdgeInsets.only(left: 40.0.w, top: 20.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 20.w),
                    Center(
                      child: Text(
                        'Évaluation de la demande',
                        style: GoogleFonts.roboto(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),

                // Texte d'explication
                Center(
                  child: Text(
                    'Évaluer la demande de votre client en ajustant le prix.',
                    style: GoogleFonts.roboto(
                      fontSize: 14.sp,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20.0),

                // Contenu de la demande
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Demande :',
                      style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        'Construction Maison',
                        style: GoogleFonts.roboto(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),

                // Localisation
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Localisation :',
                      style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        '4 Rue de l\'Abbé Groult, 75015 Paris',
                        style: GoogleFonts.roboto(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),

                // Budget avec icône et TextField
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Budget :',
                      style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Container(
                        height: 40.h,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Entrez le budget',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(
                      "assets/icons/coins.png",
                      height: 40.0,
                      width: 40.0,
                    ),
                  ],
                ),
                SizedBox(height: 20.0),

                // Devis : Espace sous forme de Card pour le téléchargement du PDF
                Text(
                  'Devis :',
                  style: GoogleFonts.roboto(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      // Action pour sélectionner le fichier
                      FilePickerResult? result = await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf'], // Seuls les fichiers PDF sont autorisés
                      );

                      if (result != null) {
                        File file = File(result.files.single.path!);
                        // Tu peux maintenant utiliser ce fichier, par exemple l'envoyer à un serveur
                        print("Fichier sélectionné : ${file.path}");
                      } else {
                        // L'utilisateur a annulé la sélection
                        print("Sélection de fichier annulée");
                      }
                    },
                    child: Stack(
                      clipBehavior: Clip.none, // Pour permettre à l'icône de déborder
                      children: [
                        Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.picture_as_pdf, size: 50.0, color: Colors.grey),
                              SizedBox(width: 10.0.w),
                              Text(
                                'Télécharger PDF',
                                style: GoogleFonts.roboto(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Petite icône add dans un cercle bleu au coin supérieur droit
                        Positioned(
                          top: -10, // Positionnement légèrement au-dessus de la carte
                          right: -10, // Positionnement légèrement à droite
                          child: Container(
                            padding: EdgeInsets.all(4.0), // Espace autour de l'icône
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: Icon(
                              Icons.add,
                              size: 16.0, // Taille de l'icône
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20.0),

                // Bouton de validation centré
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 50.w),
                    ),
                    child: Text(
                      'Valider',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
