import 'package:flutter/material.dart';

/*
What you need in the State<NAME_OF_STATEFUL_WIDGET>, uncomment the currentIndex and onTop when done

  int _selectedIndex = 0;

  void _updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  
*/

BottomNavigationBar mainNavigationBar = BottomNavigationBar(
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bus_alert),
      label: 'Carpool',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add),
      label: 'Activity',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.trending_up),
      label: 'Leaderboard',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ],
  // currentIndex: _selectedIndex,
  // onTap: _updateIndex,
  selectedItemColor: const Color.fromARGB(255, 36, 98, 39),
  unselectedItemColor: Colors.green,
);
