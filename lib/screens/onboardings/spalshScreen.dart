import 'package:flutter/material.dart';
import 'dart:async';


import 'AllBordings.dart';


class SplashPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Future.delayed(Duration(milliseconds: 500), route);
    });
  }
  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AllBoardings()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }
  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 7, // x-coordinate
            top: 217, // y-coordinate
            child: Container(
              width: 361, // width of the logo
              height: 189, // height of the logo
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          Positioned(
            bottom: 170, // Distance from the bottom
            left: MediaQuery.of(context).size.width * 0.5 - 20, // Center horizontally
            child: Container(
              width: 40, // Width of the progress indicator
              height: 40, // Height of the progress indicator
              child: CircularProgressIndicator(
                strokeWidth: 6.0, // Thickness of the circular progress indicator
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
