import 'package:flutter/material.dart';
import 'package:inrixecocoin2/user_data.dart';

class ProfilePicture extends StatelessWidget {
  final UserData user;
  ProfilePicture({required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: ClipOval(
          child: Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/a/a5/Red_Kitten_01.jpg",
            width: 50,
            height: 50,
          ),
        ));
  }
}
