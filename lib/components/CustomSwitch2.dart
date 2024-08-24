import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/AppTheme.dart';
import 'CustomYesNoButton.dart';
import 'MyButtons.dart';

class CustomSwitch2 extends StatefulWidget {
  final List<String> buttonLabels;

  CustomSwitch2({required this.buttonLabels});

  @override
  _CustomSwitch2State createState() => _CustomSwitch2State();
}

class _CustomSwitch2State extends State<CustomSwitch2> {
  List<bool> isSelected = [true, false];
  final TextEditingController _searchController = TextEditingController();
  double min = 500;
  double max = 5000;
  RangeValues _currentRangeValues = RangeValues(500, 5000);

  @override
  void dispose() {
    _searchController.dispose();
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
                minWidth: 150.0.w,
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
                  for (int buttonIndex = 0; buttonIndex <
                      isSelected.length; buttonIndex++) {
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
            SizedBox(height: 30.h),
            _buildBudgetSection(),

          ] else
            if (isSelected[1]) ...[
              _buildCategorieSection(),
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
        _buildTextField('Déscription:'),
        SizedBox(height: 30.h),
        Text(
          'Est-ce que votre demande dépasse 5000€ ?',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 30.h),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomYesNoButton(onPressed: () {}, isYes: true),
              SizedBox(width: 30.w),
              CustomYesNoButton(onPressed: () {}, isYes: false),
            ],
          ),
        ),
        SizedBox(height: 30.h),
        Center(
          child: Text(
            textAlign: TextAlign.center,

            'Si votre demande dépasse les 5000€, nous vous conseillons de consulter un expert.',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xFFA7A6A5),
            ),
          ),
        ),

      ],
    );
  }

  Widget _buildBudgetSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          ],
        ),
        SizedBox(height: 20.h), // Space between RangeSlider and button

        if (_currentRangeValues.end >= max) ...[
          SizedBox(height: 30.h),
          Center(
            child: Text(
              'Avez-vous besoin d’un expert ?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomYesNoButton(onPressed: () {}, isYes: true),
                SizedBox(width: 30.w),
                CustomYesNoButton(onPressed: () {}, isYes: false),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Center(
            child: Text(
              'L’expert aura une tariffe indépendante qui sera inclus dans le montant total.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFFA7A6A5),
              ),
            ),
          ),

        ],
        SizedBox(height: 20.h),

        Center(
          child: ElevatedButton(
            onPressed: () {
              // Define what happens when the button is pressed
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor, // Blue color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Radius
              ),
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 50.w),
            ),
            child: Text(
              'Terminer',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildCategorieSection() {
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
            hintText: 'Transport/Éléct...',
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

        Text(
          'Photos',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 30.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCard( 0.27.sw, AppTheme.primaryColor, 'assets/icons/image.png'),
            SizedBox(width: 20.h),

            _buildCardPlus( 0.27.sw, AppTheme.primaryColor, 'assets/images/img_12.png'),
          ],
        ),
        SizedBox(height: 30.h),
        _buildTextField('Déscription:'),
        Container(
          margin: EdgeInsets.only(bottom: 30.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Prix Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Prix :',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    width: 80.w, // Minimum width for the text field
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Color(0xFF0099D5),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue: '50',
                    ),
                  ),
                ],
              ),
              SizedBox(width: 30),
              // Par Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                          vertical: 5,
                          horizontal: 8,
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
        ),
        SizedBox(height: 20.h),

        Center(
          child: ElevatedButton(
            onPressed: () {
              // Define what happens when the button is pressed
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor, // Blue color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Radius
              ),
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 50.w),
            ),
            child: Text(
              'Terminer',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildCard( double size, Color color, String imagePath) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: size * 0.9,
              height: size * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                    offset: Offset(0, 10.0),
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: size * 0.1),
                  child: Image.asset(
                    imagePath, // Utilisez le paramètre imagePath ici
                    width: size * 0.4,
                    height: size * 0.4,
                  ),
                ),
              ),
            ),
            Positioned(
              top: size * 0.0,
              right: size * 0.0,
              child: Container(
                width: size * 0.20,
                height: size * 0.20,
                decoration: BoxDecoration(
                  color: color, // Utilisez le paramètre color ici
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: size * 0.18,
                  ),
                ),
              ),
            ),
          ],
        ),

      ],
    );
  }

  Widget _buildCardPlus( double size, Color color, String imagePath) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: size * 0.9,
              height: size * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                    offset: Offset(0, 10.0),
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: size * 0.1),
                  child: Image.asset(
                    imagePath, // Utilisez le paramètre imagePath ici
                    width: size * 0.4,
                    height: size * 0.4,
                  ),
                ),
              ),
            ),

          ],
        ),

      ],
    );
  }







  Widget _buildTextField(String hintText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 8.0.h),
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      decoration: BoxDecoration(
        color: Color(0xFFF4F6F5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
        maxLines: 4,
        minLines: 1,
      ),
    );
  }
}
