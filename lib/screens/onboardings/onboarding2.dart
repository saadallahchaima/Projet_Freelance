import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedma/components/Background/background2.dart';

import '../../components/Dots/CustomDots.dart';
import '../Login.dart';

class Onboarding2 extends StatefulWidget {
  final PageController controller;

  Onboarding2({required this.controller});

  @override
  _Onboarding1State createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background2(
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
                        'assets/images/Group 5.png',
                        width: 240.w,
                        height: 250.h,
                      ),
                    ),
                    SizedBox(height: 10.h), // Adjusted height value
                    Container(
                      width: 295.w,
                      child: const Text(
                        "Trouvez l'aide dont vous avez besoin en un rien de temps.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          color: Color(0xFF2D2B2E),
                          letterSpacing: -0.8,
                          height: 1.7, // Adjusted line height
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h), // Adjusted height value
                    Container(
                      width: 295.w,
                      child: const Text(
                        "Notre application facilite la recherche et la mise en relation avec des professionnels qualifiés.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto',
                          color: Color(0xFF2D2B2E),
                          letterSpacing: -0.3,
                          height: 1.8, // Adjusted line height
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
