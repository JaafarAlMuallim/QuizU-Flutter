// ignore_for_file: avoid_print, prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:quizu/Components/bottom_navbar.dart';
import 'package:quizu/Components/new_button.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/screens/leaderboard.dart';

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
        shape: Border(bottom: BorderSide(color: kBottomAppBar)),
        title: Text(
          kHourglass,
          style: kAppBarStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              'Ready To Test Your Knowledge And Challenge Others',
              style: kChallenge,
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Text(
              'Answer As Much Questions Correctly Within 2 Minutes',
              style: kChallenge,
              textAlign: TextAlign.center,
            ),
          ),
          CustomButton(
            containerContent: Center(
              child: Text(
                'Quiz Me!',
                style: kTextButtonStyle,
              ),
            ),
            onPress: () {
              print('HUH');
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
