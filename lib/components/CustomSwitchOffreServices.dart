import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'RentalCardDisponibleOffre.dart';

class CustomSwitchOffreServices extends StatefulWidget {
  final List<String> buttonLabels;

  const CustomSwitchOffreServices({Key? key, required this.buttonLabels}) : super(key: key);

  @override
  State<CustomSwitchOffreServices> createState() => _CustomSwitchOffreServicesState();
}

class _CustomSwitchOffreServicesState extends State<CustomSwitchOffreServices> {
  List<bool> isSelected = [true, false];

  final List<OffreItem> items = [
    OffreItem(
      'Vendredi 30 décembre 2022 de 12:30 à 13:30',
      true,
      20,
      true,
      imageUrl: 'assets/images/menage.jpeg',
      title: 'Ménage à domicile',
      location: '4 Rue de l''Abbé Groult, 750515 Paris',
      ownerName: 'Jessica virgolini',
    ),
    OffreItem(
      'Vendredi 30 décembre 2022 de 12:30 à 13:30',
      true,
      40.0,
      false,
      imageUrl: 'assets/images/menage.jpeg',
      title: 'Ménage à domicile',
      location: '4 Rue de l''Abbé Groult, 750515 Paris',
      ownerName: 'Jessica virgolini',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
            fillColor: const Color(0xFF0099D6),
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
              });
            },
            isSelected: isSelected,
          ),
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: _buildContent(),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return isSelected[0] ? _buildDisponibleSection() : _buildTermineeSection();
  }

  Widget _buildDisponibleSection() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return RentalItemCardDisponibleOffre(
          imageUrl: items[index].imageUrl,
          title: items[index].title,
          date: items[index].date,
          evalue: items[index].evalue,
          budget: items[index].budget,
          location: items[index].location,
          ownerName: items[index].ownerName,
          statut: items[index].statut,

          onProposerOffrePressed: () {
            // Action pour proposer une offre
          },
          onRentPressed: () {
            // Action pour louer
          },
        );
      },
    );
  }

  Widget _buildTermineeSection() {
    return Container(
      child: Center(
        child: Text("Section terminée"),
      ),
    );
  }
}

class OffreItem {
  final String imageUrl;
  final String title;
  final String date;
  final bool evalue;
  final double budget;
  final String location;
  final String ownerName;
  final bool statut;

  OffreItem(this.date, this.evalue, this.budget, this.statut, {
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.ownerName,
  });
}
