// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizu/Components/new_button.dart';
import 'package:quizu/constants.dart';

class WrongPage extends StatefulWidget {
  const WrongPage({super.key});

  @override
  State<WrongPage> createState() => _WrongPageState();
}

class _WrongPageState extends State<WrongPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.all(30),
              child: Image.asset(
                'images/cryingEmoji.png',
                width: 175,
                height: 170,
              ),
            ),
            Container(
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
            Padding(
              padding: EdgeInsets.all(65),
              child: CustomButton(
                containerContent: Center(
                  child: Text(
                    'Try Again',
                    textAlign: TextAlign.center,
                    style: kTextButtonStyle,
                  ),
                ),
                onPress: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
