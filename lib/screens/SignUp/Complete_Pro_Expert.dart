import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khedma/theme/AppTheme.dart';

class CompleteProfileProExpert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(34, 123, 34, 55.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10.6),
                   child: Center(
                  child: Text(
                    'Complétez votre profile',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      fontSize: 22.3,
                      height: 1.4,
                      color: Color.fromARGB(255, 2, 2, 2),
                    ),
                  ),
                   ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 17.4),
                  child: Text(
                    'Nous souhaitons mieux vous connaître afin de finaliser votre profile.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFFA7A6A5),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 22.1),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xFFF4F6F5),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x11124565),
                            offset: Offset(0, 4.8),
                            blurRadius: 7.14,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(19, 11.4, 19, 11.4),
                        child: Text(
                          'Spécialisé en:',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.3,
                            height: 1.6,
                            color: Color(0xFF141414),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 24),
                  child: SizedBox(
                    width: 264,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSpecializationCard('Design'),
                        SizedBox(width: 12),
                        _buildSpecializationCard('Web Dev'),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Diplome',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildCard(0.27.sw, AppTheme.primaryColor, 'assets/icons/image.png'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.h),
                // Updated Container for Formations
                Container(
                  margin: EdgeInsets.only(bottom: 20.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _buildCard(0.27.sw, AppTheme.primaryColor, 'assets/icons/image.png'),
                                SizedBox(width: 10.h),
                                _buildCard(0.27.sw, AppTheme.primaryColor, 'assets/icons/image.png'),
                                SizedBox(width: 10.h),
                                _buildCard(0.27.sw, AppTheme.primaryColor, 'assets/icons/image.png'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(double size, Color color, String imagePath) {
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
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: size * 0.1),
                  child: Image.asset(
                    imagePath,
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
                  color: color,
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

  Widget _buildSpecializationCard(String text) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF064BA6)),
        borderRadius: BorderRadius.circular(22),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0C8E8E8E),
            offset: Offset(0, 2),
            blurRadius: 3,
          ),
        ],
      ),
      child: SizedBox(
        height: 45,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 13, 14, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFF064BA6),
                ),
              ),
              SizedBox(
                width: 16,
                height: 16,
                child: Image.asset(
                  'assets/icons/closeicon.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
