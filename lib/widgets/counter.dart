import 'package:flutter/material.dart';

import '../constants.dart';

class counts extends StatelessWidget {
  final Color colorout;
  final String count;
  final String type;
  const counts({
    Key? key,
    required this.colorout,
    required this.count,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: colorout.withOpacity(.26)),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: colorout, width: 2),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "$count",
          style: TextStyle(fontSize: 40, color: colorout),
        ),
        Text(
          "$type",
          style: kSubTextStyle,
        )
      ],
    );
  }
}

