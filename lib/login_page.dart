import 'package:flutter/material.dart';
import 'package:inrixecocoin2/current_user.dart';
import 'user_data.dart';
import 'user.dart';
import 'eco_colors.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              "LOG IN",
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
              child: Icon(Icons.arrow_forward_sharp),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  ecoColors.lightColor,
                ), // Set your desired color
              ),
              onPressed: () async {
                String username = usernameController.text;
                String password = passwordController.text;

                bool isValid = await User.validateUser(username, password);
                if (isValid) {
                  User? user = await User.fetchUser(username);
                  if (user != null) {
                    // USER CONVERT LOGIC

                    CURRENT_USER = UserData(
                      image: user.image,
                      handle: user.username,
                      displayName: user.displayName,
                      coinCount: user.coins,
                      posts: user.posts as String,
                      friends: user.friends,
                    );
                    //------------------
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    // Handle user not found
                  }
                } else {
                  // Handle invalid credentials
                }
              },
            ),
            TextButton(
              child: Text('Create an Account',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    color: ecoColors.lighterColor,
                  )),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/createAccount');
              },
            ),
          ],
        ),
      ),
    );
  }
}
