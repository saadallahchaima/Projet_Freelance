import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


import '../../entities/SavaData.dart';
import '../../theme/AppTheme.dart';
import 'DonneeAdresse.dart';

class SignUpScreen extends StatefulWidget {
  final SignUpFormController controller;

  SignUpScreen({Key? key, required this.controller}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
class SignUpFormController {
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Map<String, TextEditingController> _dateControllers = {
    'Day': TextEditingController(text: '23'),
    'Month': TextEditingController(text: '11'),
    'Year': TextEditingController(text: '2000'),
  };

  Map<String,dynamic> validate() {
    String errorMessage = '';
    Map<String,dynamic> result = {};
    int year = DateTime.now().year;
    int daysInFebruary = year % 4 == 0 ? 29 : 28;
    String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

    if (_prenomController.text.isEmpty ||
        _nomController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      errorMessage = 'All fields are required';
      result = {'error': true, 'message': errorMessage};
    }
    else if (!RegExp(emailRegex).hasMatch(_emailController.text)) {
      errorMessage = 'Invalid email';
      result = {'error': true, 'message': errorMessage};
    }
    else if (_passwordController.text.length < 6) {
      errorMessage = 'Password must be at least 6 characters';
      result = {'error': true, 'message': errorMessage};
    }
    // test if the date is valid
    else if (int.parse(_dateControllers['Day']!.text) > 31 ||
        int.parse(_dateControllers['Month']!.text) > 12) {
      errorMessage = 'Invalid day';
      result = {'error': true, 'message': errorMessage};
    }
    // test month
    else if (int.parse(_dateControllers['Month']!.text) < 1 && int.parse(_dateControllers['Month']!.text) > 12 ) {
      errorMessage = 'Invalid month';
      result = {'error': true, 'message': errorMessage};
    }
      else if (int.parse(_dateControllers['Month']!.text) == 2 && int.parse(_dateControllers['Day']!.text) > daysInFebruary) {
        errorMessage = 'Invalid day';
        result = {'error': true, 'message': errorMessage};
      }
   // test if the age > 18
    else if (int.parse(_dateControllers['Year']!.text) > 2003) {
      errorMessage = 'You must be 18 years old';
      result = {'error': true, 'message': errorMessage};
    }

    return result;
  }

  void dispose() {
    _prenomController.dispose();
    _nomController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _dateControllers.forEach((key, controller) => controller.dispose());
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _selectedGender = 'Male';

  final List<Map<String, dynamic>> textFieldsData = [
    {'label': 'Prénom', 'hint': 'Nom'},
    {'label': 'Nom', 'hint': 'Prénom'},
    {'label': 'Email', 'hint': 'E-mail'},
    {'label': 'Password', 'hint': 'Password'},
  ];


  @override
  void initState() {
    super.initState();
    _loadUserData();
  }
  @override
  void dispose() {
    Save();
    super.dispose();
  }
  void Save() async {
  // Sauvegarder les données

  await saveUserData('firstName', widget.controller._prenomController.text);
  await saveUserData('lastName', widget.controller._nomController.text);
  await saveUserData('email', widget.controller._emailController.text);
  await saveUserData('password', widget.controller._passwordController.text);
  await saveUserData('gender', _selectedGender);
  // Sauvegarder la date de naissance
  await saveUserData('day', widget.controller._dateControllers['Day']!.text);
  await saveUserData('month', widget.controller._dateControllers['Month']!.text);
  await saveUserData('year', widget.controller._dateControllers['Year']!.text);

  print("c bon");
}
  void _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      widget.controller._prenomController.text = prefs.getString('firstName') ?? '';
      widget.controller._nomController.text = prefs.getString('lastName') ?? '';
      widget.controller._emailController.text = prefs.getString('email') ?? '';
      widget.controller._passwordController.text = prefs.getString('password') ?? '';
      _selectedGender = prefs.getString('gender') ?? 'Male';
      widget.controller._dateControllers['Day']!.text = prefs.getString('day') ?? '23';
      widget.controller._dateControllers['Month']!.text = prefs.getString('month') ?? '11';
      widget.controller._dateControllers['Year']!.text = prefs.getString('year') ?? '2000';
    });
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
                  SizedBox(height: 18.h),
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
                  SizedBox(height: 20.h),


                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField(Map<String, dynamic> textFieldData) {
    TextEditingController controller;
    bool isPassword = false;
    switch (textFieldData['label']) {
      case 'Prénom':
        controller = widget.controller._prenomController;
        break;
      case 'Nom':
        controller = widget.controller._nomController;
        break;
      case 'Email':
        controller = widget.controller._emailController;
        break;
      case 'Password':
        controller = widget.controller._passwordController;
        isPassword = true;
        break;
      default:
        controller = TextEditingController(); // Un contrôleur par défaut si jamais
    }

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
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: textFieldData['hint'],
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
        validator: (value) {

          if (value == null || value.isEmpty) {
            if(controller == widget.controller._prenomController)
              return 'Please enter your first name';
            if(controller == widget.controller._nomController)
              return 'Please enter your last name';
            if(controller == widget.controller._emailController)
              return 'Please enter your email';
            if(controller == widget.controller._passwordController)
              return 'Please enter your password';
          }
          return null;
        },

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
    final TextEditingController controller = widget.controller._dateControllers[label]!;

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
