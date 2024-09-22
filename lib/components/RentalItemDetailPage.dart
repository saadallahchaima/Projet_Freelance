import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/AppTheme.dart';
import 'appBar.dart';

class RentalItemDetailPage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final bool evalue;
  final double budget;
  final String location;
  final String ownerName;
  final String ownerImageUrl; // Added for owner's image
  final bool statut;

  const RentalItemDetailPage({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.evalue,
    required this.budget,
    required this.location,
    required this.ownerName,
    required this.ownerImageUrl, // Added for owner's image
    required this.statut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      appBar: CustomAppBar(
        notificationIcon: Icon(Icons.notifications, color: Colors.white),
        title: 'Offre de Services',
        showSearchBar: false,
        backgroundColor: AppTheme.primaryColor,
      ),
      body: SingleChildScrollView( // Scroll view added in case of overflow
        child: Column(
          children: [
            SizedBox(height: 16.0), // Adds spacing between AppBar and Text
            Center(
              child: Text(
                "Détails",
                style: GoogleFonts.roboto(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Card(
                  color: Colors.white,
                  elevation: 4.0, // Optional: for shadow effect
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Optional: rounded corners
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 600.0, // Set a maximum width for the card
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            // Set the radius for the corners
                            child: Image.asset(
                              imageUrl,
                              width: double.infinity,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Center(
                            child: Text(
                              title,
                              style: GoogleFonts.roboto(
                                fontSize: 14.19.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Description:',
                                style: GoogleFonts.roboto(
                                  fontSize: 12.42.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                'Construction d’une maison à deux étages sur 250m², avec un jardin et une piscine.',
                                style: GoogleFonts.roboto(
                                  fontSize: 12.42.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Besoin d’un expert.',
                            style: GoogleFonts.roboto(
                              fontSize: 12.42.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(height: 40.0),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(ownerImageUrl),
                                radius: 20.0,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                ownerName,
                                style: GoogleFonts.roboto(
                                  fontSize: 14.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Column( // Correctly using Column here to wrap the Rows
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined,
                                        color: Colors.blue, size: 18.sp),
                                    SizedBox(width: 4.w),
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
                                SizedBox(height: 8.0),
                                // Adding spacing between rows
                                Row(
                                  children: [
                                    Icon(Icons.phone, color: Colors.blue,
                                        size: 18.sp),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "+99-888-333-322",
                                      style: GoogleFonts.roboto(
                                        fontSize: 12.sp,
                                        color: Color(0xFF0C3469),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.0),
                                // Adding spacing between rows
                                Row(
                                  children: [
                                    Icon(Icons.alternate_email_outlined,
                                        color: Colors.blue, size: 18.sp),
                                    SizedBox(width: 4.w),
                                    Text(
                                      "jessica.virgolini50@gmail.com",
                                      style: GoogleFonts.roboto(
                                        fontSize: 12.sp,
                                        color: Color(0xFF0C3469),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 16.w),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              onPressed: () {
                                _showBottomSheet(context);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Proposer une offre',
                                    style: GoogleFonts.roboto(
                                        fontSize: 12.sp, color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(width: 8.w),
                                  Image.asset("assets/icons/offre.png",
                                      height: 16.sp, width: 16.sp),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    builder: (BuildContext context) {
      int period = 1; // Local state for period (e.g., number of nights)
      int price = 20; // Local state for price

      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Proposition de prix',
                          style: GoogleFonts.roboto(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  'Proposez une offre de prix afin de répondre à cette demande.',
                  style: GoogleFonts.roboto(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.0), // Small left padding
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildIncrementDecrementWidget("Prix", price, (newPrice) {
                            setState(() {
                              price = newPrice;
                            });
                          }),
                          SizedBox(width: 10.w),
                          Padding(
                            padding: EdgeInsets.only(bottom: 0.h),
                            child: Image.asset(
                              "assets/icons/coins.png",
                              width: 50.w,
                              height: 50.h,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Update the global price state here if needed
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 50.w),
                  ),
                  child: Text(
                    'Valider',
                    style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

Widget _buildIncrementDecrementWidget(
    String label, int value, Function(int) onChanged, {
      bool showCoin = false,
    }) {
  return Column(
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: 14.19.sp,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 8.h), // Add some space between the label and the controls
      Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the row content
        children: [
          Column(
            children: [
              Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF0099D5)),
                  borderRadius: BorderRadius.circular(6.6),
                ),
                child: Center(
                  child: IconButton(
                    iconSize: 20.w,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if (value > 1) {
                        onChanged(value - 1);
                      }
                    },
                    icon: Icon(Icons.remove),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF0099D5)),
                  borderRadius: BorderRadius.circular(6.6),
                ),
                child: Center(
                  child: IconButton(
                    iconSize: 20.w,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      onChanged(value + 1);
                    },
                    icon: Icon(Icons.add),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 5.w),
          Container(
            width: 70.w,
            height: 40.h,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 1.3),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF0099D5)),
              borderRadius: BorderRadius.circular(6),
              color: Color(0xFFF4F6F5),
              boxShadow: [
                BoxShadow(
                  color: Color(0x11124565),
                  offset: Offset(0, 4),
                  blurRadius: 7,
                ),
              ],
            ),
            child: Center(
              child: Text(
                "$value",
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}