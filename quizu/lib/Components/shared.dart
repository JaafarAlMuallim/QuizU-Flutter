// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:quizu/constants.dart';

Widget title() {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'QuizU',
          style: kTitleStyle,
        ),
        Container(
          width: 100,
          height: 100,
          child: Image(
            image: AssetImage('images/hourGlass.png'),
          ),
        ),
      ],
    ),
  );
}
