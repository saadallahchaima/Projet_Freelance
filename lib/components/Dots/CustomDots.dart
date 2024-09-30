import 'package:flutter/material.dart';

class CustomDotsIndicator extends StatelessWidget {
  final PageController controller;
  final int itemCount;
  final Function(int) onPageSelected; // Callback pour sélectionner une page

  CustomDotsIndicator({
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double? pageValue;

        if (controller.hasClients && controller.position.hasContentDimensions) {
          pageValue = controller.page ?? controller.initialPage.toDouble();
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(itemCount, (int index) {
            return GestureDetector(
              onTap: () => onPageSelected(index), // Appel de onPageSelected lorsque l'utilisateur tape sur un dot
              child: _buildDot(index, pageValue),
            );
          }),
        );
      },
    );
  }

  Widget _buildDot(int index, double? pageValue) {
    // Déterminez si le point est sélectionné ou non
    bool isSelected = pageValue != null && pageValue.round() == index;

    return Container(
      width: 8.0,
      height: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.black : Colors.grey, // Couleurs fixes
      ),
    );
  }
}
