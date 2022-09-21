// ignore_for_file: prefer_const_constructors, constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quizu/screens/leaderboard.dart';
import 'package:quizu/screens/quiz_me.dart';

import '../Components/networking.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen(
      {super.key,
      required this.mobileNum,
      required this.otp,
      required this.name,
      required this.data});
  final String mobileNum;
  final String otp;
  final String name;
  final String data;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getData() async {
    print('LOADING');
    NetworkingHelper helper =
        NetworkingHelper(mobileNum: widget.mobileNum, otp: widget.otp);
    dynamic data = await helper.registerName(widget.name);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizMe(),
      ),
    );
  }

  void getTop() async {
    String tops = '';
    NetworkingHelper helper = NetworkingHelper(mobileNum: '09', otp: '0000');
    dynamic data = await helper.getTopTen();
    for (int i = 0; i < 10; i++) {
      tops += '${data[i]['name']}    ${data[i]['score']}\n';
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LeaderBoard(
          data: tops,
        ),
      ),
    );
  }

  void showProfile() {}

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SpinKitPouringHourGlass(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
