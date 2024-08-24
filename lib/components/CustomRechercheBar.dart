import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SearchBar extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.w), // Adjust padding for screen size
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Rechercher...', // Placeholder text
          prefixIcon: Icon(Icons.search, size: 24.sp), // Search icon
          suffixIcon: searchController.text.isNotEmpty
              ? IconButton(
            icon: Icon(Icons.clear, size: 24.sp),
            onPressed: () => searchController.clear(),
          )
              : null, // Clear button
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0), // Rounded corners
            borderSide: BorderSide.none, // No border
          ),
          filled: true,
          fillColor: Colors.grey[200], // Background color
          contentPadding: EdgeInsets.symmetric(vertical: 12.0.h), // Vertical padding
        ),
        onChanged: (value) {
          // Handle search logic here
          print("Searching for: $value");
        },
      ),
    );
  }
}
