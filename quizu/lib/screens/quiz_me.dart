// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizu/Components/new_button.dart';
import 'package:quizu/constants.dart';

class QuizMe extends StatefulWidget {
  const QuizMe({super.key});

  @override
  State<QuizMe> createState() => _QuizMeState();
}

class _QuizMeState extends State<QuizMe> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     Center(
      //       child: Text(
      //         'Ready To Test Your Knowledge And Challenge Others',
      //         style: kChallenge,
      //         textAlign: TextAlign.center,
      //       ),
      //     ),
      //     CustomButton(
      //       containerContent: Center(
      //         child: Text(
      //           'Quiz Me!',
      //           style: kTextButtonStyle,
      //         ),
      //       ),
      //       onPress: () {
      //         print('HUH');
      //       },
      //     ),
      //     Center(
      //       child: Text(
      //         'Answer As Much Questions Correctly Within 2 Minutes',
      //         style: kChallenge,
      //         textAlign: TextAlign.center,
      //       ),
      //     ),
      //   ],
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.leaderboard_outlined),
      //       label: 'Leaderboard',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.account_circle_outlined),
      //       label: 'Profile',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.blue[800],
      //   onTap: _onItemTapped,
      // ),
    );
  }
}
