import 'package:supabase/supabase.dart';

class DatabaseHelper {
  static final String supabaseUrl = 'https://wxdzcdulxfpywkoiruiz.supabase.co';
  static final String supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind4ZHpjZHVseGZweXdrb2lydWl6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTk3NDQ0NzIsImV4cCI6MjAxNTMyMDQ3Mn0.Yxf8Y2SODsML2wE0Hl2AG8GrrmboAQr2bLyo4QO3Pfc';
  static final SupabaseClient client = SupabaseClient(supabaseUrl, supabaseKey);
}

class User {
  String username;
  String password;
  int coins;
  String friends;
  String displayName;
  String posts;
  String image;

  User({
    required this.username,
    required this.password,
    required this.displayName,
    this.image = "",
    this.coins = 0,
    this.friends = "",
    this.posts = "",
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
      displayName: map['displayname'] as String,
      password: map['password'] as String,
      image: map['image'] as String,
      coins: map['coins'] as int,
      posts: map['posts'] as String,
      friends: map['friends'] as String,
    );
  }

  static Future<User?> fetchUser(String username) async {
    //
    final response = await DatabaseHelper.client
        .from('user_table')
        .select()
        .eq('username', username)
        .single();

    // Check if the response contains any data
    if (response != null && response.isNotEmpty) {
      // Assuming the response is a Map representing a user
      Map<String, dynamic> userData = response;
      return User.fromMap(userData);
    } else {
      print('User not found or unexpected response format: $response');
      return null;
    }
  }

  static Future<void> insert(User user) async {
    await DatabaseHelper.client.from('user_table').insert({
      'username': user.username,
      'password': user.password,
      'displayname': user.displayName,
      'image': user.image,
      'coins': user.coins,
    });
  }

  static Future<bool> validateUser(String username, String password) async {
    final response = await DatabaseHelper.client
        .from('user_table')
        .select()
        .eq('username', username)
        .eq('password', password);

    // Checking if response is a List and not empty
    if (response is List && response.isNotEmpty) {
      // Assuming each item in the list is a Map representing a user
      // You can further check if the user data matches the expected username and password
      var user = response.firstWhere(
        (u) => u['username'] == username && u['password'] == password,
        orElse: () => null,
      );

      return user != null;
    } else {
      print('Unexpected response format or no user found: $response');
      return false;
    }
  }

  static Future<String> fetchIncomingRequests(String currentUsername) async {
    try {
      final response = await DatabaseHelper.client
          .from('friend_requests')
          .select('sender_username') // Select only the 'sender_username' column
          .eq('receiver_username',
              currentUsername) // Filter by 'receiver_username'
          .eq('status', 'pending'); // Assuming you only want pending requests

      if (response == null || response.isEmpty) {
        print('No incoming requests found.');
        return '';
      }

      // Extracting sender usernames and joining them into a comma-separated string
      List<String> requestUsernames = [];
      for (var request in response) {
        if (request['sender_username'] != null) {
          requestUsernames.add(request['sender_username'].toString());
        }
      }

      return requestUsernames.join(',');
    } catch (e) {
      print('An error occurred: $e');
      return '';
    }
  }

  static Future<void> sendFriendRequest(
    String currentUsername,
    String friendUsername,
  ) async {
    try {
      //Add a new friend request
      await DatabaseHelper.client.from('friend_requests').insert({
        'sender_username': currentUsername,
        'receiver_username': friendUsername,
        'status': 'pending',
      });
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  // Method to accept a friend request
  static Future<void> acceptFriendRequest(
      String currentUsername, String friendUsername) async {
    try {
      // Update the friend request status to 'accepted'
      await DatabaseHelper.client
          .from('friend_requests')
          .update({'status': 'accepted'})
          .eq('sender_username', friendUsername)
          .eq('receiver_username', currentUsername);

      // Update friends list for both users
      await _updateFriendsList(currentUsername, friendUsername);
      await _updateFriendsList(friendUsername, currentUsername);
    } catch (e) {
      print('An error occurred while accepting a friend request: $e');
    }
  }

  static Future<void> _updateFriendsList(
      String username, String friendUsername) async {
    try {
      // Fetch the current user's friends list
      final response = await DatabaseHelper.client
          .from('user_table')
          .select('friends')
          .eq('username', username)
          .single();
      // Directly working with the response as the data
      if (response != null) {
        String currentFriends = response['friends'] ?? '';

        if (!currentFriends.split(',').contains(friendUsername)) {
          String updatedFriends = currentFriends.isEmpty
              ? friendUsername
              : '$currentFriends,$friendUsername';

          // Update the user's friends list
          await DatabaseHelper.client
              .from('user_table')
              .update({'friends': updatedFriends}).eq('username', username);
        }
      } else {
        print("Response is null");
      }
    } catch (e) {
      print('An error occurred while updating friends list: $e');
    }
  }

  // Method to deny a friend request
  static Future<void> denyFriendRequest(
      String currentUsername, String friendUsername) async {
    try {
      // Update the friend request status to 'denied' or delete the request
      await DatabaseHelper.client
          .from('friend_requests')
          .update({
            'status': 'denied'
          }) // Or use .delete() if you prefer to remove the request
          .eq('sender_username', friendUsername)
          .eq('receiver_username', currentUsername);
    } catch (e) {
      print('An error occurred while denying a friend request: $e');
    }
  }

  // static Future<void> createPost(
  //     String username, String location, String description) async {
  //   try {
  //     String postEntry = "$location#$description";

  //     // Fetch the current user's posts
  //     final response = await DatabaseHelper.client
  //         .from('user_table')
  //         .select('posts')
  //         .eq('username', username)
  //         .single();

  //     if (response != null) {
  //       String currentPosts = response['posts'] ?? '';
  //       String updatedPosts =
  //           currentPosts.isEmpty ? postEntry : '$currentPosts,$postEntry';

  //       // Update the user's posts list
  //       await DatabaseHelper.client
  //           .from('user_table')
  //           .update({'posts': updatedPosts}).eq('username', username);
  //     }
  //   } catch (e) {
  //     print('An error occurred while creating a post: $e');
  //   }
  // }
}
