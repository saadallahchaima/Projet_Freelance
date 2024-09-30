import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedma/theme/AppTheme.dart';
import '../../screens/MainPages/RequestsPage.dart';
import '../Card/ServiceCard.dart';

class CustomSwitchDemandes extends StatefulWidget {
  final List<String> buttonLabels;

  CustomSwitchDemandes({Key? key, required this.buttonLabels}) : super(key: key);

  @override
  State<CustomSwitchDemandes> createState() => _CustomSwitchDemandesState();
}

class _CustomSwitchDemandesState extends State<CustomSwitchDemandes> {
  List<bool> isSelected = [true, false];
  int selectedIndex = 0;

  final List<ServiceCardData> items = [
    ServiceCardData(
      imageUrl: 'https://media.istockphoto.com/id/1365606525/fr/photo/photo-dun-seau-de-produits-de-nettoyage.jpg?s=612x612&w=0&k=20&c=hQ_I0Bhl9DiPDvJTrYFrLTVl_GbNMWrFW8XNY9Yh_XE=',
      offers: 2,
      date: 'Vendredi 30 décembre 2022 de 12:30 à 13:30',
      profileImages: [
        'assets/images/user1.png',
        'assets/images/user1.png',
      ],
      title: 'Ménage à domicile',
    ),
    ServiceCardData(
      imageUrl: 'https://media.istockphoto.com/id/1365606525/fr/photo/photo-dun-seau-de-produits-de-nettoyage.jpg?s=612x612&w=0&k=20&c=hQ_I0Bhl9DiPDvJTrYFrLTVl_GbNMWrFW8XNY9Yh_XE=',
      offers: 2,
      date: 'Vendredi 30 décembre 2022 de 12:30 à 13:30',
      profileImages: [
        'assets/images/user1.png',
        'assets/images/user1.png',
      ],
      title: 'Ménage à domicile',
    ),
    ServiceCardData(
      imageUrl: 'https://media.istockphoto.com/id/1365606525/fr/photo/photo-dun-seau-de-produits-de-nettoyage.jpg?s=612x612&w=0&k=20&c=hQ_I0Bhl9DiPDvJTrYFrLTVl_GbNMWrFW8XNY9Yh_XE=',
      offers: 2,
      date: 'Vendredi 30 décembre 2022 de 12:30 à 13:30',
      profileImages: [
        'assets/images/user1.png',
        'assets/images/user1.png',
      ],
      title: 'Ménage à domicile',
    ),
    // Ajoutez d'autres éléments ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
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
                  fillColor: AppTheme.primaryColor,
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
                      for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                        isSelected[buttonIndex] = (buttonIndex == index);
                      }
                      selectedIndex = index; // Met à jour l'index sélectionné
                    });
                  },
                  isSelected: isSelected,
                ),
              ),
            ),
            SizedBox(height: 16.0.h), // Espacement entre les widgets
            Expanded(
              child: ListView.separated(
                itemCount: items.length,
                separatorBuilder: (context, index) => SizedBox(height: 16.0.h), // Espacement entre les éléments
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      color: Colors.blue,
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor,
                              borderRadius: BorderRadius.circular(9.0),
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.primaryColor,
                                  blurRadius: 24,
                                  offset: Offset(0, 8),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: ServiceCard(
                                    imageUrl: items[selectedIndex].imageUrl,
                                    title: items[selectedIndex].title,
                                    date: items[selectedIndex].date,
                                    profileImages: items[selectedIndex].profileImages,
                                    offers: items[selectedIndex].offers,
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                _buildButtons(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                  Group();


                },

              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Aligne les boutons au centre
      children: [
        _buildButton(
          text: "Terminer",
          bgColor: AppTheme.primaryColor,
          textColor: Colors.white,
          borderColor: Colors.white,
          onPressed: () {
            print("Delete button pressed");
          },
          hasIcon: false,
        ),
        SizedBox(width: 16.0.w), // Espacement fixe entre les boutons
        _buildButton(
          text: "Modifier",
          bgColor: Colors.white,
          textColor: AppTheme.primaryColor,
          borderColor: Colors.white,
          onPressed: () {
            print("Edit button pressed");
          },
          hasIcon: true,
        ),
      ],
    );
  }

  Widget _buildButton({
    required String text,
    required Color bgColor,
    required Color textColor,
    required Color borderColor,
    required VoidCallback onPressed,
    bool hasIcon = false,
  }) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(bgColor),
        side: MaterialStateProperty.all<BorderSide>(BorderSide(
          color: borderColor,
          width: 2.0,
          style: BorderStyle.solid,
        )),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Container(
        width: 100.75.w,
        height: 20.87.h,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (hasIcon)
              Image.asset("assets/images/edit.png", width: 16.sp, height: 16.sp),
            if (hasIcon) SizedBox(width: 8.w),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCardData {
  final String imageUrl;
  final int offers;
  final String date;
  final List<String> profileImages;
  final String title;

  ServiceCardData({
    required this.imageUrl,
    required this.offers,
    required this.date,
    required this.profileImages,
    required this.title,
  });
}
