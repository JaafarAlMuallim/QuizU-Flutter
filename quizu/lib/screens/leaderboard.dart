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
  String tops = '';
  bool _isLoading = false;

  void getTop() async {
    _isLoading = true;
    NetworkingHelper helper = NetworkingHelper();
    dynamic data = await helper.getTopTen();
    for (int i = 0; i < 10; i++) {
      tops += '${data[i]['name']}             ${data[i]['score']}\n';
    }
    setState(() {
      _isLoading = false;
    });
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
                      Text(
                        'Leaderboard',
                        style: kTitleStyle,
                      ),
                      Text(
                        tops,
                        style: kSubtitleStyle,
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
