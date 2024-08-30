import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'CardOffre.dart';
import 'CardOffreLocation.dart';

class CustomSwitchLocationOffre extends StatefulWidget {
  final List<String> buttonLabels;

  const CustomSwitchLocationOffre({Key? key, required this.buttonLabels}) : super(key: key);

  @override
  State<CustomSwitchLocationOffre> createState() => _CustomSwitchOffreState();
}

class _CustomSwitchOffreState extends State<CustomSwitchLocationOffre> {
  List<bool> isSelected = [true, false];
  final List<OffreLocationItem> items = [
    OffreLocationItem(
      imageUrl: 'https://example.com/image1.png',
      title: 'Ménage à domicile',
      dateDebut: DateTime.now(),
      dateFin: DateTime.now(),
      location: '4 Rue de l\'Abbé Groult, 75015 Paris',
      ownerName: 'Jessica Virgolini',
      description: 'Une table de mixage et des jeux de lumière.',

      paiement: '35€',
    ),
    OffreLocationItem(
      imageUrl: 'https://example.com/image1.png',
      title: 'Ménage à domicile',
      dateDebut: DateTime.now(),
      dateFin: DateTime.now(),
      location: '4 Rue de l\'Abbé Groult, 75015 Paris',
      ownerName: 'Jessica Virgolini',
      description: 'Une table de mixage et des jeux de lumière.',

      paiement: '35€',
    ),
    OffreLocationItem(
      imageUrl: 'https://example.com/image1.png',
      title: 'Ménage à domicile',
      dateDebut: DateTime.now(),
      dateFin: DateTime.now(),
      location: '4 Rue de l\'Abbé Groult, 75015 Paris',
      ownerName: 'Jessica Virgolini',
      description: 'Une table de mixage et des jeux de lumière.',

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
            fillColor: const Color(0xFFF7AA1E),
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
          paiement: items[index].paiement,
          Budget: items[index].paiement,

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
        return CardOffreLocationEnCours(
          imageUrl: items[index].imageUrl,
          title: items[index].title,
          dateDebut: items[index].dateDebut,
          dateFin: items[index].dateFin,
          location: items[index].location,
          ownerName: items[index].ownerName,
          prix: items[index].paiement,
          description: items[index].description,
          onContactPressed: () {},
          onRentPressed: () {},
        );
      },
    );
  }
}

class OffreLocationItem {
  final String imageUrl;
  final String title;
  final DateTime dateDebut;
  final DateTime dateFin;
  final String paiement;
  final String location;
  final String description;

  final String ownerName;

  OffreLocationItem({
    required this.imageUrl,
    required this.title,
    required this.dateDebut,
    required this.dateFin,
    required this.location,
    required this.ownerName,
    required this.paiement,
    required this.description,

  });
}
