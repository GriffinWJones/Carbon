import 'package:flutter/material.dart';

class ExampleCard extends StatelessWidget {
  int rank = 0;
  String username = "";
  String image = "";

  ExampleCard(
      {required this.rank, required this.username, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LeaderboardTab extends StatelessWidget {
  const LeaderboardTab({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Leaderboard",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.star),
                label: Text("Button 1"),
              ),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.star),
                  label: Text("Button 2"))
            ],
          ),
          ListView.builder(
              itemCount: leaderBoardList.length,
              itemBuilder: (context, index) {
                return ExampleCard(rank: 1, username: "User1", image: "image1");
              })
        ],
      ),
    );
  }
}

List<ExampleCard> leaderBoardList = [];
