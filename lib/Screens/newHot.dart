import 'package:flutter/material.dart';

class NewHotScreen extends StatelessWidget {
  const NewHotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        title: Text("New & Hot"),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.notifications),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 10,
                height: 10,
                color: Colors.blue,
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
