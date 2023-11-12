import 'package:flutter/material.dart';
import 'eco_colors.dart';

/*
What you need in the State<NAME_OF_STATEFUL_WIDGET>, uncomment the currentIndex and onTop when done

  int _selectedIndex = 0;

  void _updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  
*/

BottomNavigationBar mainNavigationBar = BottomNavigationBar(
  items: [
    BottomNavigationBarItem(
      icon: const Icon(Icons.home),
      label: 'Home',
      backgroundColor: ecoColors.lighterColor,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.bus_alert),
      label: 'Carpool',
      backgroundColor: ecoColors.lighterColor,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.add),
      label: 'Activity',
      backgroundColor: ecoColors.lighterColor,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.trending_up),
      label: 'Leaderboard',
      backgroundColor: ecoColors.lighterColor,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.person),
      label: 'Profile',
      backgroundColor: ecoColors.lighterColor,
    ),
  ],
  // currentIndex: _selectedIndex,
  // onTap: _updateIndex,
  selectedItemColor: ecoColors.mainShadow,
  unselectedItemColor: ecoColors.mainColor,
);