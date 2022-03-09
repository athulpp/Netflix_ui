import 'package:get/get.dart';
// import 'package:netflix_ui/Screens/HomeScreen.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

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

  Future<List<dynamic>> GetCategories() async {
    final map1 = await loadTmdbData!.v3.genres.getTvlist();
    final list = map1["genres"];
    return list;
  }

  // var trending = Uri.parse(
  //     'https://api.themoviedb.org/3/trending/all/day?api_key=1ca26ba6d651369261cf9a6816e95a96');

  // Future getTrending() async {
  //   var response = await http.get(trending);
  //   Map data = json.decode(response.body);
  //   trendingList = data['results'];
  //   return trendingList;
  // }
  // List upcomingList = [];
  // List popularList = [];
  // List topratedList = [];
  // List nowplayingList = [];
  // List trendingList = [];
  // List catagoryList = [];
  // var upComing = Uri.parse(
  //     'https://api.themoviedb.org/3/movie/upcoming?api_key=1ca26ba6d651369261cf9a6816e95a96&language=en-US&page=1');
  // var toprated = Uri.parse(
  //     'https://api.themoviedb.org/3/movie/top_rated?api_key=1ca26ba6d651369261cf9a6816e95a96&language=en-US&page=1');
  // var nowplaying = Uri.parse(
  //     'https://api.themoviedb.org/3/movie/now_playing?api_key=1ca26ba6d651369261cf9a6816e95a96&language=en-US&page=1');
  // var popular = Uri.parse(
  //     'https://api.themoviedb.org/3/movie/popular?api_key=1ca26ba6d651369261cf9a6816e95a96&language=en-US&page=1');
  // var trending = Uri.parse(
  //     'https://api.themoviedb.org/3/trending/all/day?api_key=1ca26ba6d651369261cf9a6816e95a96');

  // var category = Uri.parse(
  //     'https://api.themoviedb.org/3/genre/tv/list?api_key=1ca26ba6d651369261cf9a6816e95a96&language=en-US');

  // Future getUpComming() async {
  //   var response = await http.get(upComing);
  //   Map data = json.decode(response.body);
  //   upcomingList = data['results'];
  //   return upcomingList;
  // }

  // Future getPopularMovies() async {
  //   var response = await http.get(popular);
  //   Map data = json.decode(response.body);
  //   popularList = data['results'];
  //   return popularList;
  // }

  // Future getTopRated() async {
  //   var response = await http.get(toprated);
  //   Map data = json.decode(response.body);
  //   topratedList = data['results'];
  //   return topratedList;
  // }

  // Future getNowPlaying() async {
  //   var response = await http.get(nowplaying);
  //   Map data = json.decode(response.body);
  //   nowplayingList = data['results'];
  //   return nowplayingList;
  // }

  // Future getTrending() async {
  //   var response = await http.get(trending);
  //   Map data = json.decode(response.body);
  //   trendingList = data['results'];
  //   return trendingList;
  // }

  // Future<List<dynamic>> getCategories() async {
  //   var response = await http.get(category);
  //   Map data = json.decode(response.body);
  //   catagoryList = data['genres'];
  //   return catagoryList;
  // }
}
