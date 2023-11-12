import 'package:flutter/material.dart';
import 'package:inrixecocoin2/user_data.dart';
import 'leaderboard_card.dart';
import 'test_data.dart';
import 'eco_colors.dart';

class LeaderboardTab extends StatelessWidget {
  const LeaderboardTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ecoColors.mainColor,
        title: Text(
          "Leaderboard",
          style: TextStyle(
              color: ecoColors.darkColor,
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
                      backgroundColor: ecoColors.mainShadow),
                  onPressed: () {},
                  icon: Icon(Icons.account_circle, color: ecoColors.darkColor),
                  label: Text("Local",
                      style: TextStyle(
                          color: ecoColors.darkColor,
                          fontSize: 20,
                          fontFamily: 'Montserrat')),
                ),
              ),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ecoColors.mainShadow),
                  onPressed: () {},
                  icon: Icon(Icons.airplanemode_active,
                      color: ecoColors.darkColor),
                  label: Text(
                    "Global",
                    style: TextStyle(
                      color: ecoColors.darkColor,
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
              itemCount: testUsers.length,
              itemBuilder: (context, index) {
                return leaderboardCard(testUsers[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

/*List<UserData> leaderBoardList = [
  UserData(image: "dog.url", handle: "balls", displayName: "Jonathan Balls")
];*/