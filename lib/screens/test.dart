import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khedma/screens/MainPages/notification.dart';
import 'package:khedma/screens/SideMenu.dart';

import '../components/navbara.dart';

class ProfilePageTest extends StatefulWidget {
  @override
  State<ProfilePageTest> createState() => _ProfilePageTestState();
}

class _ProfilePageTestState extends State<ProfilePageTest> {
    TextEditingController _controller = TextEditingController(text: '20');
  TextEditingController _resultController = TextEditingController(text: '20');
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _monthController = TextEditingController(text: '11');
  TextEditingController _yearController = TextEditingController(text: '2000');
 late StateSetter setModalState;
// Method to increment the value
void _incrementValue(TextEditingController controller, StateSetter setModalState) {
  setModalState(() {
    int currentValue = int.tryParse(controller.text) ?? 0;
    controller.text = (currentValue + 1).toString();
  });
}

// Method to decrement the value
void _decrementValue(TextEditingController controller, StateSetter setModalState) {
  setModalState(() {
    int currentValue = int.tryParse(controller.text) ?? 0;
    if (currentValue > 0) { // Prevent negative values
      controller.text = (currentValue - 1).toString();
    }
  });
}

// Variable to handle long press timing
Timer? _longPressTimer;

// Start long press increment
void _startLongPressIncrement(TextEditingController controller, StateSetter setModalState) {
  _longPressTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
    _incrementValue(controller, setModalState);
  });
}

// Stop long press increment
void _stopLongPressIncrement() {
  _longPressTimer?.cancel();
}

// Start long press decrement
void _startLongPressDecrement(TextEditingController controller, StateSetter setModalState) {
  _longPressTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
    _decrementValue(controller, setModalState);
  });
}

// Stop long press decrement
void _stopLongPressDecrement() {
  _longPressTimer?.cancel();
}



  bool _isSettingsDrawer = false;

  void _toggleDrawer(BuildContext context) {
    setState(() {
      _isSettingsDrawer = !_isSettingsDrawer;
    });
    Navigator.of(context).pop(); // Close the current drawer
    Scaffold.of(context).openEndDrawer(); // Open the new drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: _isSettingsDrawer
          ? Builder(
              builder: (context) =>
                  SettingsDrawer(toggleDrawer: () => _toggleDrawer(context)),
            )
          : Builder(
              builder: (context) =>
                  MyDrawer(toggleDrawer: () => _toggleDrawer(context)),
            ),
      appBar: AppBar(
        backgroundColor: Color(0xFF0099D6),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NotificationScreen()), // Remplacez `NotificationScreen` par la page souhaitée
                );
              },
              child: Padding(
                padding:
                    EdgeInsets.only(left: 16), // Ajustez le padding si nécessaire
                child: Image.asset(
                  'assets/icons/edit.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            Spacer(), // Ajoute un espace flexible pour centrer le texte
            Text(
              'Mon Profile',
              style: GoogleFonts.getFont(
                'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Spacer(), // Ajoute un autre espace flexible
            SizedBox(width: 1), // Espace pour équilibrer l'icône de gauche
          ],
        ),
        elevation: 0,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
        automaticallyImplyLeading: false, // Supprime l'icône de retour par défaut
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
        return StatefulBuilder( // Use StatefulBuilder to handle state within the BottomSheet
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.close, color: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Text(
                                'Achat de token',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 48),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Ajouter des token à votre compte afin que vous puissiez publier vos demandes.',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(1.2, 0, 1.2, 12),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Token',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  height: 2.2,
                                  color: Color(0xFF1C1F1E),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(45.7, 0, 0, 19.4),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 8, 0, 20.6),
                                      child: Image.asset(
                                        "assets/icons/tokenicon.png",
                                        width: 35,
                                        height: 35,
                                      ),
                                    ),
                                  ),
                                  _buildIncrementDecrementButtons(
                                    _controller,
                                    setModalState, // Pass StateSetter to update state within the modal
                                  ),
                                  Expanded(
                                    child: _buildText(_controller),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 8, 0, 10.6),
                                    child: Text(
                                      '=',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 8, 0, 10.6),
                                    child: Image.asset(
                                      "assets/icons/euro.png",
                                      width: 35,
                                      height: 35,
                                    ),
                                  ),
                                  _buildIncrementDecrementButtons(
                                    _resultController,
                                    setModalState, // Pass StateSetter to update state within the modal
                                  ),
                                  Expanded(
                                    child: _buildText(_resultController),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Détails de paiement',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          _buildTextField(
                            hint: 'Numéro de carte de crédit',
                            controller: _cardNumberController,
                          ),
                          SizedBox(height: 10),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 158.7, 1),
                            child: Text(
                              'Date d’expiration',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                height: 2.3,
                                color: Color(0xFF1C1F1E),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 144.6, 30.2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: _buildDateField('Mois:', _monthController),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: _buildDateField('Année:', _yearController),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Action pour compléter l'achat
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Complétez votre achat',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        );
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
        return StatefulBuilder( // Use StatefulBuilder to handle state within the BottomSheet
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.close, color: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Text(
                                'Conversion de token',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 48),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Vous pouvez convertir vos tokens en Euro.',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(1.2, 0, 1.2, 12),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Token',
                                style: GoogleFonts.getFont(
                                  'Roboto',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  height: 2.2,
                                  color: Color(0xFF1C1F1E),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(45.7, 0, 0, 19.4),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 8, 0, 20.6),
                                      child: Image.asset(
                                        "assets/icons/tokenicon.png",
                                        width: 35,
                                        height: 35,
                                      ),
                                    ),
                                  ),
                                  _buildIncrementDecrementButtons(
                                    _controller,
                                    setModalState, // Pass StateSetter to update state within the modal
                                  ),
                                  Expanded(
                                    child: _buildText(_controller),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 8, 0, 10.6),
                                    child: Text(
                                      '=',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 8, 0, 10.6),
                                    child: Image.asset(
                                      "assets/icons/euro.png",
                                      width: 35,
                                      height: 35,
                                    ),
                                  ),
                                  _buildIncrementDecrementButtons(
                                    _resultController,
                                    setModalState, // Pass StateSetter to update state within the modal
                                  ),
                                  Expanded(
                                    child: _buildText(_resultController),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Détails de paiement',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          _buildTextField(
                            hint: 'Numéro de carte de crédit',
                            controller: _cardNumberController,
                          ),
                          SizedBox(height: 10),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 158.7, 1),
                            child: Text(
                              'Date d’expiration',
                              style: GoogleFonts.getFont(
                                'Roboto',
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                height: 2.3,
                                color: Color(0xFF1C1F1E),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 144.6, 30.2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: _buildDateField('Mois:', _monthController),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: _buildDateField('Année:', _yearController),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Action pour compléter l'achat
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Complétez votre achat',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        );
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
      'Conversion',
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
                      margin: EdgeInsets.fromLTRB(3, 0, 1.4, 15),
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
                        padding: EdgeInsets.fromLTRB(19, 18, 0, 20),
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
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2, // Limiter à deux lignes
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
  width: MediaQuery.of(context).size.width * 0.4,
  height: MediaQuery.of(context).size.height * 0.4,
  margin: EdgeInsets.only(left: 16),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30), 
    image: DecorationImage(
      image: AssetImage('assets/icons/imagee.png'),
      fit: BoxFit.cover,
    ),
  ),
  clipBehavior: Clip.hardEdge, 
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
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  SizedBox(height: 8),
                  Row(
                    children: [
                        SizedBox(
                    width: 13.5,
                    height: 16.9,
                    child: Image.asset(
                      'assets/icons/adresse.png',
                      
                    ),
                    
                  ),
                      // Icon(Icons.location_on, color: Color(0xFF0099D6)),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '123 Rue de la Révolution, 75001 Paris, France',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xFF0C3469),
                          ),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2, // Limiter à deux lignes si nécessaire
                        ),
                      ),
                    ],
                  ),
                                    SizedBox(height: 8),


                                    Row(
                    children: [
                        SizedBox(
                    width: 13.5,
                    height: 16.9,
                    child: Image.asset(
                      'assets/icons/phone.png',
                      
                    ),
                    
                  ),
                      // Icon(Icons.location_on, color: Color(0xFF0099D6)),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '+99-888-333-322',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xFF0C3469),
                          ),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2, // Limiter à deux lignes si nécessaire
                        ),
                      ),
                    ],
                  ),
                    SizedBox(height: 8),
                  Row(
                    children: [
                        SizedBox(
                    width: 13.5,
                    height: 16.9,
                    child: Image.asset(
                      'assets/icons/mail.png',
                      
                    ),
                    
                  ),
                      // Icon(Icons.location_on, color: Color(0xFF0099D6)),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'jessica.virgolini50@gmail.com',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xFF0C3469),
                          ),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2, // Limiter à deux lignes si nécessaire
                        ),
                      ),
                    ],
                  ),
                    SizedBox(height: 8),
                  Row(
                    children: [
                        SizedBox(
                    width: 13.5,
                    height: 16.9,
                    child: Image.asset(
                      'assets/icons/token.png',
                      
                    ),
                    
                  ),
                      // Icon(Icons.location_on, color: Color(0xFF0099D6)),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '20€ / Heure',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xFF0C3469),
                          ),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2, // Limiter à deux lignes si nécessaire
                        ),
                      ),
                    ],
                  ),
                                      SizedBox(height: 18),

                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
  
Widget _buildIncrementDecrementButtons(
  TextEditingController controller, 
  StateSetter setModalState // Pass the StateSetter to update state within the modal
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () => _incrementValue(controller, setModalState),
        onLongPress: () {
          // Long press to continuously increment the value
          _startLongPressIncrement(controller, setModalState);
        },
        onLongPressUp: () {
          // Stop incrementing when long press is released
          _stopLongPressIncrement();
        },
        child: Container(
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
          child: Center(
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
        child: GestureDetector(
          onTap: () => _decrementValue(controller, setModalState),
          onLongPress: () {
            // Long press to continuously decrement the value
            _startLongPressDecrement(controller, setModalState);
          },
          onLongPressUp: () {
            // Stop decrementing when long press is released
            _stopLongPressDecrement();
          },
          child: Center(
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
