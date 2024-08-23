import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/AppTheme.dart';

class formDiplome extends StatelessWidget {


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
                        'Avez vous un diplôme ?',
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
                        'Nous souhaitons mieux vous connaître afin de finaliser votre profile.',
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
                  SizedBox(height: 50.h),
                  Text(
                    'Diplome',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCard( 0.27.sw, AppTheme.primaryColor, 'assets/images/img_7.png'),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  Text(
                    'Formations',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCard( 0.27.sw, AppTheme.primaryColor, 'assets/images/img_7.png'),
                      SizedBox(width: 10.h),
                      _buildCard( 0.27.sw, AppTheme.primaryColor, 'assets/images/img_7.png'),
                      SizedBox(width: 10.h),

                      _buildCard( 0.27.sw, AppTheme.primaryColor, 'assets/images/img_7.png'),
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
}
Widget _buildCard( double size, Color color, String imagePath) {
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
                  offset: Offset(0, 10.0),
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
                color: color, // Utilisez le paramètre color ici
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

    ],
  );
}

