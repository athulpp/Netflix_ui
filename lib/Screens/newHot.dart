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
            Padding(padding: EdgeInsets.all(4)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  (MaterialButton(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [Icon(Icons.food_bank), Text('Coming Soon')],
                      ),
                    ),
                  )),
                  MaterialButton(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [Icon(Icons.food_bank), Text('Coming Soon')],
                      ),
                    ),
                  ),
                  MaterialButton(
                    minWidth: 3,
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [Icon(Icons.food_bank), Text('Coming Soon')],
                      ),
                    ),
                  )
                ],
              ),
              //comin soon
            ),
            Row(
              children: [Icon(Icons.food_bank), Text('Coming Soon')],
            ),
            ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Text('date'),
                    ],
                  );
                })
          ],
        ),
      ),
    );
  }
}
