import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/AppTheme.dart';
import '../Buttons/MyButtons.dart';

class CustomSwitchRecherche extends StatefulWidget {
  final List<String> buttonLabels;

  CustomSwitchRecherche({required this.buttonLabels});

  @override
  _CustomSwitchRechercheState createState() => _CustomSwitchRechercheState();
}

class _CustomSwitchRechercheState extends State<CustomSwitchRecherche> {
  List<bool> isSelected = [true, false];
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _locationController= TextEditingController();
  double min = 20;
  double max = 5000;
  RangeValues _currentRangeValues = RangeValues(500, 5000);
  @override
  void dispose() {
    _searchController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9.0),
              boxShadow: [
                BoxShadow(
                  color: Color(0x11000000),
                  blurRadius: 24,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: ToggleButtons(
              borderRadius: BorderRadius.circular(9.0),
              borderColor: Colors.transparent,
              selectedBorderColor: Colors.transparent,
              fillColor: const Color(0xFF2DC3FF),
              selectedColor: Colors.white,
              color: Colors.grey,
              constraints: BoxConstraints(
                minWidth: 120.0.w,
                minHeight: 44.0.h,
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    widget.buttonLabels[0],
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: isSelected[0] ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    widget.buttonLabels[1],
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: isSelected[1] ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                    isSelected[buttonIndex] = (buttonIndex == index);
                  }
                });
              },
              isSelected: isSelected,
            ),
          ),
          SizedBox(height: 20.h),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isSelected[0]) ...[
            _buildDomainSection(),
          ] else if (isSelected[1]) ...[
            _buildDomainSectionTermine(),
          ] else
            ...[
              // Placeholder for default content if needed
            ],
        ],
      ),
    );
  }

  Widget _buildDomainSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Catégorie',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.h),
        TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Ménage/Développ...',
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Color(0xFF0099D6)),
            filled: true,
            fillColor: Color(0xFFEDF4FF),
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear, color: Colors.grey),
              onPressed: () {
                _searchController.clear();
              },
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CustomButton(
              text: 'Animation',
              color: Color(0xFF2DC4FF),
              onPressed: () {},
              borderColor: Color(0xFF2DC4FF),
              textColor: Colors.white,
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Text(
          'Domain',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.h),
        TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Ménage/Développ...',
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Color(0xFF0099D6)),
            filled: true,
            fillColor: Color(0xFFEDF4FF),
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear, color: Colors.grey),
              onPressed: () {
                _searchController.clear();
              },
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CustomButton(
              text: 'Design',
              color: Color(0xFF2DC4FF),
              onPressed: () {},
              borderColor: Color(0xFF2DC4FF),
              textColor: Colors.white,
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(height: 30.h),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryColor.withOpacity(0.1), // Shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 5, // Blur radius
                offset: Offset(0, 3), // Offset in x and y direction
              ),
            ],
            borderRadius: BorderRadius.circular(15), // Match the TextField border radius
          ),
          child: TextField(
            controller: _locationController,
            decoration: InputDecoration(
              hintText: 'Localisation',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(
                Icons.location_on_outlined,
                color: Color(0xFF0099D6),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide.none,
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 12.0), // Adjust right padding as needed
                child: SizedBox(
                  width: 10.0, // Desired width for the small icon
                  height: 10.0, // Desired height for the small icon
                  child: Image.asset(
                    "assets/icons/img_7.png",
                    fit: BoxFit.contain, // Ensures the image fits within the SizedBox
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          'Tarif',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Min',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: RangeSlider(
                  values: _currentRangeValues,
                  min: min,
                  max: max,
                  divisions: 450,
                  labels: RangeLabels(
                    '£${_currentRangeValues.start.round()}',
                    '£${_currentRangeValues.end.round()}',
                  ),
                  onChanged: (RangeValues newValues) {
                    setState(() {
                      _currentRangeValues = RangeValues(
                        newValues.start < min ? min : newValues.start,
                        newValues.end > max ? max : newValues.end,
                      );
                    });
                  },
                ),
              ),
            ),
            Text(
              'Max',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 30),
            // Par Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Par :',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF000000),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 100.w, // Reduced width for dropdown
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Color(0xFF0099D5),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 4,
                      ),
                    ),
                    value: 'Heure',
                    items: <String>['Heure', 'Jour', 'Semaine', 'Mois', 'Année']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle dropdown value change
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
  Widget _buildDomainSectionTermine() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Catégorie',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.h),
        TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Ménage/Développ...',
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Color(0xFF0099D6)),
            filled: true,
            fillColor: Color(0xFFEDF4FF),
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear, color: Colors.grey),
              onPressed: () {
                _searchController.clear();
              },
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CustomButton(
              text: 'Meuble',
              color: Color(0xFF2DC4FF),
              onPressed: () {},
              borderColor: Color(0xFF2DC4FF),
              textColor: Colors.white,
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),

        SizedBox(height: 30.h),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryColor.withOpacity(0.1), // Shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 5, // Blur radius
                offset: Offset(0, 3), // Offset in x and y direction
              ),
            ],
            borderRadius: BorderRadius.circular(15), // Match the TextField border radius
          ),
          child: TextField(
            controller: _locationController,
            decoration: InputDecoration(
              hintText: 'Localisation',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(
                Icons.location_on_outlined,
                color: Color(0xFF0099D6),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide.none,
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 12.0), // Adjust right padding as needed
                child: SizedBox(
                  width: 10.0, // Desired width for the small icon
                  height: 10.0, // Desired height for the small icon
                  child: Image.asset(
                    "assets/icons/img_7.png",
                    fit: BoxFit.contain, // Ensures the image fits within the SizedBox
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          'Budget',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Min',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: RangeSlider(
                  values: _currentRangeValues,
                  min: min,
                  max: max,
                  divisions: 450,
                  labels: RangeLabels(
                    '£${_currentRangeValues.start.round()}',
                    '£${_currentRangeValues.end.round()}',
                  ),
                  onChanged: (RangeValues newValues) {
                    setState(() {
                      _currentRangeValues = RangeValues(
                        newValues.start < min ? min : newValues.start,
                        newValues.end > max ? max : newValues.end,
                      );
                    });
                  },
                ),
              ),
            ),
            Text(
              'Max',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 30),
            // Par Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Par :',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF000000),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 100.w, // Reduced width for dropdown
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Color(0xFF0099D5),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 4,
                      ),
                    ),
                    value: 'Heure',
                    items: <String>['Heure', 'Jour', 'Semaine', 'Mois', 'Année']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle dropdown value change
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

}
