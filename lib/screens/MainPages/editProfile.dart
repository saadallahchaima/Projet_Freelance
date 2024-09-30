import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/AppTheme.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  int? selectedContainerIndex; // Index du conteneur sélectionné

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
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
                        'Sélectionner votre profil',
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
                        'Quel type de profile vous représente le mieux?',
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
                  SizedBox(height: 80.h),

                  // Liste des conteneurs
                  ...List.generate(3, (index) {
                    String imagePath;
                    if (index == 0) {
                                            imagePath = 'assets/icons/healthicons_factory-worker-outline.png'; 

                    } else if (index == 1) {
                                            imagePath = 'assets/icons/healthicons_city-worker-outline.png'; 

                    } else {
                      imagePath = 'assets/icons/healthicons_construction-worker-outline.png';
                    }

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedContainerIndex = index; // Mettre à jour l'index sélectionné
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(26.w, 0, 0, 0),
                        child: Container(
                          width: 0.8.sw, // Changez ici pour s'adapter à l'écran
                          height: 144.73.h,
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: selectedContainerIndex == index
                                ? Color(0xFFE0E0E0) // Couleur de fond si sélectionné
                                : Color(0xFFF4F6F5),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                imagePath,
                                width: 40.w,
                                height: 40.h,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 20.w), // Réduit l'espace pour éviter le dépassement
                              Expanded( // Utilisez Expanded pour permettre à la colonne de s'adapter
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      index == 0
                                          ? 'Je veux devenir un professionnel'
                                          : index == 1
                                              ? 'Je veux devenir un expert'
                                              : 'Je veux devenir un amateur certifié',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      maxLines: 2, // Maximum de lignes à afficher
                                      overflow: TextOverflow.visible, // Permet de revenir à la ligne
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      index == 0
                                          ? 'Je souhaite offrir mes services.'
                                          : index == 1
                                              ? 'Je souhaite offrir des services avancés.'
                                              : 'Je souhaite débuter ma carrière.',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xFFA7A6A5),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).map((container) {
                    return Column(
                      children: [
                        container,
                        SizedBox(height: 16.h), // Espace entre les conteneurs
                      ],
                    );
                  }).toList(),

                  SizedBox(height: 90.w),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
