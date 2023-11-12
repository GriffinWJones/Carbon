// ignore_for_file: sort_child_properties_last, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:inrixecocoin2/coin_display.dart';
import 'package:inrixecocoin2/eco_colors.dart';
import 'package:inrixecocoin2/profile_picture.dart';
import 'package:inrixecocoin2/user_data.dart';
import 'test_data.dart';
import "user_data.dart";
import 'carpool.dart';

class CarpoolRequestCard extends StatelessWidget {
  final CarpoolRequest carpoolRequest;

  CarpoolRequestCard({required this.carpoolRequest, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Card(
        color: ecoColors.lighterColor,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 20),
                ProfilePicture(
                  user: carpoolRequest.userData,
                  size: 50,
                ),
                const SizedBox(width: 10),
                Text(
                  carpoolRequest.userData.displayName,
                  style:
                      const TextStyle(fontSize: 15, fontFamily: 'Montserrat'),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.check),
                  color: Colors.green,
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close),
                  color: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  'Current location: ' +
                      carpoolRequest.location +
                      ' 0.91 miles',
                  style: TextStyle(fontSize: 15, fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                    'Destination: ' + carpoolRequest.destination + ' 9.7 miles',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                      overflow: TextOverflow.ellipsis,
                    )),
              ],
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Card(
                child: Container(
                  child: Center(
                    child: Text(
                      carpoolRequest.postBody,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  height: 50,
                  width: 700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
