import 'package:flutter/material.dart';
import 'user.dart';

class UserInfoPage extends StatelessWidget {
  final User user;

  UserInfoPage({Key? key, required this.user}) : super(key: key);

  Future<List<String>> _fetchFriends() async {
    try {
      final response = await DatabaseHelper.client
          .from('user_table')
          .select('friends')
          .eq('username', user.username)
          .single();

      if (response != null) {
        String friendsString = response['friends'] ?? '';
        // Remove any curly braces and split by comma
        friendsString = friendsString.replaceAll(RegExp(r'[{}]'), '');
        return friendsString
            .split(',')
            .where((username) => username.isNotEmpty)
            .toList();
      }
      return [];
    } catch (e) {
      print('Error fetching friends: $e');
      return [];
    }
  }

  Future<List<Map<String, String>>> _fetchPosts() async {
    try {
      final response = await DatabaseHelper.client
          .from('user_table')
          .select('posts')
          .eq('username', user.username)
          .single();

      if (response != null && response['posts'] != null) {
        String postsString = response['posts'];
        List<Map<String, String>> posts = postsString.split(',').map((post) {
          List<String> parts = post.split('#');
          return {
            "location": parts[0],
            "description": parts.length > 1 ? parts[1] : ""
          };
        }).toList();
        return posts;
      }
      return [];
    } catch (e) {
      print('Error fetching posts: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: ${user.username}', style: TextStyle(fontSize: 18)),
            Text('Coins: ${user.coins}', style: TextStyle(fontSize: 18)),
            ElevatedButton(
              onPressed: () => _showAddFriendDialog(context),
              child: Text('Add Friend'),
            ),
            ElevatedButton(
              onPressed: () => _showIncomingRequests(context),
              child: Text('View Friend Requests'),
            ),
            ElevatedButton(
              onPressed: () => _showNewPostDialog(context),
              child: Text('New Post'),
            ),
            SizedBox(height: 20),
            Text('Friends:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            FutureBuilder<List<String>>(
              future: _fetchFriends(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index]),
                      );
                    },
                  );
                }
                return Center(child: Text('No friends found'));
              },
            ),
            SizedBox(height: 20),
            Text('Posts:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            FutureBuilder<List<Map<String, String>>>(
              future: _fetchPosts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var post = snapshot.data![index];
                      return ListTile(
                        title: Text(post['location'] ?? ''),
                        subtitle: Text(post['description'] ?? ''),
                      );
                    },
                  );
                }
                return Text('No posts found');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showNewPostDialog(BuildContext context) {
    TextEditingController locationController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('New Post'),
          content: Column(
            mainAxisSize: MainAxisSize.min, // To control the size of the dialog
            children: [
              TextField(
                controller: locationController,
                decoration: InputDecoration(hintText: "Location"),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(hintText: "Description"),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Create Post'),
              onPressed: () {
                String location = locationController.text;
                String description = descriptionController.text;
                if (location.isNotEmpty && description.isNotEmpty) {
                  //User.createPost(user.username, location, description);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _showAddFriendDialog(BuildContext context) {
    TextEditingController friendUsernameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Friend'),
          content: TextField(
            controller: friendUsernameController,
            decoration: InputDecoration(hintText: "Enter friend's username"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                String friendUsername = friendUsernameController.text;
                if (friendUsername.isNotEmpty) {
                  User.sendFriendRequest(user.username, friendUsername);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('Friend request sent to $friendUsername')),
                  );
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showIncomingRequests(BuildContext context) {
    User.fetchIncomingRequests(user.username).then((requestsString) {
      List<String> incomingRequests = requestsString
          .split(',')
          .where((username) => username.isNotEmpty)
          .toList();

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Friend Requests'),
            content: Container(
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: incomingRequests.length,
                itemBuilder: (context, index) {
                  String friendUsername = incomingRequests[index].trim();

                  return ListTile(
                    title: Text(friendUsername),
                    trailing: Wrap(
                      spacing: 8, // Space between buttons
                      children: [
                        IconButton(
                          icon: Icon(Icons.check),
                          onPressed: () {
                            User.acceptFriendRequest(
                                user.username, friendUsername);
                            // Optionally, refresh the list or show a message
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            User.denyFriendRequest(
                                user.username, friendUsername);
                            // Optionally, refresh the list or show a message
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      );
    });
  }
}
