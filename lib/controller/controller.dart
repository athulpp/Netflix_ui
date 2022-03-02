import 'package:get/get.dart';

class MovieAuthe {
  static const apiKey = '1ca26ba6d651369261cf9a6816e95a96';
  static const readAcessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxY2EyNmJhNmQ2NTEzNjkyNjFjZjlhNjgxNmU5NWE5NiIsInN1YiI6IjYyMWY1Mjk4NzdiMWZiMDA2Y2ZjNWFmOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.8eI19JdROYT-cw-YDTC75IKkkxRd2HeRnSw6rPMja48';
}

class Controller extends GetxController {
  String homePoster =
      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg';



      
  int selectedIndex = 0;
  void onItemTapped(int index) {
    selectedIndex = index;

    update(['indexChanged']);
  }
}
