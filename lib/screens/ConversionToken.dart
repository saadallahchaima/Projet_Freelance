import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AchatTokenScreen extends StatefulWidget {
  @override
  State<AchatTokenScreen> createState() => _AchatTokenState();
}

class _AchatTokenState extends State<AchatTokenScreen> {
  TextEditingController _controller = TextEditingController(text: '20');
  TextEditingController _resultController = TextEditingController(text: '20');
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _monthController = TextEditingController(text: '11');
  TextEditingController _yearController = TextEditingController(text: '2000');

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

  // Fonction pour afficher le BottomSheet
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Options d\'achat de tokens',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Action pour acheter des tokens
                },
                child: Text('Acheter 20 tokens'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Action pour acheter des tokens
                },
                child: Text('Acheter 50 tokens'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 9, 9),
      body: Center(
        child: Column(
          children: [
            Spacer(),
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
                        'Convertion de token',
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
                    ' Vous pouvez convertir vos tokens en Euro.',
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
                      width: 252.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _showBottomSheet(context);
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 8, 0, 20.6),
                              child: Image.asset(
                                "assets/icons/tokenicon.png",
                                width: 35,
                                height: 35,
                              ),
                            ),
                          ),
                          _buildIncrementDecrementButtons(_controller),
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
                          _buildIncrementDecrementButtons(_resultController),
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
            Spacer(),
          ],
        ),
      ),
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
