import 'package:flutter/material.dart';
import 'package:inrixecocoin2/coin_display.dart';
import 'package:inrixecocoin2/eco_colors.dart';
import 'package:inrixecocoin2/profile_picture.dart';
import 'package:inrixecocoin2/user_data.dart';
import 'test_data.dart';
import "user_data.dart";

Widget CarpoolRequest(UserData userData) {
  return Card(
    color: ecoColors.lighterColor,
    child: Row(
      children: [
        SizedBox(width: 20),
        ProfilePicture(user: userData), //profile picture
        SizedBox(width: 10),
        Text(
          userData.displayName,
          style: TextStyle(fontSize: 15, fontFamily: 'Montserrat'),
        ),
        SizedBox(width: 10), //rank position

        Expanded(
            child: Text('is requesting a carpool',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    color: Colors.black87),
                overflow: TextOverflow.ellipsis,
                maxLines: 1)
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.check),
          color: Colors.green,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.close),
          color: Colors.red,
        ), //username
      ],
    ),
  );
}