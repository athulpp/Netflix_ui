import 'package:flutter/material.dart';
import 'package:netflix_ui/Screens/HomeScreen.dart';

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
            // ComingSoon(
            //   height: height,
            //   width: width,
            // // )
            // EveryoneWatch(
            //   height: height,
            //   width: width,
            // )
            Coming
                ? Center(
                    child: FutureBuilder<List<dynamic>>(
                        future: controller.getPopularMovies(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final upcomingList = snapshot.data;
                            return Column(
                              children: [
                                Container(
                                  height: height,
                                  child: ListView.builder(
                                      itemCount: upcomingList!.length,
                                      itemBuilder: (context, index) {
                                        return ComingSoon(
                                          width: width,
                                          height: height,
                                          index: index,
                                          uri: upcomingList[index]
                                              ["backdrop_path"],
                                          date: upcomingList[index]
                                              ['release_date'],
                                          name: upcomingList[index]
                                              ['original_title'],
                                          descripition: upcomingList[index]
                                              ['overview'],
                                        );
                                      }),
                                ),
                              ],
                            );
                          }
                          return Center(child: CircularProgressIndicator());
                        }),
                  )
                : FutureBuilder<List<dynamic>>(
                    future: controller.getUpComming(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final trending = snapshot.data;
                        return Column(
                          children: [
                            Container(
                              height: height,
                              child: ListView.builder(
                                  itemCount: trending!.length,
                                  itemBuilder: (context, index) {
                                    // String? date =
                                    //     trending[index]["release_date"];
                                    return EveryoneWatch(
                                      width: width,
                                      height: height,
                                      uri: trending[index]["backdrop_path"],
                                      name: trending[index]['original_title'],
                                      descripition: trending[index]['overview'],
                                      date: trending[index]['release_date'],
                                    );
                                  }),
                            )
                          ],
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

class ComingSoon extends StatelessWidget {
  ComingSoon(
      {Key? key,
      required this.descripition,
      required this.name,
      required this.width,
      required this.height,
      required this.index,
      required this.uri,
      required this.date})
      : super(key: key);
  final String uri;
  final width;
  final height;
  Widget DateWidget = Container();
  int index;
  final date;
  final name;
  final descripition;

  @override
  Widget build(BuildContext context) {
    if (date != null) {
      final day = date[8] + date[9];
      final month = date[4] + date[5];
      DateWidget = getDate(day, month);
    }
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: width * 0.04,
            ),
            DateWidget,
            Container(
              // child: Center(child: Text('Date')),
              width: width * 0.13,
              height: height * 0.4,
            ),
            SizedBox(
              width: 10,
            ),
            // Padding(padding: EdgeInsets.all(8))
            Container(
                width: width * 0.7,
                height: height * 0.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    // color: Colors.blue,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w400' + uri),
                        fit: BoxFit.fill)))
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
              Text('Releasing on $date'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: width * 0.9,
                  child: Text(
                    name,
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(descripition,
              style: TextStyle(color: Colors.grey.withOpacity(0.6))),
        )
      ],
    );
  }

  Widget getDate(String day, String month) {
    String monthName = getMonthName(month);
    return Container(
      child: Column(
        children: [
          Text(
            monthName,
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            day,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }

  String getMonthName(String month) {
    String month2;
    switch (month) {
      case "01":
        month2 = "Jan";
        break;
      case "02":
        month2 = "Feb";
        break;
      case "03":
        month2 = "Mar";
        break;
      case "04":
        month2 = "Apr";
        break;
      case "05":
        month2 = "May";
        break;
      case "06":
        month2 = "Jun";
        break;
      case "07":
        month2 = "Jul";
        break;
      case "08":
        month2 = "Aug";
        break;
      case "09":
        month2 = "Sep";
        break;
      case "10":
        month2 = "Oct";
        break;
      case "11":
        month2 = "Nov";
        break;
      case "12":
        month2 = "Dec";
        break;
      default:
        month2 = "Mar";
    }
    return month2;
  }
}

class EveryoneWatch extends StatelessWidget {
  EveryoneWatch(
      {Key? key,
      required this.date,
      required this.width,
      required this.height,
      required this.uri,
      required this.name,
      required this.descripition})
      : super(key: key);

  final width;
  final height;
  final uri;
  final name;
  final descripition;
  final date;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: height * 0.34,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      NetworkImage('https://image.tmdb.org/t/p/w400' + uri))),
        ),
        SizedBox(
          height: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Row(
              children: [
                Column(
                  children: [
                    Icon(Icons.notifications),
                    Text('Reminder me'),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [Icon(Icons.info_outline_rounded), Text('Info')],
                )
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Released on Date $date'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(name),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            descripition,
            style: TextStyle(color: Colors.grey.withOpacity(0.6)),
          ),
        ),
        Divider(
          color: Colors.white.withOpacity(0.5),
        ),
      ],
    );
  }
}
