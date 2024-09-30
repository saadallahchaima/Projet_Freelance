import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildSpecializationCard(String text) {
  return Container(
    margin: EdgeInsets.only(right: 12),
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xFF064BA6)),
      borderRadius: BorderRadius.circular(22),
      color: Color(0xFFFFFFFF),
      boxShadow: [
        BoxShadow(
          color: Color(0x0C8E8E8E),
          offset: Offset(0, 2),
          blurRadius: 3,
        ),
      ],
    ),
    child: SizedBox(
      height: 45,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 13, 14, 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xFF064BA6),
              ),
            ),
            SizedBox(
              width: 16,
              height: 16,
              child: Image.asset(
                'assets/icons/closeicon.png',
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
