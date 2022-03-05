import 'package:flutter/material.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 150,
        ),
        Container(
          width: 150,
          height: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(image: NetworkImage(''))),
        ),
      ],
    );
  }
}
