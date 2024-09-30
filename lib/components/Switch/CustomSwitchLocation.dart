import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khedma/theme/AppTheme.dart';

import '../Card/CardItemHistorique.dart';
import '../Card/RentalItemCard.dart';

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
    return Expanded( // Wrap the entire Column in Expanded to provide height constraint
      child: Column(
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
      ),
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
            _showPriceProposalBottomSheet(items[index].title, context); // Open bottom sheet on rent press

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
void _showPriceProposalBottomSheet(String itemId, BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
    ),
    builder: (context) {
      return PriceProposalBottomSheet(itemId: itemId);
    },
  );
}

class PriceProposalBottomSheet extends StatefulWidget {
  final String itemId;

  const PriceProposalBottomSheet({Key? key, required this.itemId}) : super(key: key);

  @override
  _PriceProposalBottomSheetState createState() => _PriceProposalBottomSheetState();
}

class _PriceProposalBottomSheetState extends State<PriceProposalBottomSheet> {
  int period = 1;
  int price = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.close, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Proposition de prix",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Center(
            child: Text(
              "Proposez une offre de prix afin de répondre à cette demande.",
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center, // Aligne verticalement les éléments
            children: [
              _buildIncrementDecrementWidget(
                  "Période(Nuit)", period, (newPeriod) {
                setState(() {
                  period = newPeriod;
                });
              }),
              SizedBox(width: 20.w), // Ajoute un espace entre les widgets
              Row(
                mainAxisSize: MainAxisSize.min, // Évite que la Row prenne toute la largeur disponible
                children: [
                  _buildIncrementDecrementWidget(
                      "Prix", price, (newPrice) {
                    setState(() {
                      price = newPrice;
                    });
                  }),
                  SizedBox(width: 10.w), // Ajoute un espace entre le widget et l'image
                  Padding(
                    padding: EdgeInsets.only(bottom: 0.h), // Ajuste l'espace inférieur
                    child: Image.asset(
                      "assets/icons/coins.png",
                      width: 50.w, // Ajuste la largeur en fonction de l'image
                      height: 50.h, // Ajuste la hauteur en fonction de l'image
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: () {
              // Handle validation logic here
              Navigator.pop(context);
            },
            child: Text("Valider"),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: AppTheme.primaryColor, // Utilisez votre couleur principale ici
              fixedSize: Size(150.w, 44.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Ajustez la valeur selon vos besoins
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncrementDecrementWidget(String label, int value, Function(int) onChanged, {bool showCoin = false}) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14.19.sp, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h), // Add some space between the label and the controls
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the row content
          children: [
            Column(
              children: [
                Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF0099D5)),
                    borderRadius: BorderRadius.circular(6.6),
                  ),
                  child: Center(
                    child: IconButton(
                      iconSize: 20.w,
                      padding: EdgeInsets.zero, // Remove default padding to ensure proper centering
                      onPressed: () {
                        if (value > 1) {
                          onChanged(value - 1);
                        }
                      },
                      icon: Icon(Icons.remove),
                    ),
                  ),
                ),
                SizedBox(height: 8.h), // Add some space between buttons
                Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF0099D5)),
                    borderRadius: BorderRadius.circular(6.6),
                  ),
                  child: Center(
                    child: IconButton(
                      iconSize: 20.w,
                      padding: EdgeInsets.zero, // Remove default padding to ensure proper centering
                      onPressed: () {
                        onChanged(value + 1);
                      },
                      icon: Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 5.w), // Add space between the buttons and the value
            Container(
              width: 70.w, // Adjust width as needed
              height: 40.h,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 1.3),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF0099D5)),
                borderRadius: BorderRadius.circular(6),
                color: Color(0xFFF4F6F5),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x11124565),
                    offset: Offset(0, 4),
                    blurRadius: 7,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the content in the container
                children: [
                  Text(
                    "$value",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
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
