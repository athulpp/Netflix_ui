import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_ui/Screens/HomeScreen.dart';
import 'package:netflix_ui/Screens/download.dart';
import 'package:netflix_ui/Screens/fastlaugh.dart';
import 'package:netflix_ui/Screens/games.dart';
import 'package:netflix_ui/Screens/newHot.dart';
import 'package:netflix_ui/controller/controller.dart';

class BottomTabBar extends StatelessWidget {
  BottomTabBar({Key? key}) : super(key: key);
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetoptioin = [
      HomeScreen(),
      GameScreen(),
      NewHotScreen(),
      FastLaugh(),
      DownloadScreen()
    ];
    return SafeArea(
        child: Scaffold(
      body: GetBuilder<Controller>(
          id: 'indexChanged',
          builder: (controller) {
            return _widgetoptioin[controller.selectedIndex];
          }),
      bottomNavigationBar: GetBuilder<Controller>(
          id: 'indexChanged',
          builder: (controller) {
            return BottomNavigationBar(
              // backgroundColor: Colors.amber,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              unselectedIconTheme: const IconThemeData(color: Colors.yellow),
              selectedIconTheme: const IconThemeData(color: Colors.white),
              onTap: controller.onItemTapped,
              currentIndex: controller.selectedIndex,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  icon: Icon(Icons.home, color: Colors.white70),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.gamepad_outlined,
                      color: Colors.white,
                    ),
                    icon: Icon(
                      Icons.games_outlined,
                      color: Colors.white70,
                    ),
                    label: 'Games',
                    backgroundColor: Colors.black),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.video_collection_outlined,
                    color: Colors.white,
                  ),
                  icon: Icon(
                    Icons.video_collection_outlined,
                    color: Colors.white70,
                  ),
                  label: 'News & Hot',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.play_circle_fill_outlined),
                  icon: Icon(
                    Icons.play_circle_fill_rounded,
                    color: Colors.white70,
                  ),
                  label: 'Fast Laughs ',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.download_outlined,
                    color: Colors.white,
                  ),
                  icon: Icon(
                    Icons.download_outlined,
                    color: Colors.white70,
                  ),
                  label: 'Download',
                ),
              ],
            );
          }),
    ) // backgroundColor: Theme.of(context).primaryColor));
        );
  }
}
