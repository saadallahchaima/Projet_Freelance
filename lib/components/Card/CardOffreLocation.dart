import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class CardOffreLocationEnCours extends StatelessWidget {
  final String imageUrl;
  final String title;
  final DateTime dateDebut;
  final DateTime dateFin;
  final String location;
  final String ownerName;
  final String prix;
  final String description;
  final VoidCallback onContactPressed;
  final VoidCallback onRentPressed;

  const CardOffreLocationEnCours({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.dateDebut,
    required this.dateFin,
    required this.prix,
    required this.description,
    required this.location,
    required this.ownerName,
    required this.onContactPressed,
    required this.onRentPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(8.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          color: Colors.white.withOpacity(0.68),
          elevation: 4,
          shadowColor: Color(0x3F000000),
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Section
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    "assets/images/img_9.png",
                    width: double.infinity,
                    height: 150.h,
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
                  dateDebut.toString(),
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xFF585858),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.65.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 18.r,
                              backgroundImage: AssetImage("assets/images/img_6.png"),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text(
                                    ownerName,
                                    style: GoogleFonts.roboto(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column( // Budget and Payment vertically aligned
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 50.h),
                                          Text('Prix/nuit: $prix'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        // Location Section
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, color: Colors.blue,
                                size: 18.sp),
                            SizedBox(width: 5.w),
                            Expanded(
                              child: Text(
                                location,
                                style: GoogleFonts.roboto(
                                  fontSize: 12.sp,
                                  color: Color(0xFF0C3469),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],

            ),

          ),

        ),
sousCards(),
      ],
    );
  }
  
  Widget sousCards() {
    return Container(
      
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      // Ajout du padding des côtés
      width: 350.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.65.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Offre términée",
              style: GoogleFonts.roboto(
                fontSize: 14.19.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFF585858),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Accéptée : le 29 décembre 2022 à 20:34.',
              style: GoogleFonts.roboto(
                fontSize: 12.42.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF585858),

              ),
            ),
            Text(
              'Términée : le 30 décembre 2022 à 14:45.',
              style: GoogleFonts.roboto(
                fontSize: 12.42.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF585858),

              ),
            ),
          ],
        ),
      ),
    );
  }
}