// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:quizu/Components/bottom_navbar.dart';
import 'package:quizu/constants.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key, required this.data});

  final String data;

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {

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
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
