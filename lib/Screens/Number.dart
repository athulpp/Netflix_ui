import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui/widgets/homeMainTitle.dart';

// class ScreenHome extends StatelessWidget {
//   const ScreenHome({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Padding(
//         padding: EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//              const MainTitleCard(
//                 title: 'Released in the past year',
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                const   MainTitle(
//                     title: 'Top Shows',
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   LimitedBox(
//                     maxHeight: 200,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: List.generate(
//                           10,
//                           (index) => NumberCard(
//                                 index: index,
//                               )),
//                     ),
//                   )
//                 ],
//               ),
//               MainTitleCard(
//                 title: 'Trending now',
//               ),
//               MainTitleCard(
//                 title: 'Tv Series',
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MainTitleCard extends StatelessWidget {
//   const MainTitleCard({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         MainTitle(
//           title: title,
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         LimitedBox(
//           maxHeight: 200,
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             children: List.generate(10, (index) => const MainCard()),
//           ),
//         )
//       ],
//     );
//   }
// }

// class MainCard extends StatelessWidget {
//   const MainCard({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 10),
//       width: 150,
//       height: 250,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           image: const DecorationImage(
//               image: NetworkImage(
//                   'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Netflix_2015_N_logo.svg/1200px-Netflix_2015_N_logo.svg.png'))),
//     );
//   }
// }

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
//               width: 50,
//               height: 150,
//             ),
//             Container(
//               width: 150,
//               height: 250,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   image: const DecorationImage(
//                       fit: BoxFit.cover,
//                       image: NetworkImage(
//                           'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Netflix_2015_N_logo.svg/1200px-Netflix_2015_N_logo.svg.png'))),
//             ),
//           ],
//         ),
//         Positioned(
//           left: 13,
//           bottom: -5,
//           child: BorderedText(
//             strokeWidth: 1.0,
//             child: Text(
//               '${index + 1}',
//               style: TextStyle(fontSize: 120, decoration: TextDecoration.none),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
