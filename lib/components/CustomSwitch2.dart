import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/AppTheme.dart';
import 'IndependentButtonGroup.dart';
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
  final TextEditingController _budgetController = TextEditingController();
  bool showExpertQuestion = false;
  bool showBudgetField = false;
  bool showBudgetSlider = false;
  RangeValues _currentRangeValues = RangeValues(500, 5000);
  bool budgetUnder5000 = true;  // Par défaut, on suppose que le budget est sous 5000€
  String? _selectedUnit; // Variable d'état pour la sélection du dropdown
  TextEditingController _quantityController = TextEditingController(); // Contrôleur pour le TextField
  bool isYesSelected = false;
  bool isYesSelectedGroup1 = false;
  bool isYesSelectedGroup2 = false;

  @override
  void dispose() {
    _searchController.dispose();
    _budgetController.dispose();
    _quantityController.dispose();
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
                  for (int buttonIndex = 0;
                  buttonIndex < isSelected.length;
                  buttonIndex++) {
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
            _buildTerminerSection(),
          ] else if (isSelected[1]) ...[
            _buildCategorieSection(),
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
          'Domaine',
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
        _buildTextField('Description', 'Description'),

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

              CustomYesNoButton(
                onPressed: () {
                  setState(() {
                    showExpertQuestion = false;
                    showBudgetField = false;
                    showBudgetSlider = true;
                    isYesSelectedGroup1 = false; // Mettez à jour pour le premier groupe
                  });
                },
                isYes: false,
                isSelected: !isYesSelectedGroup1,
              ),
              SizedBox(width: 30.w),
              CustomYesNoButton(
                onPressed: () {
                  setState(() {
                    showExpertQuestion = true;
                    showBudgetSlider = false;
                    isYesSelectedGroup1 = true; // Mettez à jour pour le premier groupe
                  });
                },
                isYes: true,
                isSelected: isYesSelectedGroup1,
              ),
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
        SizedBox(height: 30.h),
        if (showExpertQuestion) ...[
          SizedBox(height: 30.h),
          Text(
            'Avez-vous besoin d’un expert ?',
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
                CustomYesNoButton(
                  onPressed: () {
                    setState(() {
                      isYesSelectedGroup2 = true; // Mettez à jour pour le deuxième groupe
                      showBudgetField = false;
                      showBudgetSlider = false;
                    });
                  },
                  isYes: true,
                  isSelected: isYesSelectedGroup2,
                ),
                SizedBox(width: 30.w),

                CustomYesNoButton(
                  onPressed: () {
                    setState(() {
                      isYesSelectedGroup2 = false;
                      showBudgetField = true;
                      showBudgetSlider = false;// Mettez à jour pour le deuxième groupe
                    });
                  },
                  isYes: false,
                  isSelected: !isYesSelectedGroup2,
                ),
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
        if (showBudgetField) ...[
          SizedBox(height: 30.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: _buildBudgetField()

              ),
            ],
          ),
        ],
        if (showBudgetSlider) ...[
          SizedBox(height: 30.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: _buildBudgetSlider()

              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildTerminerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(height: 20.h),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Action à définir lors de l'appui sur le bouton
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor, // Couleur bleue
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Rayon
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
        _buildTextField('', 'Déscription'),
        SizedBox(height: 30.h),

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
                            color: AppTheme.primaryColor,
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
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 4,
                        ),
                      ),
                      value: 'Heure',  // Initial value
                      items: <String>['Heure', 'Jour', 'Semaine', 'Mois', 'Année']  // Dropdown options
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

  Widget _buildCardPlus(double size, Color color, String imagePath) {
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
                    imagePath, // Use the parameter imagePath here
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


  Widget _buildTextField(String label, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.h),
        TextField(
          controller: _budgetController,  // Assure-toi d'utiliser le bon controller si besoin
          keyboardType: TextInputType.number,  // Personnalise si nécessaire pour chaque TextField
          decoration: InputDecoration(
            hintText: hintText,  // Hint personnalisé
            filled: true,
            fillColor: Color(0xFFEDF4FF),
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildBudgetSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Budget :',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            // Label Min
            SizedBox(
              width: 50.w, // Ajustez la largeur selon vos besoins
              child:  Text(
                'Min',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF000000),
                ),
                textAlign: TextAlign.center,
              ),
            ),


            Expanded(
              child: RangeSlider(
                values: _currentRangeValues,
                min: 0,
                max: 5000,
                divisions: 10,
                labels: RangeLabels(
                  _currentRangeValues.start.toStringAsFixed(0) + '€',
                  _currentRangeValues.end.toStringAsFixed(0) + '€',
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                    budgetUnder5000 = values.start <= 5000 && values.end <= 5000;
                  });
                },
              ),
            ),
            // Label Max
            SizedBox(
              width: 50.w, // Ajustez la largeur selon vos besoins
              child:  Text(
                'Max',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xFF000000),
                ),
                textAlign: TextAlign.center,
              ),
            ),

          ],
        ),
        SizedBox(height: 10.h),
        if (budgetUnder5000) ...[
          SizedBox(height: 30.h),
          Container(
            margin: EdgeInsets.only(bottom: 30.8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Label 'Par :'
                Text(
                  'Par :',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF000000),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 4,
                      ),
                    ),
                    value: _selectedUnit,
                    items: <String>[
                      'Heure',
                      'Jour',
                      'Semaine',
                      'Mois',
                      'Année',
                      'Mètre',
                      'Litre'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedUnit = newValue;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10.w),
                if (_selectedUnit == 'Mètre' || _selectedUnit == 'Litre') ...[
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: _quantityController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Quantité',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: AppTheme.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ],
    );
  }





  Widget _buildBudgetField() {
    return Row(
      children: [
        Text(
          'Budget :',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 10.w),  // Espacement entre le texte et le champ de texte
        Container(
          width: 100.w,  // Largeur personnalisée du champ de texte
          child: TextField(
            controller: _budgetController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),  // Espacement entre le champ de texte et l'icône
        Image.asset(
          'assets/icons/coin.png',
          height: 75.h,
          width: 75.w,
        ),
      ],
    );
  }

}
