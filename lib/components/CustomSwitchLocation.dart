import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'CardItemHistorique.dart';
import 'RentalItemCard.dart';

class CustomSwitchLocation extends StatefulWidget {
  final List<String> buttonLabels;

  const CustomSwitchLocation({Key? key, required this.buttonLabels}) : super(key: key);

  @override
  State<CustomSwitchLocation> createState() => _CustomSwitchLocationState();
}

class _CustomSwitchLocationState extends State<CustomSwitchLocation> {
  List<bool> isSelected = [true, false];
  final List<RentalItem> items = [
    RentalItem(
      imageUrl: 'https://example.com/image1.png',
      title: 'Table de mixage',
      description: 'Une table de mixage et des jeux de lumière.',
      price: '400€',
      location: '4 Rue de l\'Abbé Groult, 75015 Paris',
      ownerName: 'Jessica Virgolini',
    ),
    RentalItem(
      imageUrl: 'https://example.com/image1.png',
      title: 'Table de mixage',
      description: 'Une table de mixage et des jeux de lumière.',
      price: '400€',
      location: '4 Rue de l\'Abbé Groult, 75015 Paris',
      ownerName: 'Jessica Virgolini',
    ),
    RentalItem(
      imageUrl: 'https://example.com/image1.png',
      title: 'Table de mixage',
      description: 'Une table de mixage et des jeux de lumière.',
      price: '400€',
      location: '4 Rue de l\'Abbé Groult, 75015 Paris',
      ownerName: 'Jessica Virgolini',
    ),
    // Ajoutez d'autres éléments ici
  ];

  @override
  Widget build(BuildContext context) {
    return Column(  // No Expanded here
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
    return isSelected[0]
        ? _buildDomainSection()
        : _buildHistoriqueSection(); // Placeholder for second tab content
  }

  Widget _buildDomainSection() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return RentalItemCardDisponible(
          imageUrl: items[index].imageUrl,
          title: items[index].title,
          description: items[index].description,
          price: items[index].price,
          location: items[index].location,
          ownerName: items[index].ownerName,
          onContactPressed: () {
            // Action lorsque le bouton 'Contacter le propriétaire' est pressé
          },
          onRentPressed: () {
            // Action lorsque le bouton 'Louer cette article' est pressé
          },
        );
      },
    );
  }
  Widget _buildHistoriqueSection() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return RentalItemCardHistorique(
          imageUrl: items[index].imageUrl,
          title: items[index].title,
          description: items[index].description,
          price: items[index].price,
          location: items[index].location,
          ownerName: items[index].ownerName,
          onContactPressed: () {
            // Action lorsque le bouton 'Contacter le propriétaire' est pressé
          },
          onRentPressed: () {
            // Action lorsque le bouton 'Louer cette article' est pressé
          },
        );
      },
    );
  }
}

class RentalItem {
  final String imageUrl;
  final String title;
  final String description;
  final String price;
  final String location;
  final String ownerName;

  RentalItem({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.ownerName,
  });
}
