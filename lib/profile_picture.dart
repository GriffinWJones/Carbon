import 'package:flutter/material.dart';
import 'package:inrixecocoin2/user_data.dart';

class ProfilePicture extends StatelessWidget {
  final UserData user;
  final double size;
  ProfilePicture({required this.user, this.size = 30.0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: ClipOval(
          child: Image.network(
            "${user.image}",
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        ));
  }
}
