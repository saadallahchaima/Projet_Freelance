import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive sizing
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812), // Base design size for responsiveness
      minTextAdapt: true, // Automatically adapts text size
      splitScreenMode: true, // Supports multiple screen sizes
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine the screen size and adjust the layout accordingly
        double screenHeight = constraints.maxHeight;
        double screenWidth = constraints.maxWidth;

        return Container(
          width: double.infinity,
          height: screenHeight, // Full screen height
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
            child: Container(
              height: 300.h,
              width: double.infinity,
                child: Image.asset(
                  "assets/images/TopBleu.png",
                  width: screenWidth * 0.75, // 75% of the screen width
                  height: screenHeight * 0.25, // Adjust height based on the screen size
                  fit: BoxFit.cover,
                ),
                ),
              ),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 300.h,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/bottomJaune.png',
                    width: screenWidth * 0.75,
                    height: screenHeight * 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              child,
            ],
          ),
        );
      },
    );
  }
}
