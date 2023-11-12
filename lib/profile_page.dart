import 'package:flutter/material.dart';
import 'package:inrixecocoin2/activity_post.dart';
import 'package:inrixecocoin2/coin_display.dart';
import 'package:inrixecocoin2/friend_card.dart';
import 'bottom_nav_bar.dart';
import 'profile_picture.dart';
import 'user_data.dart';
import 'test_data.dart';
import 'eco_colors.dart';
import 'user.dart';

class ProfilePage extends StatelessWidget {
  final UserData user;
  ProfilePage({required this.user});

  @override
  Widget build(BuildContext context) {
    String friendsString = user.friends.replaceAll(RegExp(r'[{}]'), '');
    List<String> friends = friendsString
        .split(',')
        .where((username) => username.isNotEmpty)
        .toList();
    return Scaffold(
        body: Container(
          color: ecoColors.lightColor,
          child: Container(
            decoration: BoxDecoration(
              color: ecoColors.mainShadow,
            ),
            child: Column(children: [
              const SizedBox(height: 100),
              Center(
                child: ProfilePicture(user: user, size: 120),
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       makeFriend(user.handle, "j_money");
              //     },
              //     child: Text("add")),
              CoinDisplay(user: user),
              const SizedBox(height: 10),
              Center(
                  child: Text(user.displayName,
                      style: TextStyle(
                        color: ecoColors.lighterColor,
                        fontSize: 30,
                        fontFamily: 'Montserrat',
                      ))),
              const Center(child: SizedBox(height: 10)),
              Center(
                  child: Text('@${user.handle}',
                      style: TextStyle(
                        color: ecoColors.lighterColor,
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                      ))),
              const Center(child: SizedBox(height: 10)),
              Container(
                padding:
                    const EdgeInsets.all(8.0), // Adds padding inside the border
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.black, width: 1.0),
                  color: ecoColors.lightColor,
                ),
                height: 230,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Post List:",
                        style: TextStyle(
                          color: ecoColors.darkColor,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      ActivityPost(postData: testPosts[0]),
                      ActivityPost(postData: testPosts[1]),
                      ActivityPost(postData: testPosts[2]),
                      ActivityPost(postData: testPosts[3]),
                      ActivityPost(postData: testPosts[4]),
                    ],
                  ),
                ),
              ),
              const Divider(
                height:
                    20, // Adjust the height to make it smaller// You can also customize the color
              ),
              Container(
                padding:
                    const EdgeInsets.all(8.0), // Adds padding inside the border
                decoration: BoxDecoration(
                  //border: Border.all(color: Colors.black, width: 1.0),
                  color: ecoColors.lightColor,
                ),
                height: 220,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Friend's List:",
                        style: TextStyle(
                          color: ecoColors.darkColor,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Column(
                          children: friends.map((friend) {
                        return FriendCardCreator(
                            friendData: GetUserDataObject(friend));
                      }).toList()),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
        bottomNavigationBar: const MainBottomNavBar());
  }
}

class FriendCardCreator extends StatelessWidget {
  final Future<UserData> friendData;
  FriendCardCreator({required this.friendData});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserData>(
      future: friendData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Or any loading indicator
        } else if (snapshot.hasError) {
          print("2");
          return Text('Error: ${snapshot.error}');
        } else {
          UserData result = snapshot.data!;
          // Use the result to build your UI
          return FriendCard(user: result);
        }
      },
    );
  }
}

Future<UserData> GetUserDataObject(String username) async {
  User? friend = await User.fetchUser(username);

  if (friend != null) {
    return UserData(
      image: friend.image,
      handle: friend.username,
      displayName: friend.displayName,
      coinCount: friend.coins,
      posts: friend.posts
          as String, // Assuming posts is of type String in UserData
      friends: friend.friends,
    );
  } else {
    // Handle the case where the user is not found
    throw Exception('User not found for username: $username');
  }
}

Future<void> makeFriend(String username, String friendUsername) async {
  try {
    final response1 = await DatabaseHelper.client
        .from('user_table')
        .select('friends')
        .eq('username', username)
        .single();

    final response2 = await DatabaseHelper.client
        .from('user_table')
        .select('friends')
        .eq('username', friendUsername)
        .single();

    if (response1 != null && response2 != null) {
      String currentFriends1 = response1['friends'] ?? '';
      String currentFriends2 = response2['friends'] ?? '';

      if (!currentFriends1.split(',').contains(friendUsername)) {
        String updatedFriends1 = currentFriends1.isEmpty
            ? friendUsername
            : '$currentFriends1,$friendUsername';

        // Update the user's friends list
        await DatabaseHelper.client
            .from('user_table')
            .update({'friends': updatedFriends1}).eq('username', username);
      }

      if (!currentFriends2.split(',').contains(username)) {
        String updatedFriends2 =
            currentFriends2.isEmpty ? username : '$currentFriends2,$username';

        // Update the friend's friends list
        await DatabaseHelper.client.from('user_table').update(
            {'friends': updatedFriends2}).eq('username', friendUsername);
      }
    } else {
      print("Response is null");
    }
  } catch (e) {
    print("Error: $e");
    // Handle the error appropriately
  }
}
