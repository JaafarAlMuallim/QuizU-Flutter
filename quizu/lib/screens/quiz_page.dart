// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quizu/Components/answers.dart';
import 'package:quizu/Components/networking.dart';
import 'package:quizu/Components/new_button.dart';
import 'package:quizu/Components/quiz.dart';
import 'package:quizu/Components/spin_kit.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/screens/finsihed_screen.dart';
import 'package:quizu/screens/wrong.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  late List<String> prevScores = [];

  String intToTimeLeft(int seconds) {
    int min = seconds ~/ 60;

    int second = seconds - (min * 60);
    return '${min > 0 ? "0$min:" : ''}${second < 10 ? '0$second' : second}';
  }

  bool checkAnswer(String pickedAnswer) {
    if (pickedAnswer == quiz.getFinalAnswer()) {
      counter++;
      return true;
    }
    return false;
  }

  Future callWrong() {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => WrongPage()));
  }

  void sendScore() {
    setScore().then((value) => helper.sendScore(counter));
  }

  Future<void> setScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prevScores.add(counter.toString());
    await prefs.setStringList('scores', prevScores);
  }

  void updateData() {
    if (!quiz.isFinshed()) {
      setState(
        () => quiz.nextQuestion(),
      );
    } else {
      _timer.cancel();
      sendScore();
      quiz.reset();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: ((context) => FinishedScreen(score: counter))));
    }
  }

  void startTimer() {
    updateData();
    quiz.reset();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
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
          _isLoading = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    quiz.reset();
    getInfo().then((value) {
      startTimer();
    });
  }

  Future<void> getInfo() async {
    _isLoading = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('scores')) {
      prevScores = prefs.getStringList('scores')!;
    }
    dynamic data = await helper.getQuestions();
    quiz.createQuiz(data);
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
                              width: 400,
                              height: 120,
                              child: Center(
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 600),
                                  child: Text(
                                    quiz.getText(),
                                    style: kQuestion,
                                    textAlign: TextAlign.center,
                                    key: ValueKey(quiz.getText()),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Column(
                                children: [
                                  answer(
                                    quiz.getAnswerText('a'),
                                    (() => checkAnswer('a')
                                        ? updateData()
                                        : callWrong()),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  answer(
                                    quiz.getAnswerText('b'),
                                    (() => checkAnswer('b')
                                        ? updateData()
                                        : callWrong()),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  answer(
                                    quiz.getAnswerText('c'),
                                    (() => checkAnswer('c')
                                        ? updateData()
                                        : callWrong()),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  answer(
                                    quiz.getAnswerText('d'),
                                    (() => checkAnswer('d')
                                        ? updateData()
                                        : callWrong()),
                                  )
                                ],
                              ),
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
                                      updateData();
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
