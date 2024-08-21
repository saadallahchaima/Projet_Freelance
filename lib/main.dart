import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedma/screens/MainPages/HomePage.dart';
import 'package:khedma/screens/MainPages/Profil.dart';
import 'package:khedma/screens/MainPages/RequestsPage.dart';
import 'package:khedma/screens/onboardings/spalshScreen.dart';

import 'package:khedma/theme/AppTheme.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Design size used for your mockup
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,  // Set the light theme
          darkTheme: AppTheme.darkTheme, // Set the dark theme
          themeMode: ThemeMode.system, // Use system theme mode
          title: "Freelence",
          home: SplashPage(),
        );
      },
    );
  }
}
