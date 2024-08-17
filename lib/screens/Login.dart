import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/CustomStepper.dart';
import '../components/LoginBtn.dart';
import '../theme/AppTheme.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top left blob
          Positioned(
            top: -120.h,
            left: -50.w,
            child: Image.asset(
              'assets/images/vectorLogintop2.png',
              width: 300.w, // Adjust width
              height: 574.11.h, // Adjust height
            ),
          ),
          // Bottom right blob
          Positioned(
            bottom: -70.h,
            right: -70.w,
            child: Image.asset(
              'assets/images/VectorLogin.png',
              width: 200.w, // Adjust width
              height: 1000.h, // Adjust height
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 32.h),
                    Padding(
                      padding: EdgeInsets.only(top: 100.h),
                      child: Container(
                        width: 361.w,
                        height: 189.h,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Container(
                      width: 281.w,
                      height: 46.h,
                      margin: EdgeInsets.only(left: 10.w, top: 20.h),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Adresse E-Mail',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      width: 281.w,
                      height: 46.h,
                      margin: EdgeInsets.only(left: 10.w),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Mot de Passe',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 40.w),
                        child: GestureDetector(
                          onTap: () {
                            // Handle "mot de passe oublié?" action
                          },
                          child: Text(
                            'mot de passe oublié?',
                            style: TextStyle(
                              color: AppTheme.secondaryColor,
                              decoration: TextDecoration.underline,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    const LoginBtn(),
                    SizedBox(height: 16.h),
                    GestureDetector(

                      onTap: () {
                     Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomStepper(),
                          ),
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                          text: 'Pas de compte? ',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Inscrivez-vous',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                color: AppTheme.black2,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Ou',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.secondaryColor,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      width: 145.w,
                      height: 52.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/img_2.png',
                            width: 37.w,
                            height: 36.h,
                          ),
                          SizedBox(width: 10.w),
                          Image.asset(
                            'assets/images/img_1.png',
                            width: 36.w,
                            height: 36.h,
                          ),

                          SizedBox(width: 10.w),
                          Image.asset(
                            'assets/images/facebook.png',
                            width: 52.w,
                            height: 52.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
