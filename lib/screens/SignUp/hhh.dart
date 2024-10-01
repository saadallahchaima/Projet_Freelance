import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';

class CompleteProfile extends StatefulWidget {
  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  List<String?> _selectedImagePaths = [null, null, null];
  List<String> _specialities = [];
  List<String> _selectedSpecialities = [];

  @override
  void initState() {
    super.initState();
    _loadSpecialities();
  }

  Future<void> _loadSpecialities() async {
    final String response = await rootBundle.loadString('assets/json/job.json');
    final List<dynamic> data = json.decode(response);
    setState(() {
      _specialities = List<String>.from(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(34, 123, 34, 55.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10.6),
                  child: Text(
                    'Complétez votre profil',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      fontSize: 22.3,
                      height: 1.4,
                      color: Color(0xFF1C1F1E),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 17.4),
                  child: Text(
                    'Nous souhaitons mieux vous connaître afin de finaliser votre profil.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFFA7A6A5),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 22.1),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xFFF4F6F5),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x11124565),
                            offset: Offset(0, 4.8),
                            blurRadius: 7.14,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(19, 11.4, 19, 11.4),
                        child: Autocomplete<String>(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            if (textEditingValue.text.isEmpty) {
                              return const Iterable<String>.empty();
                            }
                            return _specialities.where((String option) {
                              return option
                                  .toLowerCase()
                                  .startsWith(textEditingValue.text.toLowerCase());
                            });
                          },
                          onSelected: (String selection) {
                            setState(() {
                              if (!_selectedSpecialities.contains(selection)) {
                                _selectedSpecialities.add(selection);
                              }
                            });
                          },
                          fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
                            return TextField(
                              controller: controller,
                              focusNode: focusNode,
                              onEditingComplete: onEditingComplete,
                              decoration: InputDecoration(
                                hintText: 'Spécialisé en:',
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 24),
                  child: SizedBox(
                    width: 264,
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      children: _selectedSpecialities
                          .map((speciality) => _buildSpecializationCard(speciality))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSpecializationCard(String text) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF064BA6)),
        borderRadius: BorderRadius.circular(22),
        color: Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Color(0x0C8E8E8E),
            offset: Offset(0, 2),
            blurRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(14, 6, 10, 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xFF064BA6),
              ),
            ),
            SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedSpecialities.remove(text);
                });
              },
              child: Icon(
                Icons.close,
                size: 16,
                color: Color(0xFF064BA6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: CompleteProfile(),
    ));
