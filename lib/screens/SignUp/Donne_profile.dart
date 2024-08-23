import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khedma/theme/AppTheme.dart';

class DonneeProfile extends StatefulWidget {
  @override
  _DonneeProfileState createState() => _DonneeProfileState();
}

class _DonneeProfileState extends State<DonneeProfile> {
  String selectedProfile = ''; 

  @override
  Widget build(BuildContext context) {
 return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFFFFFFF), // Set background color to white
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 13, 26, 50.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(4.5, 0, 0, 88.9),
                        child: SizedBox(
                          width: 261.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Any additional widgets if needed
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: Image.asset(
                          "assets/images/logo_rent_me-removebg-preview 2.png",
                          width: 50.w,
                          height: 50.h,
                        ),
                      ),
                      SizedBox(height: 50.h),
                      Container(
                        margin: EdgeInsets.fromLTRB(5.2, 0, 0, 10.6),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5.2, 0, 0, 22.4),
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
                        margin: EdgeInsets.fromLTRB(1.2, 0, 0, 26.2),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(1.8, 0, 0, 14.3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xFFFFFFFF),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x11124565),
                                          offset: Offset(0, 12),
                                          blurRadius: 7.5,
                                        ),
                                      ],
                                    ),
                                    child: SizedBox(
                                      width: 92,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(0, 26.3, 0, 26.2),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(0, 0, 0, 4.3),
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: Image.asset(
                                                  'assets/icons/Icon.png',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Ajouter votre photo',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xFF0099D5),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                right: 13.6,
                                top: 0,
                                child: SizedBox(
                                  width: 25.6,
                                  height: 25.5,
                                  child: Image.asset(
                                    'assets/icons/Shape.png',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1, 0, 0, 25),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF064BA6)),
                          borderRadius: BorderRadius.circular(11),
                          color: Color(0xFFFFFFFF),
                        ),
                        child: SizedBox(
                          width: 208,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 6, 1.2, 5),
                            child: Center(
                              child: Text(
                                'Développez votre profile',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.9,
                                  color: Color(0xFF064BA6),
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

              // Circles below the previous design
              Container(
                height: 400, // Define a fixed height for the Stack
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Circle for the expert in the center
                    Positioned(
                      right: 50,
                      left: 50,
                      bottom: 270,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedProfile = 'expert';
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 93,
                              height: 93,
                              decoration: BoxDecoration(
                                color: Color(0xFFD9D9D9),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedProfile == 'expert'
                                      ? Colors.blue
                                      : Colors.transparent,
                                  width: 3,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/icons/healthicons_city-worker-outline.png', // Replace with your image path
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'expert',
                              style: GoogleFonts.roboto(
                                color: Colors.blue,
                                fontSize: 14.33,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 50,
                      bottom: 190,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedProfile = 'amateur certifié';
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 93,
                              height: 93,
                              decoration: BoxDecoration(
                                color: Color(0xFFD9D9D9),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedProfile == 'amateur certifié'
                                      ? Colors.blue
                                      : Colors.transparent,
                                  width: 3,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/icons/healthicons_construction-worker-outline.png',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'amateur certifié',
                              style: GoogleFonts.roboto(
                                color: Colors.blue,
                                fontSize: 14.33,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 50,
                      bottom: 190,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedProfile = 'professionel';
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 93,
                              height: 93,
                              decoration: BoxDecoration(
                                color: Color(0xFFD9D9D9),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedProfile == 'professionel'
                                      ? Colors.blue
                                      : Colors.transparent,
                                  width: 3,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/icons/healthicons_factory-worker-outline.png',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'professionel',
                              style: GoogleFonts.roboto(
                                color: Colors.blue,
                                fontSize: 14.33,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
