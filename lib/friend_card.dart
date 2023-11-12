import 'package:flutter/material.dart';
import 'package:inrixecocoin2/coin_display.dart';
import 'package:inrixecocoin2/profile_picture.dart';
import 'package:inrixecocoin2/user_data.dart';
import 'test_data.dart';
import "user_data.dart";
import 'eco_colors.dart';

class FriendCard extends StatelessWidget {
  final UserData user;
  const FriendCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Adjust the radius here
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
            height: 50,
            color: ecoColors.lighterColor,
            child: Row(
              children: [
                ProfilePicture(user: user, size: 40), //profile picture
                SizedBox(width: 10),
                Expanded(
                    child: Text("My Friend :)",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1)), //username
                CoinDisplay(user: user), //coint count
              ],
            ),
          )),
    );
  }
}
