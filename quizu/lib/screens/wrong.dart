// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizu/Components/new_button.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/screens/quiz_me.dart';
import 'package:quizu/screens/quiz_page.dart';

class WrongPage extends StatefulWidget {
  const WrongPage({super.key});

  @override
  State<WrongPage> createState() => _WrongPageState();
}

void callWrong(context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => QuizMe()));
}

class _WrongPageState extends State<WrongPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
              child: SizedBox(
                child: Icon(
                  Icons.close,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              onTap: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => QuizMe()))),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(30),
                  child: Image.asset(
                    'images/cryingEmoji.png',
                    width: 170,
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
                SizedBox(
                  height: 40,
                ),
                CustomButton(
                  containerContent: Center(
                    child: Text(
                      'Try Again',
                      textAlign: TextAlign.center,
                      style: kTextButtonStyle,
                    ),
                  ),
                  onPress: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => QuizPage()));
                  },
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
