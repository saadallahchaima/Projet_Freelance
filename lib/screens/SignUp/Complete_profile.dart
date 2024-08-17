import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khedma/theme/AppTheme.dart';

class CompleteProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(34, 123, 34, 55.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10.6),
                  child: Text(
                    'Complétez votre profile',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      fontSize: 22.3,
                      height: 1.4,
                      color: Color(0xFF1C1F1E),
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
                        SizedBox(width: 12), // Adjust spacing between cards
                        _buildSpecializationCard('Web Dev'),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.1),
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
                          'Description:',
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
                  margin: EdgeInsets.fromLTRB(5.2, 0, 0, 17),
                  child: Text(
                    'Proposez votre tarif par l’unité qui vous convient.',
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFFA7A6A5),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Prix Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Prix :',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xFF000000),
                            ),
                          ),
                          SizedBox(height: 5),
                          SizedBox(
                            width: 60, // Minimum width for the text field
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0xFF0099D5),
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 12,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              initialValue: '50',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      // Par Section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Par :',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Color(0xFF000000),
                              ),
                            ),
                            SizedBox(height: 5),
                            DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0xFF0099D5),
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 12,
                                ),
                              ),
                              value: 'Heure',
                              items: <String>['Heure', 'Jour', 'Semaine', 'Mois', 'Année']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                // Handle dropdown value change
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30.1),
                  child: Text(
                    'Ajoutez vos projets',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.9,
                      color: Color(0xFF1C1F1E),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCard(0.27.sw, AppTheme.primaryColor, 'assets/icons/image.png'),
                    SizedBox(width: 10.h),
                    _buildCard(0.27.sw, AppTheme.primaryColor, 'assets/icons/image.png'),
                    SizedBox(width: 10.h),
                    _buildCard(0.27.sw, AppTheme.primaryColor, 'assets/icons/image.png'),
                  ],
                ),
                SizedBox(height: 25),
                Container(
                  margin: EdgeInsets.only(bottom: 30.1),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF0099D5),
                      borderRadius: BorderRadius.circular(14.3),
                    ),
                    child: SizedBox(
                      width: 164.3,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 11.9, 0, 11.9),
                        child: Center(
                          child: Text(
                            'Continuer',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.7,
                              color: Color(0xFFF4F6F5),
                            ),
                          ),
                        ),
                      ),
                    ),
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
        color: Color(0xFFFFFFFF),
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
