import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonneeProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Design avant les cercles
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 53, 26, 50.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(4.5, 0, 0, 88.9),
                        child: SizedBox(
                          width: 261.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Ajoutez vos icônes ici
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5.2, 0, 0, 10.6),
                        child: Text(
                          'Vos données principales',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            fontSize: 22.3,
                            height: 1.4,
                            color: Color(0xFF1C1F1E),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5.2, 0, 0, 22.4),
                        child: Text(
                          'Nous souhaitons mieux vous connaître afin de finaliser votre profile.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xFFA7A6A5),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1.2, 0, 0, 26.2),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(1.8, 0, 0, 14.3),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xFFFFFFFF),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x11124565),
                                          offset: Offset(0, 12),
                                          blurRadius: 7.5,
                                        ),
                                      ],
                                    ),
                                    child: SizedBox(
                                      width: 92,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(0, 26.3, 0, 26.2),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(0, 0, 0, 4.3),
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: Image.asset(
                                                  'assets/icons/Icon.png',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Ajouter votre photo',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xFF0099D5),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                right: 13.6,
                                top: 0,
                                child: SizedBox(
                                  width: 25.6,
                                  height: 25.5,
                                  child: Image.asset(
                                    'assets/icons/Shape.png',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1, 0, 0, 25),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF064BA6)),
                          borderRadius: BorderRadius.circular(11),
                          color: Color(0xFFFFFFFF),
                        ),
                        child: SizedBox(
                          width: 208,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 6, 1.2, 5),
                            child: Text(
                              '  Développez votre profile',
                              style: GoogleFonts.roboto(
                                
                                fontWeight: FontWeight.w600,
                                fontSize: 14.9,
                                color: Color(0xFF064BA6),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Les cercles en dessous du design précédent
              Container(
                height: 400, // Définissez une hauteur fixe pour le Stack
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Circle for the expert in the center
                    Positioned(
                      right: 50,
                      left: 50,
                      bottom: 270,
                      child: Column(
                        children: [
                          Container(
                            width: 93,
                            height: 93,
                            decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/icons/healthicons_city-worker-outline.png', // Remplacez par le chemin de votre image
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'expert',
                            style: GoogleFonts.roboto(
                              color: Colors.blue,
                              fontSize: 14.33,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 50,
                      bottom: 190,
                      child: Column(
                        children: [
                          Container(
                            width: 93,
                            height: 93,
                            decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/icons/healthicons_construction-worker-outline.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'amateur certifié',
                            style: GoogleFonts.roboto(
                              color: Colors.blue,
                              fontSize: 14.33,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 50,
                      bottom: 190,
                      child: Column(
                        children: [
                          Container(
                            width: 93,
                            height: 93,
                            decoration: BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/icons/healthicons_factory-worker-outline.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'professionel',
                            style: GoogleFonts.roboto(
                              color: Colors.blue,
                              fontSize: 14.33,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Ajoutez votre bouton ici si nécessaire
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  color: Color(0xFF0099D5),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: SizedBox(
                  width: 308,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 6, 1.2, 5),
                    child: Text(
                      'Continuer en tant qu’un client',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.9,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
