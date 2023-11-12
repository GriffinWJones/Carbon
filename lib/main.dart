import 'package:flutter/material.dart';
import 'package:inrixecocoin2/leaderboard.dart';
import 'package:inrixecocoin2/test_widget.dart';
import 'home.dart';
import 'test_data.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/leaderboard',
      routes: {
        '/': (context) => LeaderboardTab(),
        '/home': (context) => Home(user: testUsers[0]),
        '/test': (context) => Test(),
      },
    ));
