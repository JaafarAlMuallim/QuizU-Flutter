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
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
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
          shape: Border(bottom: BorderSide(color: kBottomAppBar)),
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
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                              children: tops
                                  .map((e) => Text(
                                        e,
                                        style: kSubtitleStyle,
                                      ))
                                  .toList()),
                          Column(
                              children: scores
                                  .map((e) =>
                                      Text(e.toString(), style: kSubtitleStyle))
                                  .toList())
                        ],
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
