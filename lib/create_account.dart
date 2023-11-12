// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'user.dart';
import 'eco_colors.dart';

class CreateAccountPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController displayNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ecoColors.darkerShadow,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Create Account",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 34,
                color: ecoColors.lighterColor,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                color: ecoColors.lighterColor,
              ),
              controller: displayNameController,
              decoration: InputDecoration(
                  labelText: 'Display Name',
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    color: ecoColors.lighterColor,
                  )),
            ),
            TextField(
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                color: ecoColors.lighterColor,
              ),
              controller: usernameController,
              decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    color: ecoColors.lighterColor,
                  )),
            ),
            TextField(
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                color: ecoColors.lighterColor,
              ),
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    color: ecoColors.lighterColor,
                  )),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text(
                'Create',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  color: ecoColors.lighterColor,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  ecoColors.lightColor,
                ), // Set your desired color
              ),
              onPressed: () async {
                String username = usernameController.text;
                String displayName = displayNameController.text;
                String password = passwordController.text;

                User newUser = User(
                    username: username,
                    image:
                        "https://t3.ftcdn.net/jpg/00/64/67/80/360_F_64678017_zUpiZFjj04cnLri7oADnyMH0XBYyQghG.jpg ",
                    friends: "",
                    posts: "",
                    coins: 0,
                    displayName: displayName,
                    password: password);

                try {
                  await User.insert(newUser);
                  Navigator.pushReplacementNamed(context, '/login');
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Text("Failed to create account: $e"),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
