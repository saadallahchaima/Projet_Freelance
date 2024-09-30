import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RentalItemCardDisponible extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String price;
  final String location;
  final String ownerName;
  final VoidCallback onContactPressed;
  final VoidCallback onRentPressed;

  const RentalItemCardDisponible({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.ownerName,
    required this.onContactPressed,
    required this.onRentPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                "assets/images/demandeLocationImage.png", // Utilise l'URL de l'image passée en paramètre
                width: double.infinity,
                height: 150.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 12.h),

            // Title and Owner Section
            Row(
              children: [

               Text(
                    title,
                    style: GoogleFonts.roboto(
                      fontSize: 14.96.sp,
                      fontWeight: FontWeight.w600,

                  ),
                ),
                SizedBox(width: 8.w),
                CircleAvatar(
                  radius: 18.r,
                  backgroundImage: AssetImage("assets/images/img_6.png"),
                ),
                SizedBox(width: 8.w),
                Text(
                  ownerName,
                  style: GoogleFonts.roboto(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),

            // Description Section
            Text(
              description,
              style: GoogleFonts.roboto(
                fontSize: 12.42.sp,
                fontWeight: FontWeight.w300,
                color: Colors.grey[600],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8.h),

            // Price and Location Section
            Text(
              'Prix/Nuit $price',
              style: GoogleFonts.roboto(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(Icons.location_on_outlined, color: Colors.blue, size: 18.sp),
                SizedBox(width: 4.w),

                Text(
                    location,
                    style: GoogleFonts.roboto(
                      fontSize: 12.sp,
                      color: Color(0xFF0C3469),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

              ],
            ),
            SizedBox(height: 8.h),

            // Buttons Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150.w,
                  height: 30.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    onPressed: onContactPressed,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Contacter le propriétaire',
                          style: GoogleFonts.roboto(fontSize: 10.sp, color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(width: 6.w),
                        Image.asset(
                          "assets/icons/message.png",
                          height: 16.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                SizedBox(
                  width: 120.w,
                  height: 30.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    onPressed: onRentPressed,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Louer cet article',
                          style: GoogleFonts.roboto(fontSize: 10.sp, color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(width: 4.w),
                        Image.asset(
                          "assets/icons/img_8.png",
                          height: 16.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
