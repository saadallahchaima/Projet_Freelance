import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khedma/screens/MainPages/HomePage.dart';

import '../../theme/AppTheme.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 133,
          height: 46,
          child: InkWell(
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 133,
                    height: 46,
                    decoration: ShapeDecoration(
                      color: AppTheme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 31,
                  top: 15,
                  child: SizedBox(
                    width: 71,
                    height: 17,
                    child: Text(
                      'Connexion',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
