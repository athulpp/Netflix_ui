import 'package:get/get.dart';
import 'package:netflix_ui/Screens/HomeScreen.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MovieAuthe {
  static const apiKey = '1ca26ba6d651369261cf9a6816e95a96';
  static const readAcessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxY2EyNmJhNmQ2NTEzNjkyNjFjZjlhNjgxNmU5NWE5NiIsInN1YiI6IjYyMWY1Mjk4NzdiMWZiMDA2Y2ZjNWFmOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8eI19JdROYT-cw-YDTC75IKkkxRd2HeRnSw6rPMja48';
}

class Controller extends GetxController {
  TMDB? loadTmdbData;
  String coverPoster =
      'https://i.pinimg.com/736x/f8/10/68/f810683363e8dc7e38d5c92c4d7fcdc3.jpg';
  List popularMovies = [];
  List trending = [];
  List upcoming = [];
  Future<TMDB> loadContent() async {
    loadTmdbData = TMDB(ApiKeys(MovieAuthe.apiKey, MovieAuthe.readAcessToken));
    return loadTmdbData!;
  }

  Future<List<dynamic>> getPopularMovies() async {
    Map popularMoviesResult = await loadTmdbData!.v3.movies.getPopular();
    popularMovies = popularMoviesResult["results"];

    return popularMovies;
  }

  Future<List<dynamic>> getTrending() async {
    Map trendingResult = await loadTmdbData!.v3.trending.getTrending();
    trending = trendingResult["results"];

    return trending;
  }

  // Future<List><dynamic>> getUpComming ()async{
  //   Map getUpcoming = await loadTmdbData!.v3.trending.getUpComming();
  //   upcoming=getUpcoming['results'];
  //   return upcoming;
  // }
  Future<List<dynamic>> getUpComming() async {
    Map getUpcoming = await loadTmdbData!.v3.movies.getUpcoming();
    List upComming = getUpcoming["results"];
    return upComming;
  }

  int selectedIndex = 0;
  void onItemTapped(int index) {
    selectedIndex = index;

    update(['indexChanged']);
  }
}
