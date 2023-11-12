import 'package:flutter/material.dart';
import 'package:inrixecocoin2/activity_post.dart';
import 'package:inrixecocoin2/friend_card.dart';
import 'bottom_nav_bar.dart';
import 'profile_picture.dart';
import 'user_data.dart';
import 'test_data.dart';
import 'eco_colors.dart';


class ProfilePage extends StatelessWidget {
  final UserData user;
  ProfilePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
        color: ecoColors.accentColor,
        child: Column(
          children: [
            const Center(child: SizedBox(height: 50)),
            Center(child: ProfilePicture(user: user, size: 200)),
            const Center(child: SizedBox(height: 20)),
            Center(child: Text("Username", style: TextStyle(
              fontSize: 30,
              fontFamily: 'Montserrat',
            ))),
            const Center(child: SizedBox(height: 10)),
            Center(child: Text("Handle", style: TextStyle(
              fontSize: 20,
              fontFamily: 'Montserrat',
            ))),
            const Center(child: SizedBox(height: 10)),
            Container(padding: EdgeInsets.all(8.0), // Adds padding inside the border
            decoration: BoxDecoration(
            //border: Border.all(color: Colors.black, width: 1.0),
            color: ecoColors.lightColor,
            ),
            height: 250,
            child: SingleChildScrollView(
              child: Column(children: [
                const Text("Post List:"),
                ActivityPost(postData: testPosts[0]),
                ActivityPost(postData: testPosts[1]),
                ActivityPost(postData: testPosts[2]),
                ActivityPost(postData: testPosts[3]),
                ActivityPost(postData: testPosts[4]),
                    ],),
            ),
        ),
            Container(padding: EdgeInsets.all(8.0), // Adds padding inside the border
                decoration: BoxDecoration(
                //border: Border.all(color: Colors.black, width: 1.0),
                color: ecoColors.mainColor,
                ),
                height: 241,
                child: SingleChildScrollView(
                  child: Column(children: [
                    const Text("Friend's List:"),
                    FriendCard(user: testUsers[0]),
                    FriendCard(user: testUsers[1]),
                    FriendCard(user: testUsers[2]),
                    FriendCard(user: testUsers[3]),
                    FriendCard(user: testUsers[4]),
                    ],),
                ),
            ),
          ]),
      ),
      bottomNavigationBar: mainNavigationBar
    );
  }
}