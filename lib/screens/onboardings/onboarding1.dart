import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/Dots/CustomDots.dart';
import '../../components/Background/background.dart';
import '../Login.dart';

class Onboarding1 extends StatefulWidget {
  final PageController controller;

  Onboarding1({required this.controller});

  @override
  _Onboarding1State createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20.h),
                      child: Image.asset(
                        'assets/images/img.png',
                        width: 240.w,
                        height: 250.h,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      width: 295.w,
                      child: const Text(
                        "Trouvez votre Match Parfait.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          color: Color(0xFF2D2B2E),
                          letterSpacing: -0.8,
                          height: 1.7,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      width: 295.w,
                      child: const Text(
                        "Notre processus de sélection garantit des correspondances de qualité supérieure à chaque fois.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto',
                          color: Color(0xFF2D2B2E),
                          letterSpacing: -0.3,
                          height: 1.8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 100.0.h,
              left: 0.0,
              right: 0.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          // Handle skip action
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );

                        },
                        child: Text(
                          "Ignorer",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomDotsIndicator(
                        controller: widget.controller,
                        itemCount: 3,
                        onPageSelected: (int page) {
                          widget.controller.animateToPage(
                            page,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                      ),

                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          // Handle next action
                          widget.controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text(
                          "Suivant",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
