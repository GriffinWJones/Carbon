import 'package:flutter/material.dart';
import 'package:inrixecocoin2/user_data.dart';
import 'leaderboard_card.dart';
import 'test_data.dart';
import 'eco_colors.dart';
import 'bottom_nav_bar.dart';

class LeaderboardTab extends StatelessWidget {
  final UserData activeUser;
  LeaderboardTab({required this.activeUser});
  List<UserData> sortedUsers = List.from(testUsers)
    ..sort((a, b) => b.coinCount.compareTo(a.coinCount));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ecoColors.mainShadow,
        title: Text(
          "Leaderboard",
          style: TextStyle(
              color: ecoColors.lighterColor,
              fontSize: 40,
              fontFamily: 'Montserrat'),
        ),
        centerTitle: true,
      ),
      backgroundColor: ecoColors.lightColor,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ecoColors.mainShadow,
                    shape: null,
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.account_circle, color: ecoColors.lightColor),
                  label: Text("Local",
                      style: TextStyle(
                          color: ecoColors.lightColor,
                          fontSize: 20,
                          fontFamily: 'Montserrat')),
                ),
              ),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ecoColors.mainShadow,
                    shape: null,
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.airplanemode_active,
                      color: ecoColors.lightColor),
                  label: Text(
                    "Global",
                    style: TextStyle(
                      color: ecoColors.lightColor,
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sortedUsers.length,
              itemBuilder: (context, index) {
                return leaderboardCard(activeUser, sortedUsers[index], index);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: MainBottomNavBar(),
    );
  }
}

/*List<UserData> leaderBoardList = [
  UserData(image: "dog.url", handle: "balls", displayName: "Jonathan Balls")
];*/