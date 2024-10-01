import 'package:flutter/material.dart';

class SpecialityAutocomplete extends StatelessWidget {
  final List<String> specialities = [
    'Développeur Mobile',
    'Développeur Web',
    'Ingénieur DevOps',
    'Data Scientist',
    'Designer UI/UX',
    'Ingénieur Logiciel',
    'Architecte Cloud',
    'Consultant en Sécurité',
    // Ajoutez d'autres spécialités ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spécialité AutoComplete'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Autocomplete<String>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }
            return specialities.where((String option) {
              return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selection) {
            print('Vous avez sélectionné: $selection');
          },
          fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
            return TextField(
              controller: controller,
              focusNode: focusNode,
              onEditingComplete: onEditingComplete,
              decoration: InputDecoration(
                labelText: 'Spécialité',
                border: OutlineInputBorder(),
              ),
            );
          },
        ),
      ),
    );
  }
}

