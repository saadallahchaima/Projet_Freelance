import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/AppTheme.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String date;
  final int offers;
  final List<String> profileImages;

  const ServiceCard({
    Key? key,
    required this.title,
    required this.date,
    required this.offers,
    required this.profileImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 321.w,
      height: 253.h,
      child: Card(
        color: Colors.white.withOpacity(0.68), // Light background color with opacity
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
        elevation: 4,
        shadowColor: Color(0x3F000000), // Shadow properties
        child: Padding(
          padding: EdgeInsets.all(8.w), // Padding inside the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(17), // Définir le rayon des coins arrondis
                child: Image.asset(
                  "assets/images/menage.jpeg",
                  width: 303.39.w,
                  height: 100.11.h,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: 10.h),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                date,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Color(0xFF585858),
                ),
              ),
              SizedBox(height: 10.h), // Adjust this height if needed
              Flexible(
                child: SingleChildScrollView(
                  child: sousCard(), // Add SingleChildScrollView to avoid overflow
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sousCard() {
    return Column(
      children: [
        Container(
          width: 303.39.w,
          height: 61.68.h,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 280.39.w,
                  height: 59.90.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFFFAF1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.65),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 94.03.w,
                top: 34.57.h,
                child: SizedBox(
                  width: 72.w,
                  height: 8.80.h,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '+1 aut',
                          style: TextStyle(
                            color: Color(0xFF707070),
                            fontSize: 8.87.sp,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 're personne',
                          style: TextStyle(
                            color: Color(0xFF707070),
                            fontSize: 8.87.sp,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10.71.w,
                top: 10.37.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      color: AppTheme.orange, // Change to your desired color
                      size: 17.12.w,
                      shadows: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Shadow color
                          spreadRadius: 1, // Shadow spread radius
                          blurRadius: 3, // Shadow blur radius
                          offset: Offset(0, 2), // Shadow offset
                        ),
                      ],
                    ),
                    SizedBox(width: 8.w), // Space between icon and text
                    SizedBox(
                      width: 129.w,
                      height: 13.20.h,
                      child: Text(
                        'Vous avez reçu 4 offres',
                        style: TextStyle(
                          color: Color(0xFF525252),
                          fontSize: 12.42.sp,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 33.71.w,
                top: 28.33.h,
                child: Container(
                  width: 55.89.w,
                  height: 19.52.h,
                  child: Stack(
                    children: List.generate(
                      profileImages.length,
                          (index) => Positioned(
                        left: index * 22.18.w, // Adjust spacing based on image width
                        top: 0,
                        child: Container(
                          width: 22.18.w,
                          height: 19.52.h,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(profileImages[index]),
                              fit: BoxFit.fill,
                            ),
                            shape: CircleBorder(
                              side: BorderSide(width: 0.89.w, color: Colors.orange),
                            ),
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
      ],
    );
  }
}
