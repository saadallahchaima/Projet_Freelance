import 'package:flutter/material.dart';
import 'onboarding1.dart';
import 'onboarding2.dart';
import 'onbording3.dart';

class AllBoardings extends StatefulWidget {
  @override
  _AllBoardingsState createState() => _AllBoardingsState();
}

class _AllBoardingsState extends State<AllBoardings> {
  final PageController _controller = PageController();
  double currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.hasClients && _controller.page != null) {
        setState(() {
          currentPage = _controller.page!;
        });
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
          PageView(
            controller: _controller,
            physics: AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              Onboarding1(controller: _controller),
              Onboarding2(controller: _controller),
              Onboarding3(controller: _controller),

              // Add more Onboarding screens here if needed
            ],
          ),
        ],
      ),
    );
  }
}
