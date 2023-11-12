import 'package:flutter/material.dart';
import 'package:inrixecocoin2/coin_display.dart';
import 'package:inrixecocoin2/eco_colors.dart';
import 'package:inrixecocoin2/profile_picture.dart';
import 'package:inrixecocoin2/user_data.dart';
import 'test_data.dart';
import "user_data.dart";

Widget leaderboardCard(UserData activeUser, UserData userData, int index) {
  Color userColor =
      userData == activeUser ? ecoColors.mainColor : ecoColors.lighterColor;
  return Card(
    color: userColor,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Text(
            '${index + 1}',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: ecoColors.darkColor,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          ProfilePicture(
            user: userData,
            size: 40.0,
          ), //profile picture
          const SizedBox(width: 10),
          Text(
            userData.displayName,
            style: const TextStyle(fontSize: 15, fontFamily: 'Montserrat'),
          ),
          const SizedBox(width: 10), //rank position

          Expanded(
              child: Text('@${userData.displayName}',
                  style: const TextStyle(
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      color: Colors.black87),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1)), //username
          CoinDisplay(user: userData), //coint count
        ],
      ),
    ),
  );
}
