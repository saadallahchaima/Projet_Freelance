import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/AppTheme.dart';
import 'RentalItemDetailPage.dart';

class RentalItemCardDisponibleOffre extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String date;

  final bool evalue;
  final double budget;
  final String location;
  final String ownerName;
  final bool statut;
  final VoidCallback onProposerOffrePressed;
  final VoidCallback onRentPressed;


  const RentalItemCardDisponibleOffre({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.ownerName,
    required this.onProposerOffrePressed,
    required this.date,
    required this.evalue,
    required this.budget,
    required this.statut,
    required this.onRentPressed,
  }) : super(key: key);

  @override
  _RentalItemCardDisponibleOffreState createState() =>
      _RentalItemCardDisponibleOffreState();
}

class _RentalItemCardDisponibleOffreState extends State<RentalItemCardDisponibleOffre> {
  late bool statut;
bool _showProposeButton = false;
  int period = 1; // Local state for period (e.g., number of nights)
  int price = 20;
  @override
  void initState() {
    super.initState();
    statut = widget.statut;
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildIncrementDecrementWidget(
                          "Période(Nuit)", period, (newPeriod) {
                        setState(() {
                          period = newPeriod;
                        });
                      }),
                      SizedBox(width: 20.w),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildIncrementDecrementWidget(
                              "Prix", price, (newPrice) {
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





  bool _showOfferText = true;

  void _handleCancelPressed() {
    setState(() {
      _showProposeButton = true;
    });
    // Logique pour annuler l'offre
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RentalItemDetailPage(
              imageUrl: widget.imageUrl,
              title: widget.title,
              date: widget.date,
              evalue: widget.evalue,
              budget: widget.budget,
              location: widget.location,
              ownerName: widget.ownerName,
              statut: widget.statut,
              ownerImageUrl: '',
            ),
          ),
        );
      },
    child: Card(
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
                widget.imageUrl,
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
                  widget.title,
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
                  widget.ownerName,
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
              widget.date,
              style: GoogleFonts.roboto(
                fontSize: 12.42.sp,
                fontWeight: FontWeight.w300,
                color: Colors.grey[600],
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8.h),

            // Status Section
            Text(
              widget.evalue ? 'Évalué par un expert' : 'Non évalué',
              style: GoogleFonts.roboto(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: widget.evalue ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 8.h),

            // Price Section
            Text(
              "Budget: ${widget.budget}£",
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
                  widget.location,
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

            statut
                ?Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (_showOfferText) // Conditionally show or hide the text
          Text(
            'Offre en attente',
            style: GoogleFonts.roboto(
              fontSize: 12.sp,
              color: Colors.green,
            ),
          ),
        Row(
          children: [
            if (!_showProposeButton) ...[
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEEA41D),
                  padding: EdgeInsets.symmetric(
                      vertical: 8.h, horizontal: 16.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: widget.onRentPressed,
                icon: Icon(Icons.edit,
                    size: 16.sp, color: Colors.white),
                label: Text(
                  'Modifier',
                  style: GoogleFonts.roboto(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(
                      vertical: 8.h, horizontal: 16.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: _handleCancelPressed,
                icon: Icon(Icons.cancel,
                    size: 16.sp, color: Colors.white),
                label: Text(
                  'Annuler',
                  style: GoogleFonts.roboto(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ] else ...[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(
                      vertical: 8.h, horizontal: 16.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: () => _showBottomSheet(context),
                child: Text(
                  'Proposer une offre',
                  style: GoogleFonts.roboto(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    )
                : Align(
              alignment: Alignment.centerRight,
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
    );
  }
}
