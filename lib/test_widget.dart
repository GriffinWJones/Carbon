import 'package:flutter/material.dart';
import 'package:inrixecocoin2/user_data.dart';
import 'leaderboard_card.dart';
import 'test_data.dart';

// class Test extends StatelessWidget {
//   const Test({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(),
//     );
//   }
// }

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: leaderboardCard(
        UserData(image: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.buzzfeed.com%2Fishabassi%2Fcute-animal-photos&psig=AOvVaw0pnPjm7ywhPLcQXxzraOCl&ust=1699839413807000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCJj4tLepvYIDFQAAAAAdAAAAABAD", 
        handle: "handle", 
        displayName: "displayName"
      ),
      )
    );
  }
}
