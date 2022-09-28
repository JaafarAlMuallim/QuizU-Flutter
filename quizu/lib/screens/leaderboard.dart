// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:quizu/Components/bottom_navbar.dart';
import 'package:quizu/Components/my_container.dart';
import 'package:quizu/Components/networking.dart';
import 'package:quizu/Components/spin_kit.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/screens/error.dart';

List<Widget> nameAndScoreList(List<String> topNames, List<int> topScores) {
  List<Widget> row = [];
  for (int i = 0; i < 10; i++) {
    row.add(
      Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: Text(
                topNames[i],
                style: kSubtitleStyle,
              ),
            ),
            SizedBox(
              width: 10,
              height: 8,
            ),
            Expanded(
              flex: 2,
              child: Text(
                '${topScores[i] > 10 ? topScores[i] : '0$topScores[i]'}',
                style: kSubtitleStyle,
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
  return row;
}

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  List<String> tops = [];
  List<int> scores = [];
  bool _isLoading = true;
  bool failure = false;
  void getTop() async {
    tops = [];
    scores = [];
    NetworkingHelper helper = NetworkingHelper();
    dynamic data = await helper.getTopTen();
    failure = data == false;
    if (!failure) {
      for (int i = 0; i < 10; i++) {
        if (data[i]['name'] != null && data[i]['score'] != null) {
          tops.add(data[i]['name']);
          scores.add(data[i]['score']);
        }
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
    return failure
        ? ErrorPage(
            text: 'Something Went Wrong!\nCheck Your Internet Connection',
          )
        : SafeArea(
            child: MyContainer(
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
                    : RefreshIndicator(
                        onRefresh: () async => getTop(),
                        child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Center(
                                  child: Text(
                                    'Leaderboard',
                                    style: kTitleStyle,
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                ...nameAndScoreList(tops, scores)
                              ],
                            ),
                          ),
                        ),
                      ),
                bottomNavigationBar: BottomNavBar(),
              ),
            ),
          );
  }
}
