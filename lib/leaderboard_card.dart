import 'package:flutter/material.dart';
import 'package:inrixecocoin2/coin_display.dart';
import 'package:inrixecocoin2/eco_colors.dart';
import 'package:inrixecocoin2/profile_picture.dart';
import 'package:inrixecocoin2/user_data.dart';
import 'test_data.dart';
import "user_data.dart";

Widget leaderboardCard(UserData userData) {
  return Card(
    color: ecoColors.lighterColor,
    child: Row(
      children: [
        const SizedBox(width: 20),
        ProfilePicture(user: userData), //profile picture
        const SizedBox(width: 10),
        Text(
          userData.displayName,
          style: const TextStyle(fontSize: 15, fontFamily: 'Montserrat'),
        ),
        const SizedBox(width: 10), //rank position

        Expanded(
            child: Text("@" + userData.handle,
                style: const TextStyle(
                    fontSize: 10,
                    fontFamily: 'Montserrat',
                    color: Colors.black87),
                overflow: TextOverflow.ellipsis,
                maxLines: 1)), //username
        CoinDisplay(user: userData), //coint count
      ],
    ),
  );
}
