import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
  _RentalItemCardDisponibleOffreState createState() => _RentalItemCardDisponibleOffreState();
}

class _RentalItemCardDisponibleOffreState extends State<RentalItemCardDisponibleOffre> {
  late bool statut;

  @override
  void initState() {
    super.initState();
    statut = widget.statut;
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Proposition de prix',
                style: GoogleFonts.roboto(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12.h),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Entrez votre prix',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 12.h),
              ElevatedButton(
                onPressed: () {
                  // Logique pour mettre à jour le statut de l'offre
                  Navigator.pop(context); // Ferme la BottomSheet
                  setState(() {
                    statut = true; // Met à jour le statut de l'offre
                  });
                },
                child: Text('Valider'),
              ),
            ],
          ),
        );
      },
    );
  }

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
              "Budget: ${widget.budget}""£",
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
                ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Offre en attente',
                  style: GoogleFonts.roboto(
                    fontSize: 12.sp,
                    color: Colors.green,
                  ),
                ),
                Row(

                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEEA41D),
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onPressed: widget.onRentPressed,
                      icon: Icon(Icons.edit, size: 16.sp,color: Colors.white,),
                      label: Text(
                        'Modifier',
                        style: GoogleFonts.roboto(
                          fontSize: 10.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onPressed: () {
                        // Logique pour annuler l'offre
                      },
                      icon: Icon(Icons.cancel, size: 16.sp,color:Colors.white),
                      label: Text(
                        'Annuler',
                        style: GoogleFonts.roboto(
                          fontSize: 10.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
                : Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: () {
                  _showBottomSheet(context);
                },
                child: Text(
                  'Proposer une offre',
                  style: GoogleFonts.roboto(fontSize: 10.sp, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
