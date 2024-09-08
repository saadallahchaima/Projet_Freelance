import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'CardOffre.dart';
import 'CardOffreEnCours.dart';

class CustomSwitchOffre extends StatefulWidget {
  final List<String> buttonLabels;

  const CustomSwitchOffre({Key? key, required this.buttonLabels}) : super(key: key);

  @override
  State<CustomSwitchOffre> createState() => _CustomSwitchOffreState();
}

class _CustomSwitchOffreState extends State<CustomSwitchOffre> {
  List<bool> isSelected = [true, false];
  final List<OffreItem> items = [
    OffreItem(
      imageUrl: 'https://example.com/image1.png',
      title: 'Ménage à domicile',
      dateDebut: DateTime.now(),
      dateFin: DateTime.now(),
      Budget: '30€-40€',
      location: '4 Rue de l\'Abbé Groult, 75015 Paris',
      ownerName: 'Jessica Virgolini',
      paiement: '35€',
    ),
    OffreItem(
      imageUrl: 'https://example.com/image1.png',
      title: 'Ménage à domicile',
      dateDebut: DateTime.now(),
      dateFin: DateTime.now(),
      Budget: '30€-40€',
      location: '4 Rue de l\'Abbé Groult, 75015 Paris',
      ownerName: 'Jessica Virgolini',
      paiement: '35€',
    ),
    OffreItem(
      imageUrl: 'https://example.com/image1.png',
      title: 'Ménage à domicile',
      dateDebut: DateTime.now(),
      dateFin: DateTime.now(),
      Budget: '30€-40€',
      location: '4 Rue de l\'Abbé Groult, 75015 Paris',
      ownerName: 'Jessica Virgolini',
      paiement: '35€',
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
            fillColor: const Color(0xFF2DC4FF),
            selectedColor: Color(0xFFE7E6E6),
            color: Colors.white,
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
    return isSelected[0]
        ? _buildDomainSection()
        : _buildHistoriqueSection();
  }

  Widget _buildDomainSection() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return CardOffre(
          imageUrl: items[index].imageUrl,
          title: items[index].title,
          dateDebut: items[index].dateDebut,
          dateFin: items[index].dateFin,
          location: items[index].location,
          ownerName: items[index].ownerName,
          Budget: items[index].Budget,
          paiement: items[index].paiement,

          onContactPressed: () {},
          onRentPressed: () {},
        );
      },
    );
  }

  Widget _buildHistoriqueSection() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return CardOffreEnCours(
          imageUrl: items[index].imageUrl,
          title: items[index].title,
          dateDebut: items[index].dateDebut,
          dateFin: items[index].dateFin,
          location: items[index].location,
          ownerName: items[index].ownerName,
          Budget: items[index].Budget,
          paiement: items[index].paiement,
          onContactPressed: () {},
          onRentPressed: () {},
        );
      },
    );
  }
}

class OffreItem {
  final String imageUrl;
  final String title;
  final DateTime dateDebut;
  final DateTime dateFin;
  final String paiement;
  final String Budget;
  final String location;
  final String ownerName;

  OffreItem({
    required this.imageUrl,
    required this.title,
    required this.dateDebut,
    required this.dateFin,
    required this.location,
    required this.ownerName,
    required this.paiement,
    required this.Budget,
  });
}