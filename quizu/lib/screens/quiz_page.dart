// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quizu/Components/networking.dart';
import 'package:quizu/Components/new_button.dart';
import 'package:quizu/Components/quiz.dart';
import 'package:quizu/Components/spin_kit.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/screens/finsihed_screen.dart';
import 'package:quizu/screens/wrong.dart';

Quiz quiz = Quiz();
NetworkingHelper helper = NetworkingHelper();

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int seconds = 120;
  int skips = 1;
  late Timer _timer;
  int counter = 0;
  bool _isLoading = false;
  String question = '';
  String a = '';
  String b = '';
  String c = '';
  String d = '';

  String intToTimeLeft(int seconds) {
    int min = seconds ~/ 60;

    int second = seconds - (min * 60);
    if (min == 0) {
      return '$second';
    }

    return '${min > 0 ? "0$min:" : ''}${second < 10 ? '0$second' : second}';
  }

  void getInfo() async {
    _isLoading = true;

    dynamic data = await helper.getQuestions();
    quiz.createQuiz(data);
    setState(() {
      _isLoading = false;
    });
  }

  bool checkAnswer(String pickedAnswer) {
    if (pickedAnswer == quiz.getFinalAnswer()) {
      counter++;
      return true;
    }
    return false;
  }

  Future callWrong() {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => WrongPage()));
  }

  void sendScore() {
    helper.sendScore(counter);
  }

  void changeData() {
    if (!quiz.isFinshed()) {
      question = quiz.getText();
      a = quiz.getAnswerText('a');
      b = quiz.getAnswerText('b');
      c = quiz.getAnswerText('c');
      d = quiz.getAnswerText('d');
    } else {
      _timer.cancel();
      counter++;
      sendScore();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: ((context) => FinishedScreen(score: counter))));
    }
  }

  @override
  void initState() {
    super.initState();
    getInfo();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      changeData();
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else if (seconds <= 0 || quiz.isFinshed()) {
          _timer.cancel();
          sendScore();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: ((context) => FinishedScreen(score: counter))));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _isLoading
            ? loading()
            : Column(
                children: [
                  LinearProgressIndicator(
                    value: seconds / 120,
                    color: seconds < 30 ? Colors.red : Colors.green,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Center(
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                intToTimeLeft(seconds),
                                style: kNumberStyle,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Text(
                                question,
                                style: kQuestion,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              containerContent: Center(
                                child: Text(
                                  a,
                                  style: kTextButtonStyle,
                                ),
                              ),
                              onPress: () {
                                setState(() {
                                  checkAnswer('a')
                                      ? quiz.nextQuestion()
                                      : callWrong();
                                });
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomButton(
                              containerContent: Center(
                                child: Text(
                                  b,
                                  style: kTextButtonStyle,
                                ),
                              ),
                              onPress: () {
                                checkAnswer('b')
                                    ? quiz.nextQuestion()
                                    : callWrong();
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomButton(
                              containerContent: Center(
                                child: Text(
                                  c,
                                  style: kTextButtonStyle,
                                ),
                              ),
                              onPress: () {
                                checkAnswer('c')
                                    ? quiz.nextQuestion()
                                    : callWrong();
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomButton(
                              containerContent: Center(
                                child: Text(
                                  d,
                                  style: kTextButtonStyle,
                                ),
                              ),
                              onPress: () {
                                checkAnswer('d')
                                    ? quiz.nextQuestion()
                                    : callWrong();
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
                                        style: TextStyle(
                                          fontFeatures: [
                                            FontFeature.subscripts(),
                                          ],
                                        ),
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
                  ),
                ],
              ),
        // bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
