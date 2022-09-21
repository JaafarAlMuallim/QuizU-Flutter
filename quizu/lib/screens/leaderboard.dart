// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizu/constants.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key, required this.data});

  final String data;

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        //   shape: const Border(bottom: BorderSide(color: kBottomAppBar)),
        //   title: Text(
        //     kHourglass,
        //     style: kAppBarStyle,
        //   ),
        //   centerTitle: true,
        // ),
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Text(
                widget.data,
                style: kBodyStyle,
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard_outlined),
              label: 'Leaderboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
