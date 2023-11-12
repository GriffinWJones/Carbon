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

class ProfilePage extends StatefulWidget {
  UserData user;
  ProfilePage({required this.user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController addFriendController = TextEditingController();

  void sS(UserData d) {
    setState(() {
      widget.user = d;
      print(widget.user.friends);
    });
  }

  @override
  Widget build(BuildContext context) {
    String friendsString = widget.user.friends.replaceAll(RegExp(r'[{}]'), '');
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
              const SizedBox(height: 50),
              Center(
                child: ProfilePicture(user: widget.user, size: 120),
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       makeFriend(user.handle, "j_money");
              //     },
              //     child: Text("add")),
              CoinDisplay(user: widget.user),
              const SizedBox(height: 10),
              Center(
                  child: Text(widget.user.displayName,
                      style: TextStyle(
                        color: ecoColors.lighterColor,
                        fontSize: 30,
                        fontFamily: 'Montserrat',
                      ))),
              const Center(child: SizedBox(height: 10)),
              Center(
                  child: Text('@${widget.user.handle}',
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
                height: 330,
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
                height: 130,
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: ecoColors.mainColor,
          onPressed: () {
            _showPopup(context);
          },
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: const MainBottomNavBar());
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ecoColors.darkColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Add Friend',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 25,
                  color: ecoColors.lighterColor,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close),
                color: ecoColors.lighterColor,
                onPressed: () {
                  Navigator.pop(context); // Close the popup
                },
              ),
            ],
          ),
          content: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: 200.0), // Set your desired max height
            child: Column(
              children: [
                TextField(
                  controller: addFriendController,
                  style: TextStyle(color: ecoColors.lighterColor),
                  decoration: InputDecoration(
                    labelText: 'Enter text',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      color: ecoColors.lightColor,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      ecoColors.mainColor,
                    ), // Set your desired color
                  ),
                  onPressed: () {
                    makeFriend(
                        widget.user.handle, addFriendController.text, sS);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ADD',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      color: ecoColors.lightColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class FriendCardCreator extends StatefulWidget {
  final Future<UserData> friendData;
  FriendCardCreator({required this.friendData});

  @override
  State<FriendCardCreator> createState() => _FriendCardCreatorState();
}

class _FriendCardCreatorState extends State<FriendCardCreator> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserData>(
      future: widget.friendData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Or any loading indicator
        } else if (snapshot.hasError) {
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

Future<void> makeFriend(
    String username, String friendUsername, Function sS) async {
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

        UserData newUser = await GetUserDataObject(username);

        sS(newUser);
      }
    } else {
      throw Exception('User not found for username: $username');
    }
  } catch (e) {
    print("Error: $e");
    throw Exception('User not found for username: $username');
    // Handle the error appropriately
  }
}
