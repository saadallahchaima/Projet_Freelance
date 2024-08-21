import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/MyButtons.dart';
import '../../theme/AppTheme.dart';

class FormSociete extends StatefulWidget {
  @override
  State<FormSociete> createState() => _FormSocieteState();
}

class _FormSocieteState extends State<FormSociete> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Center(
                    child: Image.asset(
                      "assets/images/logo_rent_me-removebg-preview 2.png",
                      width: 50.w,
                      height: 50.h,
                    ),
                  ),
                  SizedBox(height: 50.h),

                  Center(
                    child: Container(
                      width: 0.8.sw,
                      child: Text(
                        'Avez vous une société ?',
                        style: TextStyle(
                          fontSize: 0.05.sw,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.secondaryColor,
                          fontFamily: 'Roboto',
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Center(
                    child: Container(
                      width: 0.8.sw,
                      child: Text(
                        'Veuillez citer vos justificatifs pour valider votre statut.',
                        style: TextStyle(
                          fontSize: 0.03.sw,
                          color: AppTheme.accentColor,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  _buildTextField({
                    'label': 'Nom de la Société:',
                    'hint': 'Nom de la Société:',
                  }),
                  SizedBox(height: 10.h),
                  _buildTextField({
                    'label': 'Domaine d’activité:',
                    'hint': 'Domaine d’activité:',
                  }),
          SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          CustomButton(
          text: 'Communication',
          color: Colors.white, // Orange color
          onPressed: () {
          // Action when the button is pressed
          },
          ),
        ],
            ),


          SizedBox(height: 50.h),
                  Text(
                    'Documents',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildCard('K.BIS', 0.27.sw, AppTheme.primaryColor, 'assets/images/img_7.png'),
                      SizedBox(width: 16.h),

                      _buildCard('Label de qualité', 0.27.sw, AppTheme.primaryColor, 'assets/images/img_7.png'),
                      SizedBox(width: 16.h),

                      _buildCard('Assurance ', 0.27.sw, AppTheme.primaryColor, 'assets/images/img_7.png'),

                    ],
                  ),
                  SizedBox(height: 30.h),
                  Center(
                    child: Container(
                      width: 0.8.sw,
                      child: Text(
                        'Veuillez télécharger les documents nécessaires comme K.BIS, Garantie décennale, Label de qualité (RGE).',
                        style: TextStyle(
                          fontSize: 0.03.sw,
                          color: AppTheme.accentColor,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField(Map<String, dynamic> textFieldData) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: AppTheme.grisTextField,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5.0,
            spreadRadius: 1.0,
            offset: const Offset(0, 2.0),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: textFieldData['hint'],
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0), // Ajoutez le padding ici
          hintStyle: const TextStyle(color: AppTheme.secondaryColor), // Changer la couleur du hint text ici

          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.grisTextField), // Bordure blanche
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.grisTextField), // Bordure blanche quand inactif
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.grisTextField), // Bordure blanche quand actif
          ),
        ),
      ),
    );
  }
  Widget _buildCard(String title, double size, Color color, String imagePath) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: size * 0.9,
              height: size * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                    offset: const Offset(0, 10.0),
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: size * 0.1),
                  child: Image.asset(
                    imagePath, // Utilisez le paramètre imagePath ici
                    width: size * 0.4,
                    height: size * 0.4,
                  ),
                ),
              ),
            ),
            Positioned(
              top: size * 0.0,
              right: size * 0.0,
              child: Container(
                width: size * 0.20,
                height: size * 0.20,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: size * 0.18,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          title,
          style: TextStyle(
            fontSize: size * 0.14,
            color: color, 
          ),
        ),
      ],
    );
  }
}
