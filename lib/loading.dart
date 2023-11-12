import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 212, 169, 105),
        body: Center(
          child: Container(
                child: Image(
                  image: NetworkImage('https://i.pinimg.com/474x/8b/68/f3/8b68f354c09775cf2802a3284788e02b.jpg',),
                  alignment: Alignment.center,
                ),
                color: Color.fromARGB(255, 215, 186, 114), 
              ),
        )
      )
    );
  }
}
