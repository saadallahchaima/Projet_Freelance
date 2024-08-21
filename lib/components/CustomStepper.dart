import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:khedma/screens/SignUp/Complete_Pro_Expert.dart';
import 'package:khedma/screens/SignUp/Complete_profile.dart';
import 'package:khedma/screens/SignUp/Diplome.dart';
import 'package:khedma/screens/SignUp/Donne_profile.dart';
import 'package:khedma/screens/SignUp/societe_exper.dart';

import '../screens/MainPages/HomePage.dart';
import '../screens/SignUp/AjouterTel.dart';
import '../screens/SignUp/DoneePrincipale.dart';
import '../screens/SignUp/DonneeAdresse.dart';
import '../screens/SignUp/formDiplome.dart';
import '../screens/SignUp/form_Societe2.dart';
import '../screens/SignUp/form_experience.dart';
import '../screens/SignUp/form_societe.dart';
import '../screens/SignUp/stepperComplet.dart';
import '../screens/SignUp/verifMail.dart';
import '../screens/SignUp/verificationTel.dart';
import '../theme/AppTheme.dart';

class CustomStepper extends StatefulWidget {
  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int currentStep = 0;

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
                        value: currentStep / 11,
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        minHeight: 4.h,
                      ),
                    ),
                    CircleAvatar(
                      radius: 15.r,
                      backgroundColor: currentStep >= 11 ? Colors.green : Colors.grey[200],
                      child: Icon(
                        Icons.check_circle_outline_outlined,
                        color: currentStep >= 11 ? Colors.white : Colors.grey[600],
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
                  if (_hasDotsForStep(currentStep)) _buildDotsIndicator(currentStep),
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
        return SignUpScreen();
    //  return Donneeadresse();

      case 1:
        return VerificationMailPage();

      case 2:
        return Donneeadresse();
      case 3:
        return PhoneInput();

      case 4:
        return VerificationPage();

      case 5:
      return DonneeProfile();
        //return formDiplome();
      case 6:
       return CompleteProfile();
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
        return FormExperience();
      case 12:
      //  return Steppercomplet();
      return FormSociete();
      case 13:
      return FormSociete2();
      case 14:
      return  Steppercomplet();
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
    } else if (step == 14) {  // Case 14
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
