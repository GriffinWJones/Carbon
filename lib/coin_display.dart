import 'package:flutter/material.dart';
import 'user_data.dart';

class CoinDisplay extends StatelessWidget {
  final UserData user;
  CoinDisplay({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0), // Add padding if needed
      decoration: BoxDecoration(
        color: const Color.fromARGB(
            255, 255, 255, 255), // Set your desired background color
        borderRadius:
            BorderRadius.circular(50.0), // This makes the container oval
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // To keep the row size to a minimum
        children: <Widget>[
          ClipOval(
            child: Image.network(
              'https://t3.ftcdn.net/jpg/00/41/77/26/360_F_41772692_XyDHzeGLBCcl7q1MR0mMrXUNjiOwQT6o.jpg', // Replace with your image URL or asset
              width: 40.0, // Set your desired width
              height: 40.0, // Set your desired height
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
          ),
          const SizedBox(width: 8.0), // Space between the image and text
          const Text(
            '100,000', // Replace with your desired text
            style: TextStyle(
                color: Color.fromARGB(
                    255, 0, 0, 0)), // Set your desired text style
          ),
        ],
      ),
    );
  }
}
