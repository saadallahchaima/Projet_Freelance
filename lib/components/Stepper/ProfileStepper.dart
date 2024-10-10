
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedma/Services/UserService.dart';
import 'package:khedma/components/Stepper/stepperComplet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Services/SharedPrefService.dart';
import '../../entities/User.dart';
import '../../screens/MainPages/HomePage.dart';


import '../../screens/SignUp/form_experience.dart';
import '../../screens/SignUp/form_societe.dart';
import '../../screens/SignUp/form_Societe2.dart';
import '../../screens/SignUp/formDiplome.dart';
import '../../screens/SignUp/societe_exper.dart';

import '../../screens/SignUp/Donne_profile.dart';
import '../../screens/SignUp/DonneeAdresse.dart';
import '../../screens/SignUp/Complete_Pro_Expert.dart';
import '../../screens/SignUp/Complete_profile.dart';
import '../../screens/SignUp/Diplome.dart';


import '../../theme/AppTheme.dart';
import 'package:http/http.dart' as http;

class ProfileStepper extends StatefulWidget {
  const ProfileStepper({super.key});

  @override
  ProfileStepperState createState() => ProfileStepperState();
}


class ProfileStepperState extends State<ProfileStepper> {
  int currentStep = 0;
  int totalSteps = 4;
  late UserService us ;
  late SharedPrefService sharedPrefService;
  String role = "USER";


  @override
  void initState() {
    super.initState();
    us = UserService();
    sharedPrefService = SharedPrefService();
  }

  @override
  void dispose() {
    super.dispose();
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
                        value: currentStep / totalSteps,
                        backgroundColor: Colors.grey[200],
                        valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.blue),
                        minHeight: 4.h,
                      ),
                    ),
                    CircleAvatar(
                      radius: 15.r,
                      backgroundColor:
                      currentStep >= totalSteps ? Colors.green : Colors.grey[200],
                      child: Icon(
                        Icons.check_circle_outline_outlined,
                        color:
                        currentStep >= totalSteps ? Colors.white : Colors.grey[600],
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
                  _getPageForStep(currentStep)
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Center(
                // buttons continuer, ignorer
                child: _buildButtonsForStep(currentStep),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _getPageForStep(int step) {
    if(step == 0) {
      return DonneeProfile();
    }
    if(role == "amateur certifié") {
      switch (step) {
        case 1:
          return CompleteProfile();
        case 2:
          //return CompleteProfile();
          return formDiplome();
        case 3:
          return FormExperience();
        case 4:
          return Steppercomplet();
        default:
          return const Center(child: Text('Étape inconnue'));
      }
    } else {
      switch (step) {
        case 1:
          return CompleteProfileProExpert();
        case 2:
          return formDiplome();
        case 3:
          return FormExperience();
        case 4:
          //return CompleteProfileProExpert();
          return FormSociete();
        case 5:
         // return CompleteProfileProExpert();
          return FormSociete2();
        case 6:
          return Steppercomplet();

        default:
          return const Center(child: Text('Étape inconnue'));
      }
    }
  }


  Widget _buildButtonsForStep(int step) {
    if(step==0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  sharedPrefService.readUserData('role').then((value) {
                    role = value;
                    if(role == "amateur certifié") {
                      totalSteps = 4;
                    } else {
                      totalSteps = 6;
                    }
                    currentStep++;
                  });
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
                  sharedPrefService.saveUserData('role', role);
                  // go home
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
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
                'Je suis un client',
                style: TextStyle(
                  fontSize: 0.034.sw,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    }
   /* if (step == 7 || step == 8 || step == 9) {
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
    }*/
   if (step == totalSteps) {
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
                'Continue Home',
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
                  sharedPrefService.checkAllValues();
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

  void SaveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String day = prefs.getString('day') ?? '';
    String month = prefs.getString('month') ?? '';
    String year = prefs.getString('year') ?? '';
    DateTime dob = DateTime(int.parse(year), int.parse(month), int.parse(day));
    User user = User(
        firstName: prefs.getString('firstName') ?? '',
        lastName: prefs.getString('lastName') ?? '',
        email: prefs.getString('email') ?? '',
        password: prefs.getString('password') ?? '',
        numTel: prefs.getString('numTel') ?? '',
        userName: prefs.getString('userName') ?? '',
        dateNaissance: dob
    );
    us.saveUser(user);
  }


}
