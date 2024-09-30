import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String) onSearch;

  CustomSearchBar({required this.onSearch});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Recherche...',
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                onSearch(_searchController.text);
                Navigator.of(context).pop();
              },
              child: Text('Recherche'),
            ),
          ],
        ),
      ),
    );
  }
}
