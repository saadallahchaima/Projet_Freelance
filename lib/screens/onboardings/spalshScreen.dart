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
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double height = constraints.maxHeight;

          return Stack(
            children: [
              Container(
                width: width,
                height: height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: width * 0.1, // 10% from left
                top: height * 0.3, // 30% from top
                child: Container(
                  width: width * 0.8, // 80% of screen width
                  height: height * 0.2, // 20% of screen height
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              Positioned(
                bottom: height * 0.2, // 20% from bottom
                left: (width - 40) / 2, // Center horizontally
                child: Container(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    strokeWidth: 6.0,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
