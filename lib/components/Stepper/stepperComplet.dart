import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../theme/AppTheme.dart';

class Steppercomplet extends StatelessWidget {

  Future<Map<String, String>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'userName': prefs.getString('userName') ?? '',
      'email': prefs.getString('email') ?? '',
      'firstName': prefs.getString('firstName') ?? '',
      'lastName': prefs.getString('lastName') ?? '',
      'password': prefs.getString('password') ?? '',
    };
  }

  Future<void> registerUser(Map<String, String> userData) async {
    final response = await http.post(
      Uri.parse('http://localhost:8080/api/auth/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userData),
    );

    if (response.statusCode == 201) {
      // Successful registration
    } else {
      // Handle errors
    }
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
                  SizedBox(height: 80.h),
                  Center(
                    child: Image.asset(
                      "assets/icons/img_3.png",
                      width: 100.w,
                      height: 100.h,
                    ),
                  ),
                  SizedBox(height: 70.h),

                  Center(
                    child: Container(
                      width: 0.7.sw,
                      child: Text(
                        'Votre comte RentMe est créé avec succés !',
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
                        'Vous pouvez procéder à l’application.'
                        'Nous vous souhaitons une bonne experience.',
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}