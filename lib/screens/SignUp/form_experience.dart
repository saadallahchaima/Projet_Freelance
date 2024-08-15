import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/AppTheme.dart';

class FormExperience extends StatefulWidget {
  @override
  State<FormExperience> createState() => _FormExperienceState();
}

class _FormExperienceState extends State<FormExperience> {
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
                  SizedBox(height: 50.h), // Ajustez cette valeur pour réduire l'espace

                  Center(
                    child: Container(
                      width: 0.8.sw,
                      child: Text(
                        'Avez-vous une expérience ?',
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
                        'Nous souhaitons découvrir votre expérience.',
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
                    'label': 'Titre:',
                    'hint': 'Titre:',
                  }),
                  SizedBox(height: 10.h),
                  _buildTextField({
                    'label': 'Nom de société précédente:',
                    'hint': 'Nom de société précédente:',
                  }),
                  SizedBox(height: 50.h),
                  Text(
                    'Période',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w), // Padding horizontal pour 'Du'
                    child: Text(
                      'Du:',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),

                  // Ajouter les champs de date ici
                  Row(
                    children: [
                      _buildDateField('Day', '23'), // Ensure 'Day' is a key in _dateControllers
                      SizedBox(width: 10.w),
                      _buildDateField('Month', '11'), // Ensure 'Month' is a key in _dateControllers
                      SizedBox(width: 10.w),
                      _buildDateField('Year', '2000'), // Ensure 'Year' is a key in _dateControllers
                    ],
                  ),
                  SizedBox(height: 20.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w), // Padding horizontal pour 'Du'
                    child: Text(
                      'Jusqu''à:',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),

                  Row(
                    children: [
                      _buildDateField('Day', '23'), // Ensure 'Day' is a key in _dateControllers
                      SizedBox(width: 10.w),
                      _buildDateField('Month', '11'), // Ensure 'Month' is a key in _dateControllers
                      SizedBox(width: 10.w),
                      _buildDateField('Year', '2000'), // Ensure 'Year' is a key in _dateControllers
                    ],
                  ),

                  SizedBox(height: 30.h),
                  _buildTextField({
                    'label': 'Description',
                    'hint': 'Description',
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

  Widget _buildDateField(String label, String initialValue) {
    final TextEditingController? controller = _dateControllers[label];

    if (controller == null) {
      // Handle the case where controller is null
      return Container(); // Or another placeholder
    }

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.grisTextField,
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
              borderSide: BorderSide(color: Colors.blue, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.blue, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
            ),
          ),
        ),
      ),
    );
  }
}