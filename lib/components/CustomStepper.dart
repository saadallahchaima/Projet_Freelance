import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khedma/Service/collectdonnee.dart';
import 'package:khedma/components/MyButtons.dart';
import 'package:khedma/screens/SignUp/Complete_Pro_Expert.dart';
import 'package:khedma/screens/SignUp/Diplome.dart';
import 'package:khedma/screens/SignUp/societe_exper.dart';
import 'package:khedma/screens/SignUp/stepperComplet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../screens/MainPages/HomePage.dart';
import '../../screens/SignUp/formDiplome.dart';
import '../../screens/SignUp/form_Societe2.dart';
import '../../screens/SignUp/verifMail.dart';
import '../../screens/SignUp/verificationTel.dart';
import '../../theme/AppTheme.dart';

class CustomStepper extends StatefulWidget {
  @override
  _CustomStepperState createState() => _CustomStepperState();
}

Future<Map<String, String>> getUserData() async {
  final prefs = await SharedPreferences.getInstance();
  return {
    'email': prefs.getString('email') ?? '',
    'firstName': prefs.getString('firstName') ?? '',
    'lastName': prefs.getString('lastName') ?? '',
    'password': prefs.getString('password') ?? '',
    'adresse': prefs.getString('adresse') ?? '',
    'Pay': prefs.getString('Pay') ?? '',
    'codePostal': prefs.getString('codePostal') ?? '',
    'ville': prefs.getString('ville') ?? '',
    'dateNaissance': prefs.getString('dateNaissance') ?? '',
    'gendre': prefs.getString('gendre') ?? '',
    'numTel': prefs.getString('numTel') ?? '',
    'nomSociete': prefs.getString('nomSociete') ?? '',
    'domainActivite': prefs.getString('domainActivite') ?? '',
    'rib': prefs.getString('domainActivite') ?? '',
  };

}

String _selectedGender = 'Male';
final List<Map<String, dynamic>> textFieldsData = [
  {'label': 'Prénom', 'hint': 'Nom'},
  {'label': 'Nom', 'hint': 'Prénom'},
  {'label': 'Email', 'hint': 'E-mail'},
  {'label': 'Password', 'hint': 'Password'},
];
final Map<String, TextEditingController> _dateControllers = {
  'Day': TextEditingController(text: '23'),
  'Month': TextEditingController(text: '11'),
  'Year': TextEditingController(text: '2000'),
};
final TextEditingController _prenomController = TextEditingController();
final TextEditingController _nomController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
String selectedProfile = '';
String selectedCountryFlag = '🇺🇸'; // Default country flag (USA)
String selectedCountryCode = '+1'; // Default country code
final TextEditingController _PaysController = TextEditingController();
final TextEditingController _VilleController = TextEditingController();
final TextEditingController _AdresseController = TextEditingController();
final TextEditingController _postalCodeController = TextEditingController();


class _CustomStepperState extends State<CustomStepper> {
  int currentStep = 0;


  @override
  void dispose() {
    _prenomController.dispose();
    _nomController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _PaysController.dispose();
  _VilleController.dispose();
  _AdresseController.dispose();
  _postalCodeController.dispose();
    _dateControllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                if (currentStep > 0) {
                  setState(() {
                    currentStep--;
                  });
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: LinearProgressIndicator(
                        value: currentStep / 14,
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        minHeight: 4.h,
                      ),
                    ),
                    CircleAvatar(
                      radius: 15.r,
                      backgroundColor:
                          currentStep >= 11 ? Colors.green : Colors.grey[200],
                      child: Icon(
                        Icons.check_circle_outline_outlined,
                        color:
                            currentStep >= 11 ? Colors.white : Colors.grey[600],
                        size: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  _getPageForStep(currentStep),
                  if (_hasDotsForStep(currentStep))
                    _buildDotsIndicator(currentStep),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Center(
                child: _buildButtonsForStep(currentStep),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getPageForStep(int step) {
    switch (step) {
      case 0:
return SingleChildScrollView(
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 24.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Center(
          child: Image.asset(
            "assets/images/logo_rent_me-removebg-preview 2.png",
            width: 50.w,
            height: 50.h,
          ),
        ),
        SizedBox(height: 50.h),
        Center(
          child: Container(
            width: 0.8.sw,
            child: Text(
              'Vos données principales',
              style: TextStyle(
                fontSize: 0.06.sw,
                fontWeight: FontWeight.w600,
                color: AppTheme.secondaryColor,
                fontFamily: 'Roboto',
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Center(
          child: Container(
            width: 0.8.sw,
            child: Text(
              'Nous souhaitons mieux vous connaître afin de finaliser votre profil.',
              style: TextStyle(
                fontSize: 0.04.sw,
                color: AppTheme.accentColor,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 70.h),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                showCountryPicker(
                  context: context,
                  showPhoneCode: true,
                  onSelect: (Country country) {
                    setState(() {
                      selectedCountryFlag = country.flagEmoji;
                    });
                    print('Select country: ${country.displayName}');
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Text(selectedCountryFlag, style: TextStyle(fontSize: 24.sp)),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10.w), // Add some space between the country picker and text field
            Expanded(
              child: _buildTextField({
                'label': 'Pays',
                'hint': 'Entrez votre pays',
                'controller': _PaysController,
              }),
            ),
          ],
        ),
        SizedBox(height: 30.h),
        _buildTextField({
          'label': 'Ville',
          'hint': 'Entrez votre ville',
          'controller': _VilleController,
        }),
        SizedBox(height: 30.h),
        _buildTextField({
          'label': 'Adresse',
          'hint': 'Entrez votre adresse',
          'controller': _AdresseController,
        }),
        SizedBox(height: 30.h),
        _buildTextField({
          'label': 'Code Postal',
          'hint': 'Entrez votre code postal',
          'controller': _postalCodeController,
        }),
      ],
    ),
  ),
);

      case 1:
        return VerificationPage();
      case 2:
        return VerificationMailPage();
      case 3:
        //return PhoneInput();
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Center(
                  child: Image.asset(
                    "assets/images/logo_rent_me-removebg-preview 2.png",
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
                Center(
                  child: Image.asset(
                    "assets/images/img_10.png",
                    width: 150.w,
                    height: 150.h,
                  ),
                ),
                SizedBox(height: 50.h),
                Text(
                  'Votre numéro de téléphone',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Text(
                  'Votre numéro de téléphone est nécessaire pour que nous puissions vous contacter.',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppTheme.accentColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50.h),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          showPhoneCode: true,
                          onSelect: (Country country) {
                            setState(() {
                              selectedCountryCode = '+${country.phoneCode}';
                              selectedCountryFlag = country.flagEmoji;
                            });
                            print('Select country: ${country.displayName}');
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 12.w),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          children: [
                            Text(selectedCountryFlag,
                                style: TextStyle(fontSize: 24.sp)),
                            SizedBox(width: 8.w),
                            Text(selectedCountryCode,
                                style: TextStyle(fontSize: 16.sp)),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: _buildTextField({
                        'label': '',
                        'hint': '',
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      case 4:
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Center(
                  child: Image.asset(
                    "assets/images/logo_rent_me-removebg-preview 2.png",
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
                SizedBox(height: 50.h),
                Center(
                  child: Container(
                    width: 0.8.sw,
                    child: Text(
                      'Vos données principales',
                      style: TextStyle(
                        fontSize: 0.06.sw,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.secondaryColor,
                        fontFamily: 'Roboto',
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 18.h),
                Center(
                  child: Container(
                    width: 0.8.sw,
                    child: Text(
                      'Nous souhaitons mieux vous connaître afin de finaliser votre profil.',
                      style: TextStyle(
                        fontSize: 0.04.sw,
                        color: AppTheme.accentColor,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                ...textFieldsData.map((data) => Column(
                      children: [
                        _buildTextField(data),
                        SizedBox(height: 30.h),
                      ],
                    )),
                SizedBox(height: 20.h),
                Text(
                  'Your gender',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildGenderButton('Male', "assets/icons/img.png",
                        _selectedGender == 'Male', () {
                      setState(() {
                        _selectedGender = 'Male';
                      });
                    }),
                    SizedBox(width: 10.w),
                    _buildGenderButton('Female', "assets/icons/img_2.png",
                        _selectedGender == 'Female', () {
                      setState(() {
                        _selectedGender = 'Female';
                      });
                    }),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  'Your birthday',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDateField('Day', '23'),
                    SizedBox(width: 10.h),
                    _buildDateField('Month', '11'),
                    SizedBox(width: 10.h),
                    _buildDateField('Year', '2000'),
                  ],
                ),
              ],
            ),
          ),
        );
      case 5:
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 13, 26, 50.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(4.5, 0, 0, 88.9),
                        child: SizedBox(
                          width: 261.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Any additional widgets if needed
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: Image.asset(
                          "assets/images/logo_rent_me-removebg-preview 2.png",
                          width: 50.w,
                          height: 50.h,
                        ),
                      ),
                      SizedBox(height: 50.h),
                      Container(
                        margin: EdgeInsets.fromLTRB(5.2, 0, 0, 10.6),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    width: 0.8.sw,
                                    child: Text(
                                      'Vos données principales',
                                      style: TextStyle(
                                        fontSize: 0.06.sw,
                                        fontWeight: FontWeight.w600,
                                        color: AppTheme.secondaryColor,
                                        fontFamily: 'Roboto',
                                        height: 1.4,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5.2, 0, 0, 22.4),
                        child: Text(
                          'Nous souhaitons mieux vous connaître afin de finaliser votre profile.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xFFA7A6A5),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1.2, 0, 0, 26.2),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.fromLTRB(1.8, 0, 0, 14.3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xFFFFFFFF),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x11124565),
                                          offset: Offset(0, 12),
                                          blurRadius: 7.5,
                                        ),
                                      ],
                                    ),
                                    child: SizedBox(
                                      width: 92,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            0, 26.3, 0, 26.2),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 4.3),
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: Image.asset(
                                                  'assets/icons/Icon.png',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Ajouter votre photo',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xFF0099D5),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                right: 13.6,
                                top: 0,
                                child: SizedBox(
                                  width: 25.6,
                                  height: 25.5,
                                  child: Image.asset(
                                    'assets/icons/Shape.png',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1, 0, 0, 25),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF064BA6)),
                          borderRadius: BorderRadius.circular(11),
                          color: Color(0xFFFFFFFF),
                        ),
                        child: SizedBox(
                          width: 208,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 6, 1.2, 5),
                            child: Center(
                              child: Text(
                                'Développez votre profile',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.9,
                                  color: Color(0xFF064BA6),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Circles below the previous design
              Container(
                height: 400, // Define a fixed height for the Stack
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Circle for the expert in the center
                    Positioned(
                      right: 50,
                      left: 50,
                      bottom: 270,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedProfile = 'expert';
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 93,
                              height: 93,
                              decoration: BoxDecoration(
                                color: Color(0xFFD9D9D9),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedProfile == 'expert'
                                      ? Colors.blue
                                      : Colors.transparent,
                                  width: 3,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/icons/healthicons_city-worker-outline.png',
                                  // Replace with your image path
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'expert',
                              style: GoogleFonts.roboto(
                                color: Colors.blue,
                                fontSize: 14.33,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 50,
                      bottom: 190,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedProfile = 'amateur certifié';
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 93,
                              height: 93,
                              decoration: BoxDecoration(
                                color: Color(0xFFD9D9D9),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedProfile == 'amateur certifié'
                                      ? Colors.blue
                                      : Colors.transparent,
                                  width: 3,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/icons/healthicons_construction-worker-outline.png',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'amateur certifié',
                              style: GoogleFonts.roboto(
                                color: Colors.blue,
                                fontSize: 14.33,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 50,
                      bottom: 190,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedProfile = 'professionel';
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 93,
                              height: 93,
                              decoration: BoxDecoration(
                                color: Color(0xFFD9D9D9),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: selectedProfile == 'professionel'
                                      ? Colors.blue
                                      : Colors.transparent,
                                  width: 3,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/icons/healthicons_factory-worker-outline.png',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'professionel',
                              style: GoogleFonts.roboto(
                                color: Colors.blue,
                                fontSize: 14.33,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

      //DonneeProfile();
      //return formDiplome();
      case 6:
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(34, 123, 34, 55.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10.6),
                    child: Text(
                      'Complétez votre profile',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.3,
                        height: 1.4,
                        color: Color(0xFF1C1F1E),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 17.4),
                    child: Text(
                      'Nous souhaitons mieux vous connaître afin de finaliser votre profile.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xFFA7A6A5),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 22.1),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(0xFFF4F6F5),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x11124565),
                              offset: Offset(0, 4.8),
                              blurRadius: 7.14,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(19, 11.4, 19, 11.4),
                          child: Text(
                            'Spécialisé en:',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 13.3,
                              height: 1.6,
                              color: Color(0xFF141414),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 24),
                    child: SizedBox(
                      width: 264,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSpecializationCard('Design'),
                          SizedBox(width: 12), // Adjust spacing between cards
                          _buildSpecializationCard('Web Dev'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20.1),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color(0xFFF4F6F5),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x11124565),
                              offset: Offset(0, 4.8),
                              blurRadius: 7.14,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(19, 11.4, 19, 11.4),
                          child: Text(
                            'Description:',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 13.3,
                              height: 1.6,
                              color: Color(0xFF141414),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5.2, 0, 0, 17),
                    child: Text(
                      'Proposez votre tarif par l’unité qui vous convient.',
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xFFA7A6A5),
                      ),
                    ),
                  ),
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
                              width: 60, // Minimum width for the text field
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
                        Expanded(
                          child: Column(
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
                              DropdownButtonFormField<String>(
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
                                value: 'Heure',
                                items: <String>[
                                  'Heure',
                                  'Jour',
                                  'Semaine',
                                  'Mois',
                                  'Année'
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  // Handle dropdown value change
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30.1),
                    child: Text(
                      'Ajoutez vos projets',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.9,
                        color: Color(0xFF1C1F1E),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCard(0.27.sw, AppTheme.primaryColor,
                          'assets/icons/image.png'),
                      SizedBox(width: 10.h),
                      _buildCard(0.27.sw, AppTheme.primaryColor,
                          'assets/icons/image.png'),
                      SizedBox(width: 10.h),
                      _buildCard(0.27.sw, AppTheme.primaryColor,
                          'assets/icons/image.png'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      //return FormExperience();
      case 7:
        return diplome();
      // return FormSociete();
      case 8:
        return SocieteExper();
      //return FormSociete2();
      case 9:
        return CompleteProfileProExpert();
      case 10:
        return formDiplome();
      case 11:
        // return FormExperience();
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),

                Center(
                  child: Image.asset(
                    "assets/images/logo_rent_me-removebg-preview 2.png",
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
                SizedBox(height: 50.h),
                // Ajustez cette valeur pour réduire l'espace

                Center(
                  child: Container(
                    width: 0.8.sw,
                    child: Text(
                      'Avez-vous une expérience ?',
                      style: TextStyle(
                        fontSize: 0.05.sw,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.secondaryColor,
                        fontFamily: 'Roboto',
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Center(
                  child: Container(
                    width: 0.8.sw,
                    child: Text(
                      'Nous souhaitons découvrir votre expérience.',
                      style: TextStyle(
                        fontSize: 0.03.sw,
                        color: AppTheme.accentColor,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                _buildTextField({
                  'label': 'Titre:',
                  'hint': 'Titre:',
                }),
                SizedBox(height: 10.h),
                _buildTextField({
                  'label': 'Nom de société précédente:',
                  'hint': 'Nom de société précédente:',
                }),
                SizedBox(height: 50.h),
                Text(
                  'Période',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  // Padding horizontal pour 'Du'
                  child: Text(
                    'Du:',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.blue,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    _buildDateField('Day', '23'),
                    // Ensure 'Day' is a key in _dateControllers
                    SizedBox(width: 10.w),
                    _buildDateField('Month', '11'),
                    // Ensure 'Month' is a key in _dateControllers
                    SizedBox(width: 10.w),
                    _buildDateField('Year', '2000'),
                    // Ensure 'Year' is a key in _dateControllers
                  ],
                ),
                SizedBox(height: 20.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  // Padding horizontal pour 'Du'
                  child: Text(
                    'Jusqu' 'à:',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.blue,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),

                Row(
                  children: [
                    _buildDateField('Day', '23'),
                    // Ensure 'Day' is a key in _dateControllers
                    SizedBox(width: 10.w),
                    _buildDateField('Month', '11'),
                    // Ensure 'Month' is a key in _dateControllers
                    SizedBox(width: 10.w),
                    _buildDateField('Year', '2000'),
                    // Ensure 'Year' is a key in _dateControllers
                  ],
                ),

                SizedBox(height: 30.h),
                _buildTextField({
                  'label': 'Description',
                  'hint': 'Description',
                }),
              ],
            ),
          ),
        );
      case 12:
        // return FormSociete();
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Center(
                  child: Image.asset(
                    "assets/images/logo_rent_me-removebg-preview 2.png",
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
                SizedBox(height: 50.h),
                Center(
                  child: Container(
                    width: 0.8.sw,
                    child: Text(
                      'Avez vous une société ?',
                      style: TextStyle(
                        fontSize: 0.05.sw,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.secondaryColor,
                        fontFamily: 'Roboto',
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Center(
                  child: Container(
                    width: 0.8.sw,
                    child: Text(
                      'Veuillez citer vos justificatifs pour valider votre statut.',
                      style: TextStyle(
                        fontSize: 0.03.sw,
                        color: AppTheme.accentColor,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                _buildTextField({
                  'label': 'Nom de la Société:',
                  'hint': 'Nom de la Société:',
                }),
                SizedBox(height: 10.h),
                _buildTextField({
                  'label': 'Domaine d’activité:',
                  'hint': 'Domaine d’activité:',
                }),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CustomButton(
                      text: 'Communication',
                      color: Color(0xFFFFFFFF),
                      onPressed: () {},
                      borderColor: Color(0xFF064BA6),
                      textColor: Color(0xFF064BA6),
                      textStyle: TextStyle(
                        color: Color(0xFF064BA6),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.h),
                Text(
                  'Documents',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildCardSociete('K.BIS', 0.27.sw, AppTheme.primaryColor,
                        'assets/icons/img_6.png'),
                    SizedBox(width: 16.h),
                    _buildCardSociete('Label de qualité', 0.27.sw,
                        AppTheme.primaryColor, 'assets/icons/img_6.png'),
                    SizedBox(width: 16.h),
                    _buildCardSociete('Assurance ', 0.27.sw,
                        AppTheme.primaryColor, 'assets/icons/img_6.png'),
                  ],
                ),
                SizedBox(height: 30.h),
                Center(
                  child: Container(
                    width: 0.8.sw,
                    child: Text(
                      'Veuillez télécharger les documents nécessaires comme K.BIS, Garantie décennale, Label de qualité (RGE).',
                      style: TextStyle(
                        fontSize: 0.03.sw,
                        color: AppTheme.accentColor,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      case 13:
        return FormSociete2();
      case 14:
        return Steppercomplet();
        break;

      default:
        return Center(child: Text('Étape inconnue'));
    }
  }

  bool _hasDotsForStep(int step) {
    return step == 7 || step == 8;
  }

  Widget _buildDotsIndicator(int step) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: DotsIndicator(
        dotsCount: 2,
        position: step == 7 ? 0 : 1,
        decorator: DotsDecorator(
          activeColor: Colors.blue,
          color: Colors.grey,
          size: Size.square(9.0),
          activeSize: Size.square(12.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonsForStep(int step) {
    if (step == 7 || step == 8 || step == 9) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {

                setState(() {
                  currentStep++;
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                backgroundColor: AppTheme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.33.r),
                ),
              ),
              child: Text(
                'Continuer',
                style: TextStyle(
                  fontSize: 0.034.sw,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  currentStep++;
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.33.r),
                ),
              ),
              child: Text(
                'Ignorer',
                style: TextStyle(
                  fontSize: 0.034.sw,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    } else if (step == 14) {
      // Case 14
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Center(
          child: Container(
            width: 0.4.sw,
            child: ElevatedButton(
              onPressed: () {
                // Naviguer vers HomeScreen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                backgroundColor: AppTheme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.33.r),
                ),
              ),
              child: Text(
                'Continuer vers Home',
                style: TextStyle(
                  fontSize: 0.034.sw,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    } else  if (step == 4 ) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Center(
          child: Container(
            width: 0.4.sw,
            child: ElevatedButton(
              onPressed: () async {
          
                await saveUserData('firstName', _prenomController.text);
                await saveUserData('lastName', _nomController.text);
                await saveUserData('email', _emailController.text);
                await saveUserData('password', _passwordController.text);
                await saveUserData('gender', _selectedGender);
                // Sauvegarder la date de naissance
                await saveUserData('day', _dateControllers['Day']!.text);
                await saveUserData('month', _dateControllers['Month']!.text);
                await saveUserData('year', _dateControllers['Year']!.text);



                print("c bon");
                print("Données sauvegardées Adresse avec succès !");
          
                print("Données sauvegardées avec succès !");
                print('First Name: ${_prenomController.text}');
                print('Last Name: ${_nomController.text}');
                print('Email: ${_emailController.text}');
                print('Password: ${_passwordController.text}');

                setState(() {
                  currentStep++;
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                backgroundColor: AppTheme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.33.r),
                ),
              ),
              child: Text(
                'Continuer',
                style: TextStyle(
                  fontSize: 0.034.sw,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }
  else if (step == 0) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Center(
          child: Container(
            width: 0.4.sw,
            child: ElevatedButton(
             onPressed: () async {
                //////////adresse//////////
                await saveUserData('ville', _VilleController.text);
                await saveUserData('adresse', _AdresseController.text);
                await saveUserData('codePostal', _postalCodeController.text);
                

                print("c bon");
                print("Données sauvegardées Adresse avec succès !");
                print('adresse: ${_AdresseController.text}');
                print('codePostal: ${_postalCodeController.text}');
                print('Ville: ${_VilleController.text}');
               
                setState(() {
                  currentStep++;
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                backgroundColor: AppTheme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.33.r),
                ),
              ),
              child: Text(
                'Continuer',
                style: TextStyle(
                  fontSize: 0.034.sw,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }else {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Center(
          child: Container(
            width: 0.4.sw,
            child: ElevatedButton(
              onPressed: () async {
                setState(() {
                  currentStep++;
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                backgroundColor: AppTheme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.33.r),
                ),
              ),
              child: Text(
                'Continuer',
                style: TextStyle(
                  fontSize: 0.034.sw,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
  

  Widget _buildTextFieldAdresse(Map<String, dynamic> textFieldData) {
    TextEditingController controller;

    switch (textFieldData['label']) {
      case 'Pays':
        controller = _PaysController;
        break;
      case 'Ville':
        controller = _VilleController;
        break;
      case 'Adresse':
        controller = _AdresseController;
        break;
      case 'CodePostal':
        controller = _postalCodeController;
        break;
        
      default:
        controller =
            TextEditingController(); // Un contrôleur par défaut si jamais
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: AppTheme.grisTextField,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5.0,
            spreadRadius: 1.0,
            offset: Offset(0, 2.0),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: textFieldData['hint'],
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          hintStyle: TextStyle(color: AppTheme.secondaryColor),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.grisTextField),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.grisTextField),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.grisTextField),
          ),
        ),
      ),
    );
  }
  Widget _buildTextField(Map<String, dynamic> textFieldData) {
    TextEditingController controller;

    switch (textFieldData['label']) {
      case 'Prénom':
        controller = _prenomController;
        break;
      case 'Nom':
        controller = _nomController;
        break;
      case 'Email':
        controller = _emailController;
        break;
      case 'Password':
        controller = _passwordController;
        break;

      default:
        controller =
            TextEditingController(); // Un contrôleur par défaut si jamais
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: AppTheme.grisTextField,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5.0,
            spreadRadius: 1.0,
            offset: Offset(0, 2.0),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: textFieldData['hint'],
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          hintStyle: TextStyle(color: AppTheme.secondaryColor),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.grisTextField),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.grisTextField),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.grisTextField),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderButton(
      String label, String iconPath, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 70.h, // Réduit la hauteur
          width: 70.w, // Réduit la largeur
          decoration: BoxDecoration(
            color:
                isSelected ? Colors.green.withOpacity(0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r), // Réduit le rayon du bord
            border: Border.all(color: isSelected ? Colors.green : Colors.grey),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(4.w), // Réduit le padding
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.green : Colors.transparent,
                    borderRadius:
                        BorderRadius.circular(6.r), // Réduit le rayon du bord
                  ),
                  child: Image.asset(
                    iconPath,
                    width: 24.w, // Ajuste la largeur de l'image
                    height: 24.h, // Ajuste la hauteur de l'image
                  ),
                ),
                SizedBox(width: 8.w),
                // Réduit l'espace entre l'image et le texte
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14.sp, // Ajuste la taille du texte
                    color: isSelected ? Colors.green : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateField(String label, String initialValue) {
    final TextEditingController controller = _dateControllers[label]!;

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.grisTextField, // Couleur de fond
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: Offset(0, 2.0),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            hintStyle: TextStyle(color: AppTheme.secondaryColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide:
                  BorderSide(color: Colors.blue, width: 1.0), // Bordure bleue
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide:
                  BorderSide(color: Colors.blue, width: 1.0), // Bordure bleue
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0), // Bordure bleue plus épaisse quand actif
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(double size, Color color, String imagePath) {
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
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: size * 0.1),
                  child: Image.asset(
                    imagePath,
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
                  color: color,
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

  Widget _buildSpecializationCard(String text) {
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

  Widget _buildCardSociete(
      String title, double size, Color color, String imagePath) {
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
                    offset: const Offset(0, 10.0),
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
                  color: color,
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
        SizedBox(height: 8.h),
        Text(
          title,
          style: TextStyle(
            fontSize: size * 0.14,
            color: color,
          ),
        ),
      ],
    );
  }
}
