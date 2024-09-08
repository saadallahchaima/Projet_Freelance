import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khedma/components/appBar.dart';
import 'package:khedma/components/navbara.dart';
import 'package:khedma/screens/ChatMessage.dart';
import 'package:khedma/screens/SideMenu.dart';

class MessagePage extends StatefulWidget {
  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
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
 appBar: CustomAppBar(
        notificationIcon: Icon(Icons.notifications, color: Colors.white),
        title: 'Mes Messages',
        showSearchBar: true,
        backgroundColor: Color(0xFF0099D6),
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatMessagePage()),
                      );
                    },
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
                ),
                // 
              ],
            ),
          ),
        ],
      ),
            bottomNavigationBar: BottomNavBar(),

    );
  }
}
