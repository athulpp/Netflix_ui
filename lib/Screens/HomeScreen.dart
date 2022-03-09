import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/controller/controller.dart';
import 'package:netflix_ui/widgets/category_list.dart';
import 'package:netflix_ui/widgets/homeMainTitle.dart';

Controller controller = Controller();

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CoverScreen(
              height: height,
              width: width,
            ),
            FutureBuilder(
                future: controller.loadContent(),
                builder: (context, Snapshot) {
                  if (Snapshot.hasData) {
                    return Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainTitle(
                            title: 'Popular Movies',
                          ),
                          PopularMovies(
                            height: height,
                            width: width,
                          ),
                          MainTitle(title: 'Trending Movies'),
                          TrendingMovies(
                            width: width,
                            height: height,
                          ),
                          MainTitle(title: 'Upcoming Movies'),
                          UpcomingMovies(width: width, height: height),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}

class PopularMovies extends StatelessWidget {
  const PopularMovies({Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.3,
      child: FutureBuilder<List<dynamic>>(
          future: controller.getPopularMovies(),
          builder: (context, item) {
            if (item.hasData) {
              List<dynamic> popularMovies = item.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Stack(children: [
                    Row(
                      children: [
                        SizedBox(width: 30
                            // height: height * 0.65,
                            ),
                        Container(
                          width: width * 0.35,
                          height: height * 0.35,
                          child: ClipRRect(
                              child: Image(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w400' +
                                    popularMovies[index]['poster_path']),
                            // child: Image.network(
                            //     'https://assets.teenvogue.com/photos/6155caed63ab243c2cd2c331/master/pass/EN-US_You_S3_Main_Best_Lies_Vertical_27x40_RGB_PRE.jpg'),
                          )),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 10,
                      bottom: -5,
                      child: BorderedText(
                        strokeColor: Colors.white,
                        strokeWidth: 5.0,
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 120,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    )
                  ]);
                  // return IndexMovie(width: width, height: height, index: index);
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}

class IndexMovie extends StatelessWidget {
  const IndexMovie(
      {Key? key,
      required this.width,
      required,
      required this.height,
      required this.index})
      : super(key: key);
  final double width;
  final double height;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: width * 0.35,
        height: height * 0.35,
        child: ClipRRect(),
      ),
      Positioned(child: Center(child: Text('${index + 1}')))
    ]);
  }
}

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.3,
      child: Stack(children: [
        FutureBuilder<List<dynamic>>(
            future: controller.getTrending(),
            builder: (context, item) {
              if (item.hasData) {
                List<dynamic> getTrending = item.data!;
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: getTrending.length,
                    itemBuilder: (context, index) {
                      return Container(
                          width: width * 0.35,
                          height: height * 0.35,
                          child: ClipRRect(
                            child: Image(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w400' +
                                      getTrending[index]['poster_path']),
                            ),

                            //
                          ));
                    });
              } else {
                return CircularProgressIndicator();
              }
            }),
      ]),
    );
  }
}

class UpcomingMovies extends StatelessWidget {
  const UpcomingMovies({Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.3,
      child: FutureBuilder<List<dynamic>>(
          future: controller.getUpComming(),
          builder: (context, item) {
            if (item.hasData) {
              List<dynamic> getUpcoming = item.data!;
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: getUpcoming.length,
                  itemBuilder: (context, index) {
                    return Container(
                        width: width * 0.35,
                        height: height * 0.35,
                        child: ClipRRect(
                          child: Image(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    getUpcoming[index]['poster_path']),
                          ),
                          //
                        ));
                  });
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}

class CoverScreen extends StatelessWidget {
  final double height;
  final double width;
  CoverScreen({Key? key, required this.height, required this.width})
      : super(key: key);
  var myInitialItem = 'item1';
  final myitems = ['item1', 'item2', 'item3', 'item4'];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 0.6 * height,
          decoration: BoxDecoration(),
          child: Container(
            width: width,
            height: height * 0.5,
            child: Image.network(
              controller.coverPoster,
              fit: BoxFit.cover,
            ),
          ),

          // child: Image.network(
          //   'https://m.media-amazon.com/images/M/MV5BNjk4MzVlM2UtZGM0ZC00M2M1LThkMWEtZjUyN2U2ZTc0NmM5XkEyXkFqcGdeQXVyOTAzMTc2MjA@._V1_FMjpg_UX1000_.jpg',
          //   fit: BoxFit.cover,
          // ),
        ),
        Positioned(
            top: 10,
            left: 5,
            child: Container(
              width: 0.97 * width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 20,
                    height: 30,
                    child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Netflix_2015_N_logo.svg/1200px-Netflix_2015_N_logo.svg.png'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        child: Image.network(
                          'http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png',
                          scale: 5,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  )
                ],
              ),
            )),
        Positioned(
          top: height * 0.07,
          left: 70,
          child: Container(
            width: 0.7 * width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('TV Shows'),
                Text('Movies'),
                Row(
                  children: [
                    // InkWell(onTap: () {
                    //   CategoriesDropDown();
                    // }),
                    Text("Categories"),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CategoryList()),
                          );
                          // DropdownButton(
                          //     value: myInitialItem,
                          //     items: myitems.map((items) {
                          //       return DropdownMenuItem(
                          //           value: items, child: Text(items));
                          //     }).toList(),
                          //     onChanged: (value) {});
                        },
                        icon: Icon(Icons.arrow_drop_down_outlined))
                  ],
                )
              ],
            ),
          ),
        ),
        // Positioned(
        //   top: 320,
        //   left: 30,
        //   child: Container(
        //     width: width * 0.9,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Text('Psychological'),
        //         Text('Dark'),
        //         Text('Suspensful'),
        //         Text('Mystery'),
        //         Text('Thriller'),
        //         Text('Mind Game')
        //       ],
        //     ),
        //   ),
        // ),
        Positioned(
            bottom: 18,
            left: 50,
            child: Container(
              width: width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                      ),
                      Text(
                        'My List',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Container(
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.play_arrow,
                              color: Colors.black,
                              size: 20,
                            )),
                        Text(
                          "Play",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          width: 5,
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.info_outline_rounded)),
                          Text('Info')
                        ],
                      )
                    ],
                  )
                ],
              ),
            ))
      ],
    );
  }
}

// class NumberCard extends StatelessWidget {
//   const NumberCard({Key? key, required this.index}) : super(key: key);
//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Row(
//           children: [
//             SizedBox(
//               width: 40,
//               height: 150,
//             ),
//             Container(
//               width: 150,
//               height: 250,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   image: const DecorationImage(
//                       image: NetworkImage(
//                           'http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png'))),
//             ),
//           ],
//         ),
//         Text('$index')
//       ],
//     );

//   }
// }

// Future<void>(BuildContext context, String title){}
//   var myInitialItem = 'item1';
//   final myitems = ['item1', 'item2', 'item3', 'item4'];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             child: DropdownButton(
//       value: myInitialItem,
//       items: myitems.map((items) {
//         return DropdownMenuItem(value: items, child: Text(items));
//       }).toList(),
//       onChanged: (value) {},
//     )));
//   }
