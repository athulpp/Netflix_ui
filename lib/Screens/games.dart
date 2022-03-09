import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Title(
            color: Colors.white,
            child: Text(
              'Coming Soon',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
