import 'package:flutter/material.dart';
import 'package:inrixecocoin2/coin_display.dart';
import 'package:inrixecocoin2/profile_picture.dart';
import 'package:inrixecocoin2/user_data.dart';
import 'test_data.dart';
import "user_data.dart";

Widget leaderboardCard(UserData userData) {
  return Card(
    child: Row(
        children: [
          Text('1'), //rank position
          SizedBox(width: 20),
          ProfilePicture(user: userData), //profile picture
          SizedBox(width: 10),
          Expanded(child: Text("Name000000000000000000000001", overflow: TextOverflow.ellipsis, maxLines: 1)), //username
          CoinDisplay(user: userData), //coint count
        ],
      ),
  );
}

