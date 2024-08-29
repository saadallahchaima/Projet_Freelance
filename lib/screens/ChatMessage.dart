import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khedma/screens/SideMenu.dart';

class ChatMessagePage extends StatefulWidget {
  @override
  State<ChatMessagePage> createState() => _ChatMessagePageState();
}

class _ChatMessagePageState extends State<ChatMessagePage> {
    late GlobalKey<ScaffoldState> _scaffoldKey;
  late bool isSettingsDrawer;


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer:      MyDrawer(),

      appBar: AppBar(
        backgroundColor: Color(0xFF0099D6),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(
              'Mes Messages',
              style: GoogleFonts.getFont(
                'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 24),
          ],
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
              color: Color(0xFF0099D6),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(17, 29, 18.6, 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 35.2),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.only(right: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/icons/Dr.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 3.8),
                                  child: Text(
                                    'Dr. Floyd Miles',
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.7,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 3.5),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF66CA98),
                                        borderRadius: BorderRadius.circular(3.5),
                                      ),
                                      width: 7,
                                      height: 7,
                                    ),
                                    Text(
                                      'Online',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.2,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),  // Use Spacer to push the icons to the right
                        _buildIcon('assets/icons/iconvideo.png'),
                       // _buildIcon('assets/icons/iconCall.png'),
                        Container(
                           margin: EdgeInsets.only(bottom: 1.9),
                                width: 60.8,
                              height: 60.8,
                            padding: EdgeInsets.all(9.2),
                              child: Image.asset("assets/icons/iconCall.png"),
                                 ),
                        _buildIcon('assets/icons/ep_more.png'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildIcon(String assetPath) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.9),
      width: 58.8,
      height: 58.8,
      padding: EdgeInsets.all(9.2),
      child: Image.asset(assetPath),
    );
  }
}
