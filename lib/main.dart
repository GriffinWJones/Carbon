import 'package:flutter/material.dart';
import 'package:inrixecocoin2/carpool.dart';
import 'package:inrixecocoin2/leaderboard.dart';
import 'package:inrixecocoin2/profile_page.dart';
import 'package:inrixecocoin2/test_widget.dart';
import 'home.dart';
import 'test_data.dart';
import 'profile_page.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/': (context) => Carpool(),
        '/home': (context) => Home(user: testUsers[0]),
        '/test': (context) => Test(),
      },
    ));
