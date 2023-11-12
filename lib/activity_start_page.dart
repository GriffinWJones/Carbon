import 'package:flutter/material.dart';
import 'package:inrixecocoin2/eco_colors.dart';
import 'bottom_nav_bar.dart';

class ActivityStartPage extends StatefulWidget {
  const ActivityStartPage({Key? key}) : super(key: key);

  @override
  _ActivityStartPageState createState() => _ActivityStartPageState();
}

class _ActivityStartPageState extends State<ActivityStartPage> {
  IconData selectedIcon = Icons.people_alt_sharp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ecoColors.lightColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
          child: IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: ecoColors.darkColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildIconButton(Icons.people_alt_sharp, size: 35.0),
                        buildIconButton(Icons.pedal_bike_sharp, size: 35.0),
                        buildIconButton(Icons.directions_walk_sharp,
                            size: 35.0),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ecoColors
                            .mainShadow, // Set the background color of the button
                      ),
                      onPressed: () {},
                      child: Text(
                        "START",
                        style: TextStyle(color: ecoColors.lighterColor),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: MainBottomNavBar(),
    );
  }

  IconButton buildIconButton(IconData icon, {required double size}) {
    return IconButton(
      onPressed: () {
        setState(() {
          selectedIcon = icon;
        });
      },
      icon: Icon(
        icon,
        color: icon == selectedIcon
            ? ecoColors.mainColor // Set the selected icon color
            : ecoColors.lighterColor,
        size: size,
      ),
    );
  }
}
