import 'package:flutter/material.dart';
import 'activity_feed.dart';
import 'coin_display.dart';
import 'bottom_nav_bar.dart';
import 'user_data.dart';
import 'eco_colors.dart';

class Home extends StatefulWidget {
  final UserData user;
  Home({required this.user});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.user.displayName,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 24.0,
            color: ecoColors.lighterColor,
          ),
        ),
        backgroundColor: ecoColors.mainShadow,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
              child: CoinDisplay(user: widget.user),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 4.0, 8.0),
              child: Text(
                "Your Feed",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: ecoColors.darkColor,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          ActivityFeed(),
          SizedBox(
            height: 10.0,
          )
        ],
      ),
      backgroundColor: ecoColors.lightColor,
      bottomNavigationBar: mainNavigationBar,
    );
  }
}

//THIS IS A COMMENT TO TEST
//This is something else