// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizu/Components/detector.dart';
import 'package:quizu/Components/shared.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/screens/error.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            title(),
            SizedBox(height: 40),
            Text(
              "What's your name?",
              style: kTextButtonStyle2,
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                  onChanged: (value) {
                    name = value;
                  },
                  style: kInputStyle,
                  decoration: kMyInputDecoration),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: MyContainer(
                  color: kRoundButtonColor,
                  containerContent: Center(
                      child: Text(
                    'Done',
                    style: kTextButtonStyle2,
                  )),
                  onPress: () {
                    if (name.isNotEmpty) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoadingScreen(
                                  mobileNum: widget.mobileNum,
                                  otp: widget.otp,
                                  name: name)));
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ErrorPage(
                            text: 'Your Name Should Not Be Empty!',
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
