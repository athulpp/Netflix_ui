import 'package:flutter/material.dart';
import 'package:netflix_ui/Screens/HomeScreen.dart';

class FastLaugh extends StatelessWidget {
  FastLaugh({Key? key}) : super(key: key);
  PageController controller1 = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: controller.getPopularMovies(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                final popularMovies = snapshot.data;
                return PageView.builder(
                    itemCount: popularMovies.length,
                    controller: controller1,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                'http://image.tmdb.org/t/p/w500' +
                                    popularMovies[index]["backdrop_path"],
                              ),
                              fit: BoxFit.fill),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.volume_off,
                                size: 35,
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.emoji_emotions,
                                            size: 35,
                                          ),
                                          Text(
                                            'Lol',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.add,
                                            size: 35,
                                          ),
                                          Text(
                                            'My List',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(13.0),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.share,
                                            size: 35,
                                          ),
                                          Text(
                                            'Share',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(18),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            size: 35,
                                          ),
                                          Text(
                                            'Play',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      ),
                                    )
                                  ]),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                CircularProgressIndicator();
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
