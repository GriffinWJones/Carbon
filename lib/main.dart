import 'package:flutter/material.dart';
import 'package:inrixecocoin2/loading.dart';
import 'package:inrixecocoin2/test_widget.dart';
import 'package:inrixecocoin2/user_data.dart';
import 'home.dart';
import 'test_data.dart';
import 'activity_start_page.dart';
import 'leaderboard.dart';
import 'profile_page.dart';
import 'login_page.dart';
import 'create_account.dart';
import 'current_user.dart';

void main() {
  UserData currentUser = CURRENT_USER;
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) {
          currentUser = CURRENT_USER;
          return Loading();
        },
        '/loading': (context) {
          currentUser = CURRENT_USER;
          return Loading();
        },
        '/login': (context) {
          currentUser = CURRENT_USER;
          return LoginPage();
        },
        '/createAccount': (context) {
          currentUser = CURRENT_USER;
          return CreateAccountPage();
        },
        '/home': (context) {
          currentUser = CURRENT_USER;
          return Home(user: currentUser);
        },
        '/profile': (context) {
          currentUser = CURRENT_USER;
          return ProfilePage(user: currentUser);
        },
        '/activityStart': (context) {
          currentUser = CURRENT_USER;
          return ActivityStartPage();
        },
        '/leaderboard': (context) {
          currentUser = CURRENT_USER;
          return LeaderboardTab(activeUser: currentUser);
        },
        '/test': (context) {
          currentUser = CURRENT_USER;
          return Test();
        },
      },
    ),
  );
}
