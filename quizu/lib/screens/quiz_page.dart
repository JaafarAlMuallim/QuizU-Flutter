// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quizu/Components/bottom_navbar.dart';
import 'package:quizu/Components/new_button.dart';
import 'package:quizu/Components/quiz.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/screens/wrong.dart';

Quiz quiz = Quiz();

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int seconds = 120;
  String result = '';
  int skips = 1;
  late Timer _timer;
  int counter = 0;
  String intToTimeLeft(int seconds) {
    int min = seconds ~/ 60;

    int second = seconds - (min * 60);
    if (min == 0) {
      return '$second';
    }

    return '${min > 0 ? "0$min:" : ''}${second < 10 ? '0$second' : second}';
  }

  bool checkAnswer(String pickedAnswer) {
    if (pickedAnswer == quiz.getFinalAnswer()) {
      counter++;
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  intToTimeLeft(seconds),
                  style: kNumberStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  quiz.getText(),
                  style: kQuestion,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 45,
                ),
                CustomButton(
                  containerContent: Center(
                    child: Text(
                      quiz.getAnswerText('a'),
                      style: kTextButtonStyle,
                    ),
                  ),
                  onPress: () {
                    // Check if Strings are equal then go to next question and put the timer on the run
                    setState(() {
                      checkAnswer('a')
                          ? quiz.nextQuestion()
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WrongPage()));
                    });
                    // If not then show wrong page on top of this one
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  containerContent: Center(
                    child: Text(
                      quiz.getAnswerText('b'),
                      style: kTextButtonStyle,
                    ),
                  ),
                  onPress: () {
                    checkAnswer('b')
                        ? quiz.nextQuestion()
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WrongPage()));
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  containerContent: Center(
                    child: Text(
                      quiz.getAnswerText('c'),
                      style: kTextButtonStyle,
                    ),
                  ),
                  onPress: () {
                    checkAnswer('c')
                        ? quiz.nextQuestion()
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WrongPage()));
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  containerContent: Center(
                    child: Text(
                      quiz.getAnswerText('d'),
                      style: kTextButtonStyle,
                    ),
                  ),
                  onPress: () {
                    checkAnswer('d')
                        ? quiz.nextQuestion()
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WrongPage()));
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: skips == 1,
                  child: CustomButton(
                      containerContent: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Skip 🔥',
                            style: kTextButtonStyle,
                          ),
                          Text(
                            '(1 remaining)',
                            style: TextStyle(fontFeatures: [
                              FontFeature.subscripts(),
                            ]),
                          ),
                        ],
                      ),
                      onPress: () {
                        setState(() {
                          skips--;
                          quiz.nextQuestion();
                        });
                      },
                      color: Color(0xFF33277B)),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
