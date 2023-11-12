import 'package:flutter/material.dart';
import 'package:inrixecocoin2/user_data.dart';

class ProfilePicture extends StatelessWidget {
  final UserData user;
  final double size;
  ProfilePicture({required this.user, this.size = 50.0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: ClipOval(
          child: Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/a/a5/Red_Kitten_01.jpg",
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        ));
  }
}