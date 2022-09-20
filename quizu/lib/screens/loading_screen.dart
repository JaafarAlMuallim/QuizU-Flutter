// ignore_for_file: prefer_const_constructors, constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quizu/screens/quiz_me.dart';

import '../Components/networking.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen(
      {super.key,
      required this.mobileNum,
      required this.otp,
      required this.name});
  final String mobileNum;
  final String otp;
  final String name;
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getData() async {
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

  void showProfile() {}

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPouringHourGlass(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
