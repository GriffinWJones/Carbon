import 'package:flutter/material.dart';
import 'test_data.dart';
import 'activity_post.dart';

class ActivityFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: testPosts.map((post) {
          return ActivityPost(postData: post);
        }).toList(),
      ),
    );
  }
}
