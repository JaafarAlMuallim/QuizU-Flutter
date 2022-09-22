// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:quizu/Components/bottom_navbar.dart';
import 'package:quizu/Components/networking.dart';
import 'package:quizu/Components/spin_kit.dart';
import 'package:quizu/constants.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  List<String> tops = [];
  List<int> scores = [];
  bool _isLoading = false;

  void getTop() async {
    _isLoading = true;
    NetworkingHelper helper = NetworkingHelper();
    dynamic data = await helper.getTopTen();
    for (int i = 0; i < 10; i++) {
      if (data[i]['name'] != null && data[i]['score'] != null) {
        tops.add(data[i]['name']);
        scores.add(data[i]['score']);
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  Widget namesColumn() {
    List<Widget> names = [];
    for (String top in tops) {
      names.add(Center(
        child: Text(
          top,
          style: kSubtitleStyle,
        ),
      ));
    }
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: names);
  }

  Widget scoresColumn() {
    List<Widget> topScores = [];
    for (int score in scores) {
      topScores.add(Center(
        child: Text(
          '$score',
          style: kSubtitleStyle,
        ),
      ));
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.center, children: topScores);
  }

  @override
  void initState() {
    super.initState();
    getTop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            kHourglass,
            style: kAppBarStyle,
          ),
          centerTitle: true,
        ),
        body: _isLoading
            ? loading()
            : Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Leaderboard',
                          style: kTitleStyle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [namesColumn(), scoresColumn()],
                      ),
                    ],
                  ),
                ),
              ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
