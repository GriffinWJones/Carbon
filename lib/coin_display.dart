import 'package:flutter/material.dart';
import 'user_data.dart';
import 'eco_colors.dart';

class CoinDisplay extends StatelessWidget {
  final UserData user;
  final double size;
  CoinDisplay({required this.user, this.size = 15});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0), // Add padding if needed
      decoration: BoxDecoration(
        color: ecoColors.mainShadow, // Set your desired background color
        borderRadius:
            BorderRadius.circular(50.0), // This makes the container oval
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // To keep the row size to a minimum
        children: <Widget>[
          ClipOval(
            child: Image.network(
              'https://t3.ftcdn.net/jpg/00/41/77/26/360_F_41772692_XyDHzeGLBCcl7q1MR0mMrXUNjiOwQT6o.jpg', // Replace with your image URL or asset
              width: size, // Set your desired width
              height: size, // Set your desired height
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
          ),
          const SizedBox(width: 8.0), // Space between the image and text
          Text(
            user.coinCount.toString(), // Replace with your desired text
            style: TextStyle(
              color: ecoColors.lighterColor,
              fontSize: 20,
            ), // Set your desired text style
          ),
        ],
      ),
    );
  }
}
