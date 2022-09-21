// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizu/Components/detector.dart';
import 'package:quizu/constants.dart';

class WrongPage extends StatefulWidget {
  const WrongPage({super.key});

  @override
  State<WrongPage> createState() => _WrongPageState();
}

class _WrongPageState extends State<WrongPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Wrong Answer',
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
                    'Try Again',
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
