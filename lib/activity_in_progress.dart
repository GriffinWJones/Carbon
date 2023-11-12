import 'package:flutter/material.dart';
import 'package:inrixecocoin2/eco_colors.dart';
import 'package:inrixecocoin2/get_distance.dart';
import 'package:inrixecocoin2/map_display.dart';
import 'package:inrixecocoin2/user_data.dart';
import 'bottom_nav_bar.dart';
import 'coin_display.dart';
import 'map_display.dart';
import 'get_distance.dart';

// GlobalKey<MapScreen> mapScreenKey = GlobalKey();

void showCustomDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'GOOD JOB!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(
                    context, '/activityStart'); // Close the popup
              },
            ),
          ],
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(
                        context, '/activityStart'); // Close the popup
                  },
                  child: Text('Okay'),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

class ActivityInProgressPage extends StatefulWidget {
  UserData user;
  ActivityInProgressPage({required this.user});

  @override
  State<ActivityInProgressPage> createState() => _ActivityInProgressPageState();
}

GlobalKey<MapScreenState> mapScreenKey = GlobalKey();

class _ActivityInProgressPageState extends State<ActivityInProgressPage> {
  IconData selectedIcon = Icons.people_alt_sharp;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MapScreen(key: mapScreenKey),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                CoinDisplay(user: widget.user),
                Spacer(),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(200, 50)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.red,
                    ),
                  ),
                  onPressed: () async {
                    int coinsEarned = await totalDistanceToCoinsEarned(
                        await getTotalDistance(
                            WP_1: mapScreenKey.currentState!.getStartPos(),
                            WP_2: mapScreenKey.currentState!.getEndPos()));
                    setState(() {
                      widget.user.coinCount += 4;
                    });
                    showCustomDialog(context,
                        "Congradulations! You've eared ${coinsEarned} CarbonCoins!");
                  },
                  child: Text(
                    "STOP",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
