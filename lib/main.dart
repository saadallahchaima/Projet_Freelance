import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedma/screens/MainPages/HomePage.dart';
import 'package:khedma/screens/MainPages/Profil.dart';
import 'package:khedma/screens/SignUp/Diplome.dart';

import 'package:khedma/screens/onboardings/spalshScreen.dart';
import 'package:khedma/theme/AppTheme.dart';

import 'screens/SignUp/Complete_profile.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),

      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          //theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          title: "RentMe",
          home: SplashPage()

        );
      },
    );
  }
}
