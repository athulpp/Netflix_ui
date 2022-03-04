import 'dart:math';

import 'package:flutter/material.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({Key? key}) : super(key: key);

  List imageList = [
    'https://m.media-amazon.com/images/M/MV5BYjFmOWUwYjgtM2UyYS00M2FmLTgwNmUtMWIwNTc2ZTgzNmRhXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_.jpg',
    'https://cdn.shopify.com/s/files/1/0290/5663/0868/products/Family_666x999-min_666x999.jpg?v=1633193451',
    'https://assets.mubicdn.net/images/notebook/post_images/19893/images-w1400.jpg?1449196747'
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Downloads'),
            Row(
              children: [
                Icon(Icons.cast),
                SizedBox(
                  width: 8,
                ),
                Container(
                  width: 30,
                  height: 30,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          _SmartDownload(),
          Container(
            color: Colors.black,
            child: Column(
              children: [
                const Text(
                  'Introducing Downloads For You',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                const Text(
                  "We'll download a personalised selection of \n movies and shows for you, so there's \n always something to watch on your \n device.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: size.width,
            color: Colors.black,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                      radius: size.width * 0.34,
                      backgroundColor: Colors.grey.withOpacity(0.5)),
                ),
                DownloadImageWidget(
                    imageList: imageList[0],
                    margin: EdgeInsets.only(left: 170, top: 30),
                    angle: 20,
                    radius: 10,
                    size: Size(size.width * 0.4, size.width * 0.5)),
                DownloadImageWidget(
                  imageList: imageList[1],
                  margin: EdgeInsets.only(right: 170, top: 35),
                  angle: -20,
                  radius: 10,
                  size: Size(size.width * 0.4, size.width * 0.5),
                ),
                DownloadImageWidget(
                  imageList: imageList[2],
                  margin: EdgeInsets.only(bottom: 20, top: 45),
                  size: Size(size.width * 0.5, size.width * 0.56),
                  radius: 15,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(
                  width: size.width * 0.9,
                  child: MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Set up',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      color: Colors.blueAccent[700]),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'See What you can download',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SmartDownload extends StatelessWidget {
  const _SmartDownload({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Icon(Icons.settings),
          SizedBox(
            width: 10,
          ),
          Text('Smart Download')
        ],
      ),
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget({
    Key? key,
    this.angle = 0,
    this.radius = 10,
    required this.size,
    required this.margin,
    required this.imageList,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            // margin: margin,
            width: size.width,
            height: size.height,
            // color: Colors.black,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(imageList))),
          ),
        ),
      ),
    );
  }
}
