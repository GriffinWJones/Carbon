import 'package:flutter/material.dart';
import 'package:inrixecocoin2/post_data.dart';

class ActivityPost extends StatelessWidget {
  final PostData postData;
  ActivityPost({required this.postData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            Text(postData.userData.displayName),
            Text(postData.caption),
          ],
        ),
      ),
    );
  }
}
