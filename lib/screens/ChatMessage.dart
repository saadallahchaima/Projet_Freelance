import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khedma/components/navbara.dart';
import 'package:khedma/screens/SideMenu.dart';

class ChatMessagePage extends StatefulWidget {
  @override
  State<ChatMessagePage> createState() => _ChatMessagePageState();
}

class _ChatMessagePageState extends State<ChatMessagePage> {
   String buttonImagePath = 'assets/icons/deal.png';
  String selectedProviderMessage = '';
void _showAssignDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Est-ce que vous voulez assigner votre demande “Nom de la demande” à “Nom du prestataire ?"',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text(
                      'Annuler',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedProviderMessage =
                            'Vous avez choisi Dr. Floyd Miles comme votre prestataire.';
                        buttonImagePath = 'assets/icons/confirmed.png';
                      });
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      'Confirmer',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFEFF6F9),
      endDrawer: MyDrawer(),
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
                                      margin: EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 3.5),
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
                        Spacer(), // Use Spacer to push the icons to the right
                        _buildIcon('assets/icons/iconvideo.png'),
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
          
            Expanded(
  child: ListView(
    padding: EdgeInsets.symmetric(horizontal: 20),
    children: [
      Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Today',
            style: GoogleFonts.getFont(
              'Inter',
              fontSize: 12,
              color: Color(0xFFA7A6A5),
            ),
          ),
        ),
      ),
      // First Message
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Image
          Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/icons/Dr.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Message Bubble
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: Color(0xFF6295E2),
              borderRadius: BorderRadius.circular(15),
            ),
            constraints: BoxConstraints(
              maxWidth: 229.88,
              minHeight: 46.25, // Height for the rectangle
            ),
            child: Text(
              'Hello, how are you feeling? Did you manage to buy medicines?',
              style: GoogleFonts.getFont(
                'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              SizedBox(height: 10), 
              Transform.translate(
                offset: Offset(-55, 70), // 2 cm to the left
                child: Row(
                  children: [
                    Text(
                      '7:21',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontSize: 12,
                        color: Color(0xFFA7A6A5),
                      ),
                    ),
                    SizedBox(width: 5), // Space between time text and image
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/icons/arrows.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      SizedBox(height: 40), // Space between messages
      // Response Message
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
      
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            constraints: BoxConstraints(
              maxWidth: 229.88,
              minHeight: 46.25,
            ),
            child: Text(
              "Hello, yes. Only now my headaches have intensified",
              style: GoogleFonts.getFont(
                'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 10), // Space between the bubble and profile image
          // Profile Image for Response
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/icons/Dr.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
                    SizedBox(width: 10), // Space between message and time
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text and image to the start
            children: [
              SizedBox(height: 10), // Slightly below the rectangle
              Transform.translate(
                offset: Offset(-85, 57), // 2 cm to the left
                child: Row(
                  children: [
                    Text(
                      '7:21',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontSize: 12,
                        color: Color(0xFFA7A6A5),
                      ),
                    ),
                    SizedBox(width: 5), // Space between time text and image
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/icons/arrows.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),

      SizedBox(height: 40), // Space between messages


Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Image
          Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/icons/Dr.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Message Bubble
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: Color(0xFF6295E2),
              borderRadius: BorderRadius.circular(15),
            ),
            constraints: BoxConstraints(
              maxWidth: 229.88,
              minHeight: 46.25, // Height for the rectangle
            ),
            child: Text(
              'Please describe your pain',
              style: GoogleFonts.getFont(
                'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          // Space to push the time and image down and to the left
          SizedBox(width: 10), // Space between message and time
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text and image to the start
            children: [
              SizedBox(height: 10), // Slightly below the rectangle
              Transform.translate(
                offset: Offset(-55, 39), // 2 cm to the left
                child: Row(
                  children: [
                    Text(
                      '7:21',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontSize: 12,
                        color: Color(0xFFA7A6A5),
                      ),
                    ),
                    SizedBox(width: 5), // Space between time text and image
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/icons/arrows.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
            SizedBox(height: 40), // Space between messages
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  
  children: [
    // Voice Message Bubble
    
    Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      constraints: BoxConstraints(
        maxWidth: 229.88,
        minHeight: 46.25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Play Icon
          Icon(Icons.play_arrow, color: Colors.black),
          SizedBox(width: 10),
          // Voice Bar Design
          SizedBox(
            width: 130.2,
            child: Row(
              children: [
                _buildVoiceBar(6.9, 2.6, 10.3, 0xFF1C1F1E),
                _buildVoiceBar(0, 2.6, 24, 0xFF1C1F1E),
                _buildVoiceBar(1.3, 2.6, 21.4, 0xFF1C1F1E),
                _buildVoiceBar(0, 2.6, 24, 0xFF1C1F1E),
                _buildVoiceBar(4.3, 2.6, 15.4, 0xFF1C1F1E),
                _buildVoiceBar(6.9, 2.6, 10.3, 0xFF1C1F1E),
                _buildVoiceBar(6.9, 2.6, 10.3, 0xFF1C1F1E),
                _buildVoiceBar(6.9, 2.6, 10.3, 0xFF1C1F1E),
                _buildVoiceBar(4.3, 2.6, 15.4, 0xFF1C1F1E),
                _buildVoiceBar(5.6, 2.6, 12.8, 0xFFCDCFCE),
                _buildVoiceBar(0, 2.6, 24, 0xFFCDCFCE),
                _buildVoiceBar(0, 2.6, 24, 0xFFCDCFCE),
                _buildVoiceBar(9.8, 2.6, 4.3, 0xFFCDCFCE),
                _buildVoiceBar(10.7, 2.6, 2.6, 0xFFCDCFCE),
                _buildVoiceBar(10.7, 2.6, 2.6, 0xFFCDCFCE),
                _buildVoiceBar(6.9, 2.6, 10.3, 0xFFCDCFCE),
                _buildVoiceBar(8.6, 2.6, 6.9, 0xFFCDCFCE),
                _buildVoiceBar(6.9, 2.6, 10.3, 0xFFCDCFCE),
                _buildVoiceBar(8.6, 2.6, 6.9, 0xFFCDCFCE),
                _buildVoiceBar(9.8, 2.6, 4.3, 0xFFCDCFCE),
                _buildVoiceBar(10.7, 2.6, 2.6, 0xFFCDCFCE),
                _buildVoiceBar(1.3, 2.6, 21.4, 0xFFCDCFCE),
                _buildVoiceBar(0, 2.6, 24, 0xFFCDCFCE),
                _buildVoiceBar(4.3, 2.6, 15.4, 0xFFCDCFCE),
                _buildVoiceBar(6.9, 2.6, 10.3, 0xFFCDCFCE),
                _buildVoiceBar(10.7, 2.6, 2.6, 0xFFCDCFCE),
                _buildVoiceBar(8.6, 2.6, 6.9, 0xFFCDCFCE),
                _buildVoiceBar(10.7, 2.6, 2.6, 0xFFCDCFCE),
                _buildVoiceBar(8.6, 2.6, 6.9, 0xFFCDCFCE),
                _buildVoiceBar(4.3, 2.6, 15.4, 0xFFCDCFCE),
                //_buildVoiceBar(10.7, 0, 2.6, 0xFFCDCFCE),
              ],
            ),
          ),
          SizedBox(width: 10),
          // Duration Text
          Text(
            '1:24',
            style: GoogleFonts.getFont(
              'Inter',
              fontSize: 12,
              color: Color(0xFFA7A6A5),
            ),
          ),
        ],
      ),
    ),
      SizedBox(width: 10), // Space between the bubble and profile image
          // Profile Image for Response
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/icons/Dr.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
     SizedBox(width: 10), 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              SizedBox(height: 10),
              Transform.translate(
                offset: Offset(-85, 37), 
                child: Row(
                  children: [
                    Text(
                      '7:21',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontSize: 12,
                        color: Color(0xFFA7A6A5),
                      ),
                    ),
                    SizedBox(width: 5), 
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/icons/arrows.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
  ],
),
SizedBox(height: 50),
Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
      width: 20,
      height: 20,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/icons/Dr.png'),
          fit: BoxFit.cover,
        ),
      ),
    ),
    Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Color(0xFF6295E2),
        borderRadius: BorderRadius.circular(15),
      ),
      constraints: BoxConstraints(
        maxWidth: 269.88,
        minHeight: 46.25, // Height for the rectangle
      ),
      child: Row(
        children: [
          // First Image
          Container(
            width: 114.77,
            height: 148.17,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/imagechat1.png'), // Remplacez par le chemin de votre première image
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10), // Space between the two images
          // Second Image
          Container(
            width: 114.77,
            height: 148.17,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/imagechat2.png'), // Remplacez par le chemin de votre deuxième image
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ),
    SizedBox(width: 10), 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align text and image to the start
      children: [
        SizedBox(height: 10),
        Transform.translate(
          offset: Offset(-55, 160), 
          child: Row(
            children: [
              Text(
                '7:21',
                style: GoogleFonts.getFont(
                  'Inter',
                  fontSize: 12,
                  color: Color(0xFFA7A6A5),
                ),
              ),
              SizedBox(width: 5), // Space between time text and image
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/icons/onecheck.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ],
),
SizedBox(height:50 ),

  if (selectedProviderMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(selectedProviderMessage),
            ),
SizedBox(height:100 ),
SizedBox(height:100 ),


    ],
  ),
  
),

 Container(
            margin: EdgeInsets.only(top: 20), // Espacement de 5 cm (50 dp)
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Left button with an image
                GestureDetector(
                  onTap: _showAssignDialog,
                  child: Container(
                    width: 41.97,
                    height: 41.97,
                    decoration: BoxDecoration(
                      color: Color(0xFF0099D5), // Button color
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Image.asset(
                        buttonImagePath,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8), // Space between button and TextField

                // TextField
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Write a message',
                        hintStyle: TextStyle(
                          color: Color(0xFFCDCFCE),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8), // Space between TextField and right button

                // Right button with an image
                Container(
                  width: 41.97,
                  height: 41.97,
                  decoration: BoxDecoration(
                    color: Color(0xFF0AA655), // Button color
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/icons/send.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // Display the selected provider message if available
        

          // Your ListView or other content
         
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
Widget _buildVoiceBar(double top, double right, double height, int color) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, top, right, top),
    child: Container(
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.circular(1.7),
      ),
      child: Container(
        width: 1.7,
        height: height,
      ),
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
