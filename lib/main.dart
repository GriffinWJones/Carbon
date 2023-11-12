import 'package:flutter/material.dart';
import 'package:inrixecocoin2/test_widget.dart';
import 'home.dart';
import 'test_data.dart';
import 'loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/loading',
      routes: {
        '/': (context) => Test(),
        '/home': (context) => Home(user: testUsers[0]),
        '/loading': (context) => Loading(),
        '/test': (context) => Test(),
      },
    ));
