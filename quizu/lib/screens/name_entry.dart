// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizu/Components/shared.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/screens/loading_screen.dart';

class NameEntry extends StatefulWidget {
  const NameEntry({super.key, required this.mobileNum, required this.otp});
  final String mobileNum;
  final String otp;

  @override
  State<NameEntry> createState() => _NameEntryState();
}

class _NameEntryState extends State<NameEntry> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          quizuLogo(),
          SizedBox(height: 40),
          Text(
            "What's your name?",
            style: kTextButtonStyle,
          ),
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
                onChanged: (value) {
                  name = value;
                },
                style: TextStyle(color: Colors.black),
                decoration: kMyInputDecoration),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoadingScreen(
                          mobileNum: widget.mobileNum,
                          otp: widget.otp,
                          name: name)));
            },
            child: Text(
              'Done',
              style: kTextButtonStyle,
            ),
          )
        ],
      ),
    );
  }
}
