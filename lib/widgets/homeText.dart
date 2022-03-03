import 'package:flutter/material.dart';
import 'package:netflix_ui/widgets/homeMainTitle.dart';

// import 'main_title.dart';
// import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: 'Top 10 in india Today'),
        // LimitedBox(
        //     maxHeight: 200,
        //     child: ListView(
        //       scrollDirection: Axis.horizontal,
        //       children: List.generate(
        //         10,
        //         (index) => NumberCard(
        //           index: index,
        //         ),
        //       ),
        //     )),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}