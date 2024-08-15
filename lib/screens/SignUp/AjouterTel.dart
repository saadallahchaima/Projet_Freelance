import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_picker/country_picker.dart'; // Make sure you've added this import

import '../../theme/AppTheme.dart';

class PhoneInput extends StatefulWidget {
  @override
  _PhoneInputState createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  String selectedCountryCode = '+1'; // Default country code
  String selectedCountryFlag = '🇺🇸'; // Default country flag (USA)

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(375, 812), // Taille de conception de base (largeur, hauteur)
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Image.asset(
                  "assets/images/logo_rent_me-removebg-preview 2.png",
                  width: 50.w,
                  height: 50.h,
                ),
              ),
              Center(
                child: Image.asset(
                  "assets/images/img_4.png",
                  width: 150.w,
                  height: 150.h,
                ),
              ),
              SizedBox(height: 50.h),
              Text(
                'Votre numéro de téléphone',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,

                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Text(
                'Votre numéro de téléphone est nécessaire pour que nous puissions vous contacter.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppTheme.accentColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: true,
                        onSelect: (Country country) {
                          setState(() {
                            selectedCountryCode = '+${country.phoneCode}';
                            selectedCountryFlag = country.flagEmoji;
                          });
                          print('Select country: ${country.displayName}');
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          Text(selectedCountryFlag, style: TextStyle(fontSize: 24.sp)),
                          SizedBox(width: 8.w),
                          Text(selectedCountryCode, style: TextStyle(fontSize: 16.sp)),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: _buildTextField({
                      'label': '',
                      'hint': '',
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTextField(Map<String, dynamic> textFieldData) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
    decoration: BoxDecoration(
      color: AppTheme.grisTextField, // Change this to your desired background color
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
        hintStyle: TextStyle(color: AppTheme.secondaryColor), // Change hint text color here
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.grisTextField), // Border color
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.grisTextField), // Border color when inactive
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.grisTextField), // Border color when active
        ),
      ),
    ),
  );
}

