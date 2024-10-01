import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../screens/MainPages/HomePage.dart';
import '../Buttons/MyButtons.dart';
import '../Buttons/_buildGenderButton.dart';
import '../Card/_buildCard.dart';
import '../Card/_buildCardSociete.dart';
import '../Card/_buildSpecializationCard.dart';
import '../CustomInput.dart';
import '../Dots/_buildDotsIndicator.dart';
import '../_buildDateField.dart';
import '../_buildTextField.dart';
import '../../screens/SignUp/verifMail.dart';
import '../../screens/SignUp/verificationTel.dart';
import '../../theme/AppTheme.dart';

class CustomStepper extends StatefulWidget {
  @override
  _CustomStepperState createState() => _CustomStepperState();
}

String _selectedGender = 'Male';
// Controllers for form fields
final TextEditingController _prenomController = TextEditingController();
final TextEditingController _nomController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _adresseController = TextEditingController();
final TextEditingController _villeController = TextEditingController();
final TextEditingController _postalCodeController = TextEditingController();
final TextEditingController _paysController = TextEditingController();
final TextEditingController _numTel = TextEditingController();
final TextEditingController _nomSociete = TextEditingController();
final TextEditingController _titreExperience = TextEditingController();
final TextEditingController _nomSocietePrecedente = TextEditingController();
final TextEditingController _descriptionExperience = TextEditingController();
final TextEditingController _prix = TextEditingController();
final TextEditingController _domaineActivite = TextEditingController();
final TextEditingController _nbSalarie = TextEditingController();
final TextEditingController _descriptionProfile = TextEditingController();
final TextEditingController _specialite = TextEditingController();
final TextEditingController _specialiteDiplome = TextEditingController();
final TextEditingController _ancienClient = TextEditingController();
String _selectedDropdownValue = 'Heure'; // Default value
String _day = '23'; // Default value
String _month = '11'; // Default value
String _year = '2000'; // Default value
String selectedProfile = '';
String selectedCountryFlag = '🇺🇸'; // Default country flag (USA)
String selectedCountryCode = '+1'; // Default country code
class _CustomStepperState extends State<CustomStepper> {
  int currentStep = 0;

  @override
  void initState() {
    super.initState();
    // Optionally load existing user data
    _loadDataFromPreferences();
  }

  @override
  void dispose() {
    /*  _Prix.dispose(); // Clean up the controller when the widget is disposed
    _prenomController.dispose();
    _nomController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _AdresseController.dispose();
    _VilleController.dispose();
    _postalCodeController.dispose();
    _PaysController.dispose();
    _NumTel.dispose();
    _NomSociete.dispose();
    _TitreExperience.dispose();
    _NomSocietePrecedente.dispose();
    _DescriptionExperience.dispose();
    _DomaineActivite.dispose();
    _Ancienlient.dispose();
    _NbSalarie.dispose();
*/
    super.dispose();
  }

  // Load data from SharedPreferences
  _loadDataFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _prenomController.text = prefs.getString('prenom') ?? '';
      _nomController.text = prefs.getString('nom') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
      _numTel.text = prefs.getString('NumTel') ?? '';
      _adresseController.text = prefs.getString('adresse') ?? '';
      _paysController.text = prefs.getString('Pays') ?? '';
      _villeController.text = prefs.getString('ville') ?? '';
      double savedPrix = prefs.getDouble('Prix') ?? 0.0; // Load as double
      _prix.text = savedPrix.toString(); // Set the text of the controller
      _postalCodeController.text = prefs.getString('codePostal') ?? '';
      _selectedGender = prefs.getString('selectedGender') ?? '';
      _day = prefs.getString('day') ?? '23';
      _month = prefs.getString('month') ?? '11';
      _year = prefs.getString('year') ?? '2000';
      selectedProfile = prefs.getString('selectedProfile') ?? ''; // Load selectedProfile
      _selectedDropdownValue = prefs.getString('dropdownValue') ?? 'Heure';
      _descriptionProfile.text = prefs.getString('descriptionProfile') ?? '';
      _specialite.text = prefs.getString('Specialite') ?? '';
      _specialiteDiplome.text = prefs.getString('SpecialiteDiplome') ?? '';
      _ancienClient.text = prefs.getString('AncientClient') ?? '';
      _nomSociete.text = prefs.getString('NomSociete') ?? '';
      _titreExperience.text = prefs.getString('TitreExp') ?? '';
      _nomSocietePrecedente.text = prefs.getString('SocietePrecedente') ?? '';
      _domaineActivite.text = prefs.getString('DomainActivite') ?? '';
    });
  }

  _saveDataToPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save data to SharedPreferences
    await prefs.setString('prenom', _prenomController.text);
    await prefs.setString('nom', _nomController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('password', _passwordController.text);
    await prefs.setString('adresse', _adresseController.text);
    await prefs.setString('Pays', _paysController.text);
    await prefs.setString('ville', _villeController.text);
    await prefs.setString('descriptionProfile', _descriptionProfile.text);
    await prefs.setString('Specialite', _specialite.text);
    await prefs.setString('SpecialiteDiplome', _specialiteDiplome.text);
    await prefs.setString('TitreExp', _titreExperience.text);
    await prefs.setString('codePostal', _postalCodeController.text);
    await prefs.setString('NumTel', _numTel.text);
    // Ensure the gender variable is defined in your widget
    await prefs.setString('selectedGender', _selectedGender);
    await prefs.setString('selectedProfile', selectedProfile);
    // Convert Prix to double for saving
    double prixValue = double.tryParse(_prix.text) ?? 0.0; // Convert to double
    await prefs.setDouble('Prix', prixValue); // Save as double
    await prefs.setString('NomSociete', _nomSociete.text); // Save as double
    await prefs.setString('dropdownValue', _selectedDropdownValue);
    await prefs.setString('AncientClient', _ancienClient.text);
    await prefs.setString('SocietePrecedente', _nomSocietePrecedente.text);
    await prefs.setString('DomainActivite', _domaineActivite.text);

    String? day = prefs.getString('day');
    String? month = prefs.getString('month');
    String? year = prefs.getString('year');
    // Verify if the data is saved
    String? savedPrenom = prefs.getString('prenom');
    String? savedNom = prefs.getString('nom');
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');
    String? savedAdresse = prefs.getString('adresse');
    String? savedPays = prefs.getString('Pays');
    String? savedVille = prefs.getString('ville');
    String? savedCodePostal = prefs.getString('codePostal');
    String? savedNumTel = prefs.getString('NumTel');
    String? savedGender = prefs.getString('selectedGender'); // Add gender verification
    String? savedDescriptionProfile = prefs.getString('descriptionProfile');
    String? savedSpecialite = prefs.getString('Specialite');
    String? savedSpecialiteDiplome = prefs.getString('SpecialiteDiplome');
    String? savedAncientClient = prefs.getString('AncientClient');
    String? savedTitreExp = prefs.getString('TitreExp');
    String? savedNomSociete = prefs.getString('NomSociete');
    String? savedSocietePrecedente = prefs.getString('SocietePrecedente');
    String? savedDomainActivite = prefs.getString('DomainActivite');

    // Print to console for verification
    print("Saved Data: ");
    print("Prénom: $savedPrenom");
    print("Nom: $savedNom");
    print("Email: $savedEmail");
    print("Mot de passe: $savedPassword");
    print("Adresse: $savedAdresse");
    print("Pays: $savedPays");
    print("Ville: $savedVille");
    print("Code Postal: $savedCodePostal");
    print("Numéro de Téléphone: $savedNumTel");
    print("Genre: $savedGender"); // Print saved gender
    print('Day: $day, Month: $month, Year: $year');
    print("Saved selectedProfile: $selectedProfile");
    print("Saved Prix: $prixValue");
    print("Prix Saved Par: $_selectedDropdownValue");
    print("DescriptionProdile Saved : $savedDescriptionProfile");
    print("Specialite Saved : $savedSpecialite");
    print("SpecialiteDiplome Saved : $savedSpecialiteDiplome");

    print("TitreExp Saved : $savedTitreExp");
    print("AncientClient Saved : $savedAncientClient");
    print("savedNomSociete Saved : $savedNomSociete");
    print("savedSocietePrecedente Saved : $savedSocietePrecedente");
    print("savedDomainActivite Saved : $savedDomainActivite");
  }

  void _onGenderSelected(String gender) {
    setState(() {
      _selectedGender = gender; // Update the selected gender
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
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
                ///////////houuni
                alignment: Alignment.topCenter,
                children: [
                  _getPageForStep(currentStep),
                  if (_hasDotsForStep(currentStep))
                    buildDotsIndicator(currentStep),
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
                              _PaysController.text=country.name;
                              _paysController.text = country.name;
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
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomInput(
                        controller: _paysController,
                        // ou n'importe quel contrôleur
                        hint: 'Pays',
                        // ou le texte d'indication souhaité
                        onChanged: (value) {
                          // Action à faire lorsque le texte change
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                CustomInput(
                  controller: _villeController, // ou n'importe quel contrôleur
                  hint: 'Ville', // ou le texte d'indication souhaité
                  onChanged: (value) {
                    // Action à faire lorsque le texte change
                  },
                ),
                SizedBox(height: 30.h),
                CustomInput(
                  controller: _adresseController,
                  // ou n'importe quel contrôleur
                  hint: 'Adresse',
                  // ou le texte d'indication souhaité
                  onChanged: (value) {
                    // Action à faire lorsque le texte change
                  },
                ),
                SizedBox(height: 30.h),
                CustomInput(
                  controller: _postalCodeController,
                  // ou n'importe quel contrôleur
                  hint: 'Code Postal',
                  // ou le texte d'indication souhaité
                  onChanged: (value) {
                    // Action à faire lorsque le texte change
                  },
                ),
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
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomInput(
                        controller: _numTel, // ou n'importe quel contrôleur
                        hint: 'Tel', // ou le texte d'indication souhaité
                        onChanged: (value) {
                          // Action à faire lorsque le texte change
                        },
                      ),
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
                Column(
                  children: [
                    buildTextField(
                      textFieldData: {
                        'label': 'Prénom',
                        'hint': 'Entrez votre prénom'
                      },
                      controller: _prenomController,
                    ),
                    SizedBox(height: 30.h),
                    buildTextField(
                      textFieldData: {
                        'label': 'Nom',
                        'hint': 'Entrez votre nom'
                      },
                      controller: _nomController,
                    ),
                    SizedBox(height: 30.h),
                    buildTextField(
                      textFieldData: {
                        'label': 'Email',
                        'hint': 'Entrez votre email'
                      },
                      controller: _emailController,
                    ),
                    SizedBox(height: 30.h),
                    buildTextField(
                      textFieldData: {
                        'label': 'Password',
                        'hint': 'Entrez votre mot de passe'
                      },
                      controller: _passwordController,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  'Genre',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildGenderButton(
                      'Homme',
                      Icons.man,
                      _selectedGender == 'Homme',
                      () =>
                          _onGenderSelected('Homme'), // Update selection on tap
                    ),
                    SizedBox(width: 10.w),
                    buildGenderButton(
                      'Femme',
                      Icons.woman,
                      _selectedGender == 'Femme',
                      () =>
                          _onGenderSelected('Femme'), // Update selection on tap
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  'Date de Naissance',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildDateField('Jour', '23', 'day'),
                    // Pass 'day' as the prefKey
                    SizedBox(width: 10.h),
                    buildDateField('Mois', '11', 'month'),
                    // Pass 'month' as the prefKey
                    SizedBox(width: 10.h),
                    buildDateField('Année', '2000', 'year'),
                    // Pass 'year' as the prefKey
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
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 13, 26, 50.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(4.5, 0, 0, 88.9),
                        child: const SizedBox(
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
                        margin: const EdgeInsets.fromLTRB(5.2, 0, 0, 10.6),
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
                        margin: const EdgeInsets.fromLTRB(5.2, 0, 0, 22.4),
                        child: Text(
                          'Nous souhaitons mieux vous connaître afin de finaliser votre profile.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: const Color(0xFFA7A6A5),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(1.2, 0, 0, 26.2),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(1.8, 0, 0, 14.3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color(0xFFFFFFFF),
                                      boxShadow: [
                                        const BoxShadow(
                                          color: Color(0x11124565),
                                          offset: Offset(0, 12),
                                          blurRadius: 7.5,
                                        ),
                                      ],
                                    ),
                                    child: SizedBox(
                                      width: 92,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 26.3, 0, 26.2),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
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
                                      color: const Color(0xFF0099D5),
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
                        margin: const EdgeInsets.fromLTRB(1, 0, 0, 25),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF064BA6)),
                          borderRadius: BorderRadius.circular(11),
                          color: const Color(0xFFFFFFFF),
                        ),
                        child: SizedBox(
                          width: 208,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 6, 1.2, 5),
                            child: Center(
                              child: Text(
                                'Développez votre profile',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.9,
                                  color: const Color(0xFF064BA6),
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
                                color: const Color(0xFFD9D9D9),
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
                            const SizedBox(height: 8),
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
                                color: const Color(0xFFD9D9D9),
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
                            const SizedBox(height: 8),
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
                                color: const Color(0xFFD9D9D9),
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
                            const SizedBox(height: 8),
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
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(34, 123, 34, 55.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.6),
                    child: Text(
                      'Complétez votre profile',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.3,
                        height: 1.4,
                        color: const Color(0xFF1C1F1E),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 17.4),
                    child: Text(
                      'Nous souhaitons mieux vous connaître afin de finaliser votre profile.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xFFA7A6A5),
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),
                  CustomInput(
                    controller: _specialite,
                    hint: 'Spécialisé en',
                    onChanged: (value) {
                      print('Spécialisé: $value');
                    },
                  ),
                  SizedBox(height: 10.h),

                  /////dataset//////
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    child: SizedBox(
                      width: 264,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildSpecializationCard('Design'),
                          const SizedBox(width: 12), // Adjust spacing between cards
                          buildSpecializationCard('Web Dev'),
                        ],
                      ),
                    ),
                  ),
                  ////////
                  SizedBox(height: 10.h),
                  CustomInput(
                    controller: _descriptionProfile,
                    hint: 'Déscription',
                    onChanged: (value) {
                      print('Descriptiin: $value');
                    },
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    margin: const EdgeInsets.fromLTRB(5.2, 0, 0, 17),
                    child: Text(
                      'Proposez votre tarif par l’unité qui vous convient.',
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xFFA7A6A5),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 30.8),
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
                                color: const Color(0xFF000000),
                              ),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: 60, // Minimum width for the text field
                              child: TextFormField(
                                controller: _prix,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color(0xFF0099D5),
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 12,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 30),
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
                                  color: const Color(0xFF000000),
                                ),
                              ),
                              const SizedBox(height: 5),
                              DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: Color(0xFF0099D5),
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 12,
                                    ),
                                  ),
                                  value: _selectedDropdownValue,
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
                                    _selectedDropdownValue = newValue!;
                                    _saveDataToPreferences();
                                    // Save the new value to SharedPreferences                                },
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 30.1),
                    child: Text(
                      'Ajoutez vos projets',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.9,
                        color: const Color(0xFF1C1F1E),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildCard(0.27.sw, AppTheme.primaryColor,
                          'assets/icons/image.png'),
                      SizedBox(width: 10.h),
                      buildCard(0.27.sw, AppTheme.primaryColor,
                          'assets/icons/image.png'),
                      SizedBox(width: 10.h),
                      buildCard(0.27.sw, AppTheme.primaryColor,
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
        //  return Diplomescreen();
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
                // Ajustez cette valeur pour réduire l'espace

                Center(
                  child: Container(
                    width: 0.8.sw,
                    child: Text(
                      'Avez vous un diplôme ?',
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
                      'Nous souhaitons mieux vous connaître afin de finaliser votre profile.',
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
                SizedBox(height: 50.h),
                Text(
                  'Diplome',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCard(0.27.sw, AppTheme.primaryColor,
                        'assets/icons/img_6.png'),
                  ],
                ),
                SizedBox(height: 50.h),
                Text(
                  'Formations',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCard(0.27.sw, AppTheme.primaryColor,
                        'assets/icons/img_6.png'),
                    SizedBox(width: 10.h),
                    buildCard(0.27.sw, AppTheme.primaryColor,
                        'assets/icons/img_6.png'),
                    SizedBox(width: 10.h),
                    buildCard(0.27.sw, AppTheme.primaryColor,
                        'assets/icons/img_6.png'),
                  ],
                ),
              ],
            ),
          ),
        );
      case 8:
        // return SocieteExper();
        //return FormSociete2();
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),

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
                      'Nous souhaitons mieux vous connaître afin de finaliser votre profile.',
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

                CustomInput(
                  controller: _titreExperience,
                  hint: 'Titre',
                  onChanged: (value) {
                    print('Titre: $value');
                  },
                ),
                SizedBox(height: 10.h),
                CustomInput(
                  controller: _nomSociete,
                  hint: 'Nom de société',
                  onChanged: (value) {
                    print('Nom de société: $value');
                  },
                ),
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

                // Ajouter les champs de date ici
                Row(
                  children: [
                    buildDateField('Jour', '23', 'day'),
                    // Ensure 'Day' is a key in _dateControllers
                    SizedBox(width: 10.w),
                    buildDateField('Mois', '11', 'Month'),
                    // Ensure 'Day' is a key in _dateControllers
                    SizedBox(width: 10.w),
                    buildDateField('Année', '2000', 'Year'),
                    // Ensure 'Day' is a key in _dateControllers
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
                    buildDateField('Jour', '23', 'day'),
                    // Ensure 'Day' is a key in _dateControllers
                    SizedBox(width: 10.w),
                    buildDateField('Mois', '11', 'Month'),
                    // Ensure 'Month' is a key in _dateControllers
                    SizedBox(width: 10.w),
                    buildDateField('Année', '2000', 'Year'),
                    // Ensure 'Year' is a key in _dateControllers
                  ],
                ),

                SizedBox(height: 30.h),
                CustomInput(
                  controller: _nomSociete,
                  hint: 'Déscription',
                  onChanged: (value) {
                    print('Description: $value');
                  },
                ),
              ],
            ),
          ),
        );
      case 9:
        //  return CompleteProfileProExpert();
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(34, 123, 34, 55.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.6),
                    child: Center(
                      child: Text(
                        'Complétez votre profile',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 22.3,
                          height: 1.4,
                          color: const Color.fromARGB(255, 2, 2, 2),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 17.4),
                    child: Text(
                      'Nous souhaitons mieux vous connaître afin de finaliser votre profile.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: const Color(0xFFA7A6A5),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomInput(
                    controller: _specialiteDiplome,
                    hint: 'Spécialisé en',
                    onChanged: (value) {
                      print('Spécialisé: $value');
                    },
                  ),
                  SizedBox(height: 20.h),

                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    child: SizedBox(
                      width: 264,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildSpecializationCard('Design'),
                          const SizedBox(width: 12),
                          buildSpecializationCard('Web Dev'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Diplome',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 40.w),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              buildCard(0.27.sw, AppTheme.primaryColor,
                                  'assets/icons/image.png'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.h),
                  // Updated Container for Formations
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Formations',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  buildCard(0.27.sw, AppTheme.primaryColor,
                                      'assets/icons/image.png'),
                                  SizedBox(width: 10.h),
                                  buildCard(0.27.sw, AppTheme.primaryColor,
                                      'assets/icons/image.png'),
                                  SizedBox(width: 10.h),
                                  buildCard(0.27.sw, AppTheme.primaryColor,
                                      'assets/icons/image.png'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      case 10:
        // return formDiplome();
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
                      'Avez vous un diplôme ?',
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
                      'Nous souhaitons mieux vous connaître afin de finaliser votre profile.',
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
                SizedBox(height: 50.h),
                Text(
                  'Diplome',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCard(0.27.sw, AppTheme.primaryColor,
                        'assets/icons/img_6.png'),
                  ],
                ),
                SizedBox(height: 50.h),
                Text(
                  'Formations',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCard(0.27.sw, AppTheme.primaryColor,
                        'assets/icons/img_6.png'),
                    SizedBox(width: 10.h),
                    buildCard(0.27.sw, AppTheme.primaryColor,
                        'assets/icons/img_6.png'),
                    SizedBox(width: 10.h),
                    buildCard(0.27.sw, AppTheme.primaryColor,
                        'assets/icons/img_6.png'),
                  ],
                ),
              ],
            ),
          ),
        );
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
                CustomInput(
                  controller: _titreExperience,
                  hint: 'Titre',
                  onChanged: (value) {
                    print('Titre: $value');
                  },
                ),
                SizedBox(height: 10.h),

                CustomInput(
                  controller: _nomSocietePrecedente,
                  hint: 'Nom de société précédente:',
                  onChanged: (value) {
                    print('Ancienne Societe: $value');
                  },
                ),
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
                    buildDateField('Jour', '23', 'day'),
                    // Pass 'day' as the prefKey
                    SizedBox(width: 10.h),
                    buildDateField('Mois', '11', 'month'),
                    // Pass 'month' as the prefKey
                    SizedBox(width: 10.h),
                    buildDateField('Année', '2000', 'year'),
                    // Pass 'year' as the prefKey
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
                    buildDateField('Jour', '23', 'day'),
                    // Pass 'day' as the prefKey
                    SizedBox(width: 10.h),
                    buildDateField('Mois', '11', 'month'),
                    // Pass 'month' as the prefKey
                    SizedBox(width: 10.h),
                    buildDateField('Année', '2000', 'year'),
                    // Pass 'year' as the prefKey
                  ],
                ),

                SizedBox(height: 30.h),
                CustomInput(
                  controller: _descriptionExperience,
                  hint: 'Déscription',
                  onChanged: (value) {
                    print('Description: $value');
                  },
                ),
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
                CustomInput(
                  controller: _nomSociete,
                  hint: 'Nom de la Société',
                  onChanged: (value) {
                    print('Mot de passe: $value');
                  },
                ),
                SizedBox(height: 10.h),
                CustomInput(
                  controller: _domaineActivite,
                  hint: 'Domaine d’activité:',
                  onChanged: (value) {
                    print('Mot de passe: $value');
                  },
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CustomButton(
                      text: 'Communication',
                      color: const Color(0xFFFFFFFF),
                      onPressed: () {},
                      borderColor: const Color(0xFF064BA6),
                      textColor: const Color(0xFF064BA6),
                      textStyle: TextStyle(
                        color: const Color(0xFF064BA6),
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
                    buildCardSociete('K.BIS', 0.27.sw, AppTheme.primaryColor,
                        'assets/icons/img_6.png'),
                    SizedBox(width: 16.h),
                    buildCardSociete('Label de qualité', 0.27.sw,
                        AppTheme.primaryColor, 'assets/icons/img_6.png'),
                    SizedBox(width: 16.h),
                    buildCardSociete('Assurance ', 0.27.sw,
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
        //return FormSociete2();
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
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
                      'Vos justificatifs professionnels',
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
                CustomInput(
                  controller: _ancienClient, // ou n'importe quel contrôleur
                  hint: 'Ancient clients:', // ou le texte d'indication souhaité
                  onChanged: (value) {
                    // Action à faire lorsque le texte change
                  },
                ),
                SizedBox(height: 10.h),
                CustomInput(
                  controller: _nbSalarie,
                  // ou n'importe quel contrôleur
                  hint: 'Nombre de salariés:',
                  // ou le texte d'indication souhaité
                  onChanged: (value) {
                    // Action à faire lorsque le texte change
                  },
                ),
              ],
            ),
          ),
        );
      case 14:
        // return Steppercomplet();
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
                SizedBox(height: 80.h),
                Center(
                  child: Image.asset(
                    "assets/icons/img_3.png",
                    width: 100.w,
                    height: 100.h,
                  ),
                ),
                SizedBox(height: 70.h),
                Center(
                  child: Container(
                    width: 0.7.sw,
                    child: Text(
                      'Votre comte RentMe est créé avec succés !',
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
                      'Vous pouvez procéder à l’application.'
                      'Nous vous souhaitons une bonne experience.',
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
              ],
            ),
          ),
        );
        //break;

      default:
        return const Center(child: Text('Étape inconnue'));
    }
  }

  bool _hasDotsForStep(int step) {
    return step == 7 || step == 8;
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
                _saveDataToPreferences();
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
                _saveDataToPreferences();
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
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
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
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Center(
          child: Container(
            width: 0.4.sw,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  currentStep++;
                });
                _saveDataToPreferences();
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
}
