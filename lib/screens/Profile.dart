import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khedma/components/CustomProfile.dart';
import 'package:khedma/components/Stepper/ProfileStepper.dart';
import 'package:khedma/components/navbara.dart';
import 'package:khedma/screens/SideMenu.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  void _incrementValue(TextEditingController controller) {
    setState(() {
      int currentValue = int.tryParse(controller.text) ?? 0;
      currentValue += 1;
      controller.text = currentValue.toString();
    });
  }

  void _decrementValue(TextEditingController controller) {
    setState(() {
      int currentValue = int.tryParse(controller.text) ?? 0;
      if (currentValue > 0) {
        currentValue -= 1;
      }
      controller.text = currentValue.toString();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF0099D6),
        iconTheme: IconThemeData(
          color: Colors
              .white, // Set the color of the icons (including the menu icon)
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileStepper()),
                );
              },
              child: Container(
                width: 24,
                height: 24,
                child: Image.asset(
                  'assets/icons/edit.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),

            Text(
              'Mon Profile',
              style: GoogleFonts.getFont(
                'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 24), // Placeholder to balance space
          ],
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
              decoration: BoxDecoration(
                color: Color(0xFF0099D6),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(17, 29, 18.6, 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 13),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(23),
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(8, 5, 8, 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      child: Image.asset(
                                        'assets/icons/tokenicon.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      '99',
                                      style: GoogleFonts.getFont(
                                        'Roboto',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (BuildContext context) {
                                          return Container();
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: Image.asset(
                                          'assets/icons/addtoken.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    return Container();
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF7AA1E),
                                  borderRadius: BorderRadius.circular(23),
                                ),
                                padding: EdgeInsets.fromLTRB(17.8, 7, 17.8, 8),
                                child: Text(
                                  'Convertion',
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.7,
                                    color: Color(0xFFF4F6F5),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(8, 5, 5, 5),
                      margin: EdgeInsets.fromLTRB(6, 10, 6, 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFF7AA1E),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x21BEBEBE),
                            offset: Offset(3, 3),
                            blurRadius: 4.5,
                          ),
                        ],
                      ),
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Jessica Virgolini',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 32,
                                      color: Color(0xFF525252),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'Type',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19,
                                      color: Color(0xFFB8C5D0),
                                    ),
                                  ),
                                  Text(
                                    'Client',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24,
                                      color: Color(0xFF79838B),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(23),
                                child: Image.asset(
                                  'assets/images/spike.jpg',
                                  width: 150,
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(3, 0, 3, 0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 7, 0),
                              decoration: BoxDecoration(
                                color: Color(0xFFF7AA1E),
                                borderRadius: BorderRadius.circular(33.5),
                              ),
                              child: Container(
                                width: 23,
                                height: 23,
                                padding: EdgeInsets.all(3.4),
                                child: Image.asset(
                                  'assets/icons/Check.png',
                                  width: 16.2,
                                  height: 16.2,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
                              child: Text(
                                'Identité vérifiée',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Ajout des éléments adresse et icône en dessous du container bleu
            Container(
              margin: EdgeInsets.fromLTRB(10.5, 0, 0, 0),
              child: Row(
                children: [
                  SizedBox(
                    width: 13.5,
                    height: 16.9,
                    child: Image.asset(
                      'assets/icons/adresse.png',
                    ),
                  ),
                  SizedBox(width: 10),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF0C3469),
                      ),
                      children: [
                        TextSpan(
                          text: '4 Rue ',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 1.3,
                            color: Color(0xFF0C3469),
                          ),
                        ),
                        TextSpan(
                          text: "de l'Abbé Groult, 750515 Paris",
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFF0C3469),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            Container(
              margin: EdgeInsets.fromLTRB(10.5, 0, 0, 0),
              child: Row(
                children: [
                  SizedBox(
                    width: 13.5,
                    height: 16.9,
                    child: Image.asset(
                      'assets/icons/phone.png',
                    ),
                  ),
                  SizedBox(width: 10),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF0C3469),
                      ),
                      children: [
                        TextSpan(
                          text: "+99-888-333-322",
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFF0C3469),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            Container(
              margin: EdgeInsets.fromLTRB(10.5, 0, 0, 0),
              child: Row(
                children: [
                  SizedBox(
                    width: 13.5,
                    height: 16.9,
                    child: Image.asset(
                      'assets/icons/mail.png',
                    ),
                  ),
                  SizedBox(width: 10),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF0C3469),
                      ),
                      children: [
                        TextSpan(
                          text: "jessica.virgolini50@gmail.com",
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFF0C3469),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            Container(
              margin: EdgeInsets.fromLTRB(10.5, 0, 0, 0),
              child: Row(
                children: [
                  SizedBox(
                    width: 13.5,
                    height: 16.9,
                    child: Image.asset(
                      'assets/icons/token.png',
                    ),
                  ),
                  SizedBox(width: 10),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.getFont(
                        'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF0C3469),
                      ),
                      children: [
                        TextSpan(
                          text: "20€ / Heure",
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFF0C3469),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildIncrementDecrementButtons(TextEditingController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 1.3),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF0099D5)),
            borderRadius: BorderRadius.circular(6.6),
            color: Color(0xFFF4F6F5),
            boxShadow: [
              BoxShadow(
                color: Color(0x11124565),
                offset: Offset(0, 4),
                blurRadius: 7,
              ),
            ],
          ),
          child: InkWell(
            onTap: () => _incrementValue(controller),
            child: Container(
              padding: EdgeInsets.fromLTRB(6.9, 1.8, 6.9, 2.8),
              child: Text(
                '+',
                style: GoogleFonts.getFont(
                  'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 13.3,
                  color: Color(0xFF1C1F1E),
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF0099D5)),
            borderRadius: BorderRadius.circular(6.6),
            color: Color(0xFFF4F6F5),
            boxShadow: [
              BoxShadow(
                color: Color(0x11124565),
                offset: Offset(0, 4),
                blurRadius: 7,
              ),
            ],
          ),
          child: InkWell(
            onTap: () => _decrementValue(controller),
            child: Container(
              padding: EdgeInsets.fromLTRB(6.9, 1.8, 6.9, 2.8),
              child: Text(
                '-',
                style: GoogleFonts.getFont(
                  'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 13.3,
                  color: Color(0xFF1C1F1E),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildText(TextEditingController controller) {
    return Container(
      height: 25,
      child: Center(
        child: Text(
          controller.text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildDateField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
