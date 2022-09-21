// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizu/Components/detector.dart';
import 'package:quizu/constants.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key, required this.text});
  final String text;

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Something Went Wrong',
          style: kAppBarStyle,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(30),
              child: Image(
                image: AssetImage(
                  'images/cryingEmoji.png',
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(30),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(65),
              child: MyContainer(
                color: kRoundButtonColor,
                containerContent: Center(
                  child: Text(
                    'Start Again',
                    textAlign: TextAlign.center,
                    style: kTextButtonStyle2,
                  ),
                ),
                onPress: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
