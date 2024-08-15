import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/AppTheme.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _selectedGender = 'Male'; // Par défaut, "Male" est sélectionné.
  final List<Map<String, dynamic>> textFieldsData = [
    {'label': 'Prénom', 'hint': 'Nom'},
    {'label': 'Nom', 'hint': 'Prénom'},
    {'label': 'Email', 'hint': 'E-mail'},
  ];
  final Map<String, TextEditingController> _dateControllers = {
    'Day': TextEditingController(text: '23'),
    'Month': TextEditingController(text: '11'),
    'Year': TextEditingController(text: '2000'),
  };

  @override
  void dispose() {
    // Dispose les contrôleurs pour éviter les fuites de mémoire
    _dateControllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }
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
                  SizedBox(height: 30.h),

                  // Ajout des champs de texte
                  ...textFieldsData.map((data) => Column(
                    children: [
                      _buildTextField(data),
                      SizedBox(height: 30.h),
                    ],
                  )),

                  SizedBox(height: 20.h),
                  Text(
                    'Your gender',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildGenderButton('Male', "assets/icons/img.png", _selectedGender == 'Male', () {
                        setState(() {
                          _selectedGender = 'Male';
                        });
                      }),
                      SizedBox(width: 10.w),
                      _buildGenderButton('Female', "assets/icons/img_2.png", _selectedGender == 'Female', () {
                        setState(() {
                          _selectedGender = 'Female';
                        });
                      }),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Your birthday',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDateField('Day', '23'),
                      SizedBox(width: 10.h),

                      _buildDateField('Month', '11'),
                      SizedBox(width: 10.h),

                      _buildDateField('Year', '2000'),
                    ],
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
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          hintStyle: TextStyle(color: AppTheme.secondaryColor),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.grisTextField),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.grisTextField),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.grisTextField),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderButton(String label, String iconPath, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 70.h,  // Réduit la hauteur
          width: 70.w,   // Réduit la largeur
          decoration: BoxDecoration(
            color: isSelected ? Colors.green.withOpacity(0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),  // Réduit le rayon du bord
            border: Border.all(color: isSelected ? Colors.green : Colors.grey),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(4.w),  // Réduit le padding
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.green : Colors.transparent,
                    borderRadius: BorderRadius.circular(6.r),  // Réduit le rayon du bord
                  ),
                  child: Image.asset(
                    iconPath,
                    width: 24.w,  // Ajuste la largeur de l'image
                    height: 24.h,  // Ajuste la hauteur de l'image
                  ),
                ),
                SizedBox(width: 8.w),  // Réduit l'espace entre l'image et le texte
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14.sp,  // Ajuste la taille du texte
                    color: isSelected ? Colors.green : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildDateField(String label, String initialValue) {
    final TextEditingController controller = _dateControllers[label]!;

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.grisTextField, // Couleur de fond
          borderRadius: BorderRadius.circular(10.r),
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
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            hintStyle: TextStyle(color: AppTheme.secondaryColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.blue, width: 1.0), // Bordure bleue
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.blue, width: 1.0), // Bordure bleue
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.blue, width: 2.0), // Bordure bleue plus épaisse quand actif
            ),
          ),
        ),
      ),
    );
  }

}
