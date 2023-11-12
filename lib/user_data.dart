import 'package:inrixecocoin2/post_data.dart';

class UserData {
  String image = "";
  String handle = "";
  String displayName = "";
  int coinCount = 0;
  String posts;
  String friends;

  //List<Posts> posts;
  //List<Friends> friends;

  UserData({
    required this.image,
    required this.handle,
    required this.displayName,
    required this.coinCount,
    required this.posts,
    required this.friends,
  });
}
