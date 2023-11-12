import 'package:flutter/material.dart';
import 'package:inrixecocoin2/post_data.dart';
import 'package:inrixecocoin2/test_data.dart';
import 'package:inrixecocoin2/user_data.dart';
import 'activity_post.dart';
// class Test extends StatelessWidget {
//   const Test({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(),
//     );
//   }
// }

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: testPosts.map((post) {
            return ActivityPost(postData: post);
          }).toList()),
    );
  }
}

