// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizu/constants.dart';

Column sharedColumn(child1, child2) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Text(
            'QuizU$kHourglass',
            style: kTitleStyle,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        child1,
        child2,
      ]);
}

Expanded quizuLogo() {
  return Expanded(
    flex: 4,
    child: Center(
      child: Text(
        'QuizU$kHourglass',
        style: kTitleStyle,
      ),
    ),
  );
}
