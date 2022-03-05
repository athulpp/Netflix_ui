import 'package:flutter/material.dart';

class NewHotScreen extends StatefulWidget {
  const NewHotScreen({Key? key}) : super(key: key);

  @override
  State<NewHotScreen> createState() => _NewHotScreenState();
}

class _NewHotScreenState extends State<NewHotScreen> {
  bool Coming = true;
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
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          Coming = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: (Coming) ? Colors.white : Colors.grey),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.movie,
                              color: Colors.black,
                            ),
                            Text(
                              'coming soon',
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  //Everone watching
                  InkWell(
                    onTap: () {
                      setState(() {
                        Coming = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: (Coming) ? Colors.grey : Colors.white),
                      child: Row(
                        children: [
                          Icon(
                            Icons.movie,
                            color: Colors.black,
                          ),
                          Text(
                            'Everyone Watching',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  //Top 10
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey),
                      child: Row(
                        children: [
                          Icon(
                            Icons.movie,
                            color: Colors.black,
                          ),
                          Text(
                            'Top 10',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ComingSoon(
              height: height,
              width: width,
            )
          ],
        ),
      ),
    );
  }
}

class ComingSoon extends StatelessWidget {
  ComingSoon({Key? key, required this.width, required this.height})
      : super(key: key);

  final width;
  final height;
  Widget DateWidget = Container();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            // DateWidget,
            Container(
              child: Center(child: Text('Date')),
              width: width * 0.23,
              height: height * 0.4,
            ),
            SizedBox(
              width: 10,
            ),
            // Padding(padding: EdgeInsets.all(8))
            Container(
                width: width * 0.68,
                height: height * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Colors.blue,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'))))
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 2),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [Icon(Icons.notifications), Text('Reminder Me ')],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Icon(Icons.info_outline),
                      Text('Info'),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Releasing On 2022-03-01'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [Text('The Batman')],
          ),
        ),
        Text(
            'Lorem ipsum dolor sit amet consecte sjgnsg;kdmdgdmgdgmdgmgmgpgdmgdgdmgdkgmgdkgmddmgdgmdkmdmgdgdkgdgpgmquia. Quo neque error repudiandae fuga? Ipsa laudantium moldfdfdfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhjjjjjjjjjjjjjjjjj ')
      ],
    );
  }
}
