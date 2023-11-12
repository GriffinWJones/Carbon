import 'package:flutter/material.dart';
import 'package:inrixecocoin2/bottom_nav_bar.dart';
import 'package:inrixecocoin2/eco_colors.dart';
import 'package:inrixecocoin2/user_data.dart';
import 'carpool_card.dart';

class Carpool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ecoColors.lightColor,
      appBar: AppBar(
        backgroundColor: ecoColors.mainShadow,
        title: Text("Carpool Bulletin",
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Montserrat',
                color: ecoColors.lighterColor)),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: requestList.length,
          itemBuilder: (context, index) {
            return CarpoolRequestCard(carpoolRequest: requestList[index]);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const RequestPopup();
              });
        },
        child: const Icon(Icons.add),
        backgroundColor: ecoColors.mainColor,
      ),
      bottomNavigationBar: MainBottomNavBar(),
    );
  }
}

class RequestPopup extends StatelessWidget {
  const RequestPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ecoColors.lighterColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Request a Carpool',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Where would you like to go?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0, fontFamily: 'Montserrat'),
          ),
          const SizedBox(height: 30.0),
          Container(
            height: 60,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            child: const TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(0, 20, 0, 10)),
            ),
          ),
          const SizedBox(height: 30.0),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(ecoColors.mainColor)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Request",
                  style: TextStyle(fontSize: 16.0, fontFamily: 'Montserrat'))),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(ecoColors.mainColor)),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close',
                style: TextStyle(fontSize: 16.0, fontFamily: 'Montserrat')),
          ),
        ],
      ),
    );
  }
}

class CarpoolRequest {
  final String destination;
  final String location;
  final String postBody;
  final UserData userData;

  CarpoolRequest({
    required this.destination,
    required this.location,
    required this.postBody,
    required this.userData,
  });
}

List<CarpoolRequest> requestList = [
  CarpoolRequest(
    destination: "Santa Clara,",
    location: "South San Jose,",
    postBody: "I just want to get the most Carbon Coins!!!",
    userData: UserData(
        coinCount: 0,
        image:
            "https://w.forfun.com/fetch/9e/9e6ceee06a2a6ae732b7594b1081da05.jpeg",
        displayName: "Jane Smith",
        handle: "johnBalls",
        posts: "",
        friends: ""),
  ),
  CarpoolRequest(
      destination: "Santa Cruz,",
      location: "San Francisco,",
      postBody:
          "I want to go surfing this weekend, if anyone wants to tag along!",
      userData: UserData(
          coinCount: 0,
          image:
              "https://s3.amazonaws.com/images.gearjunkie.com/uploads/2021/04/d.jpg",
          displayName: "Daniel Roberts",
          handle: "johnBalls",
          posts: "",
          friends: "")),
  CarpoolRequest(
      destination: "Mountain View,",
      location: "Milpitas,",
      postBody:
          "I work in Mountain View, and want to start carpooling with someone to save gas.",
      userData: UserData(
          coinCount: 0,
          image:
              "https://d339b5nop2tkmp.cloudfront.net/uploads/pictures/456/Viola_201044.jpg",
          displayName: "Mary Jorgenson",
          handle: "johnBalls",
          posts: "",
          friends: ""))
];
