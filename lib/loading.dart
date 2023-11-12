import 'package:flutter/material.dart';
import 'eco_colors.dart';
import 'dart:async';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
    return Scaffold(
      backgroundColor: ecoColors.darkerShadow,
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Image.asset('lib/images/logo.png',
                width: 100.0, // Set your desired width
                height: 100.0),
            SizedBox(
              height: 10,
            ),
            Text(
              "CARBON",
              style: TextStyle(
                color: ecoColors.lighterColor,
                fontFamily: "Montserrat",
                fontSize: 40,
                fontWeight: FontWeight.w200,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
