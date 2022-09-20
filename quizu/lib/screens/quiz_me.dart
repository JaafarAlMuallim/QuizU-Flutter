// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizu/constants.dart';

class QuizMe extends StatefulWidget {
  const QuizMe({super.key});

  @override
  State<QuizMe> createState() => _QuizMeState();
}

class _QuizMeState extends State<QuizMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QuizU$kHourglass',
          style: kAppBarStyle,
        ),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Expanded(
          flex: 3,
          child: Center(
            child: Text(
              'Ready To Test Your Knowledge And Challenge Others',
              style: kChallenge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(25),
            child: GestureDetector(
              onTap: () {
                print('HUH');
              },
              child: Container(
                margin: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  color: kRoundButtonColor,
                ),
                child: Center(
                  child: Text(
                    'Quiz Me!',
                    style: kTextButtonStyle,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Center(
            child: Text(
              'Answer As Much Questions Correctly Within 2 Minutes',
              style: kChallenge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ]),
    );
  }
}
