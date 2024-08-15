import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/AppTheme.dart';

class Donneeadresse extends StatelessWidget {
  final List<Map<String, dynamic>> textFieldsData = [
    {'label': 'Prénom', 'hint': 'Entrez votre prénom'},
    {'label': 'Nom', 'hint': 'Entrez votre nom'},
    {'label': 'Email', 'hint': 'Entrez votre adresse email'},
  ];

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
                  SizedBox(height: 50.h), // Ajustez cette valeur pour réduire l'espace

                  Center(
                    child: Container(
                      width: 0.8.sw,
                      child: Text(
                        'Vos données principales',
                        style: TextStyle(
                          fontSize: 0.06.sw,
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
                        'Nous souhaitons mieux vous connaître afin de finaliser votre profil.',
                        style: TextStyle(
                          fontSize: 0.04.sw,
                          color: AppTheme.accentColor,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 70.h),
                  _buildDropdown(),
                  SizedBox(height: 30.h),
                  _buildTextField({
                    'label': 'Ville',
                    'hint': 'Ville',
                  }),
                  SizedBox(height: 30.h),
                  _buildTextField({
                    'label': 'Adresse',
                    'hint': 'Adresse',
                  }),
                  SizedBox(height: 30.h),
                  _buildTextField({
                    'label': 'Code Postal',
                    'hint': 'Code Postal',
                  }),
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
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: AppTheme.grisTextField,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5.0,
            spreadRadius: 1.0,
            offset: Offset(0, 2.0),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: textFieldData['hint'],
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0), // Ajoutez le padding ici
          hintStyle: TextStyle(color: AppTheme.secondaryColor), // Changer la couleur du hint text ici

          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.grisTextField), // Bordure blanche
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.grisTextField), // Bordure blanche quand inactif
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.grisTextField), // Bordure blanche quand actif
          ),

        ),
      ),
    );
  }
  Widget _buildDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: AppTheme.grisTextField,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5.0,
            spreadRadius: 1.0,
            offset: Offset(0, 2.0),
          ),
        ],
        border: Border.all(color: AppTheme.grisTextField), // Bordure blanche
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        underline: SizedBox(),
        value: 'Pays',
        onChanged: (String? newValue) {},
        items: <String>['Pays'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Row(
              children: [
                Image.asset(
                  "assets/images/emojione_flag-for-poland.png",
                  width: 20.88.w,
                  height: 20.88.h,
                ),
                SizedBox(width: 8.w),
                Text(
                  value,
                  style: TextStyle(color: Colors.black), // Couleur du texte dans le menu déroulant
                ),
              ],
            ),
          );
        }).toList(),
        style: TextStyle(color: Colors.black), // Couleur du texte de l'élément sélectionné
      ),
    );
  }




 }