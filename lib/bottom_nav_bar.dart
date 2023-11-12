import 'package:flutter/material.dart';
import 'eco_colors.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int _selectedIndex = 0;

  void _updateIndex(int index, String label) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
        Navigator.pushReplacementNamed(context, label);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String currentRoute = ModalRoute.of(context)!.settings.name ?? "/";
    int selIdexTemp = 0;
    switch (currentRoute) {
      case '/home':
        selIdexTemp = 0;
        break;
      case '/carpool':
        selIdexTemp = 1;
        break;
      case '/activityStart':
        selIdexTemp = 2;
        break;
      case '/leaderboard':
        selIdexTemp = 3;
        break;
      case '/profile':
        selIdexTemp = 4;
        break;
    }
    if (_selectedIndex != selIdexTemp) {
      setState(() {
        _selectedIndex = selIdexTemp;
      });
    }

    return BottomNavigationBar(
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
      selectedItemColor: ecoColors.mainShadow,
      unselectedItemColor: ecoColors.mainColor,
      currentIndex: _selectedIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            _updateIndex(index, '/home');
            break;
          case 1:
            _updateIndex(index, '/carpool');
            break;
          case 2:
            _updateIndex(index, '/activityStart');
            break;
          case 3:
            _updateIndex(index, '/leaderboard');
            break;
          case 4:
            _updateIndex(index, '/profile');
            break;
        }
      },
    );
  }
}
