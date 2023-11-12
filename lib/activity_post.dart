import 'package:flutter/material.dart';
import 'package:inrixecocoin2/eco_colors.dart';
import 'package:inrixecocoin2/post_data.dart';
import 'profile_picture.dart';
import 'eco_colors.dart';

class ActivityPost extends StatelessWidget {
  final PostData postData;
  ActivityPost({required this.postData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
        child: Card(
          color: ecoColors.lighterColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ProfilePicture(user: postData.userData),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          postData.userData.displayName,
                          style: TextStyle(
                            fontFamily: 'Monterrat',
                            fontSize: 16.0,
                            color: ecoColors.darkColor,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '@${postData.userData.handle}',
                            style: TextStyle(
                              fontFamily: 'Monterrat',
                              fontWeight: FontWeight.w200,
                              fontSize: 12.0,
                              color: ecoColors.darkColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Align(
                      child: Text(
                        postData.location,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w100,
                          color: ecoColors.darkColor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  postData.caption,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: ecoColors.lighterDarkColor,
                  ),
                  softWrap: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
