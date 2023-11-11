import 'package:flutter/material.dart';
import 'activity_feed.dart';
import 'coin_display.dart';
import 'bottom_nav_bar.dart';
import 'user_data.dart';

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
      appBar: AppBar(title: Text(widget.user.displayName)),
      body: Column(
        children: [
          CoinDisplay(user: widget.user),
          ActivityFeed(),
        ],
      ),
      bottomNavigationBar: mainNavigationBar,
    );
  }
}
