import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/AppTheme.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String date;
  final int offers;
  final List<String> profileImages;
  final String imageUrl; // Pour l'image principale

  const ServiceCard({
    Key? key,
    required this.title,
    required this.date,
    required this.offers,
    required this.profileImages,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 321.w,
      height: 270.h,
      child: Card(
        color: Colors.white.withOpacity(0.68),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
        elevation: 4,
        shadowColor: Color(0x3F000000),
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: Image.network( // Utiliser NetworkImage pour une image dynamique
                  imageUrl,
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
              SizedBox(height: 10.h),
              Flexible(
                child: SingleChildScrollView(
                  child: sousCard(), // Utilisation de SingleChildScrollView pour éviter le débordement
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
          height: 100.68.h,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 300.39.w,
                  height: 70.90.h,
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
              top: 42.57.h,
                 child: SizedBox(
                  width: 102.w,
                  height: 28.80.h,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '+$offers aut',
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
                      color: AppTheme.orange,
                      size: 17.12.w,
                      shadows: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    SizedBox(width: 8.w),
                    SizedBox(
                      width: 229.w,
                      height: 53.20.h,
                      child: Text(
                        'Vous avez reçu $offers offres',
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
                top: 38.33.h,
                child: Container(
                  width: 55.89.w,
                  height: 19.52.h,
                  child: Stack(
                    children: List.generate(
                      profileImages.length,
                          (index) => Positioned(
                        left: index * 22.18.w,
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
