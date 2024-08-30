import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khedma/screens/SideMenu.dart';

class MessagePage extends StatefulWidget {
  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF0099D6),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 24,
              height: 24,
              child: Image.asset(
                'assets/icons/notification.png',
                width: 24,
                height: 24,
              ),
            ),
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
            margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
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
                    decoration: BoxDecoration(
                      color: Color(0xFFEDF4FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(14.2, 9.3, 10, 7.6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 12.6, 0),
                                width: 31,
                                height: 31,
                                child: Image.asset(
                                  'assets/drawericons/recherche.png',
                                  width: 19.2,
                                  height: 19.1,
                                ),
                              ),
                              Text(
                                'Recherche',
                                style: GoogleFonts.getFont(
                                  'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xFFB7B7B7),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 12,
                            height: 12,
                            child: Image.asset(
                              'assets/drawericons/Close.png',
                              width: 12,
                              height: 12,
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
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(28, 0, 28, 10.7),
              children: [
                Slidable(
                  endActionPane: ActionPane(
                    motion: DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          // Define your action here
                        },
                        backgroundColor: Color(0xFF6295E2),
                        foregroundColor: Colors.white,
                        icon: Icons.phone, // or use SvgPicture if you prefer
                        label: 'Call',
                      ),
                     
                    ],
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 192, 225, 251),
                      borderRadius: BorderRadius.circular(12.5),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 50),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                width: 40,
                                height: 40,
                                child: Image.asset(
                                  'assets/images/user1.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(11.8, 14.3, 11.8, 14.7),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0.9),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Floyd Miles',
                                                  style: GoogleFonts.getFont(
                                                    'Roboto',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14.3,
                                                    color: Color(0xFF1C1F1E),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '8:01',
                                                      style: GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 10.7,
                                                        color: Color(0xFFA7A6A5),
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 160.4, 5.5),
                                        child: Text(
                                          'Mechanic',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.5,
                                            color: Color(0xFFA7A6A5),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 6.8, 0),
                                        child: Text(
                                          'Vivamus varius odio non dui gravida, qui...',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10.7,
                                            color: Color(0xFFA7A6A5),
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
                        Positioned(
                          right: 10,
                          bottom: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFF6C52),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(4.5, 0.9, 4.9, 2.2),
                              child: Text(
                                '3',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.7,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Add more Slidable widgets for additional messages
              ],
            ),
          ),
        ],
      ),
    );
  }
}