// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quizu/Components/answers.dart';
import 'package:quizu/Components/custom_route.dart';
import 'package:quizu/Components/my_container.dart';
import 'package:quizu/Components/networking.dart';
import 'package:quizu/Components/new_button.dart';
import 'package:quizu/Components/quiz.dart';
import 'package:quizu/Components/spin_kit.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/screens/error.dart';
import 'package:quizu/screens/finsihed_screen.dart';
import 'package:quizu/screens/quiz_me.dart';
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
  bool _isLoading = true;
  late List<String> prevScores = [];
  var dt = DateTime.now();
  int length = 0;
  bool failure = false;

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
    String time = dt.hour >= 12 && dt.hour < 24 ? 'PM' : 'AM';
    prevScores.add(
        '${dt.hour % 12 == 0 ? '00' : dt.hour % 12}:${dt.minute < 10 ? '0${dt.minute}' : dt.minute} $time ${dt.day}/${dt.month}/${dt.year}          ${counter < 10 ? '0$counter' : counter}');
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

  Future<void> getInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('scores')) {
      prevScores = prefs.getStringList('scores')!;
    }
    dynamic data = await helper.getQuestions();
    failure = data == false;
    if (!failure) {
      quiz.createQuiz(data);
      length = Quiz.length;
    }
  }

  @override
  void initState() {
    super.initState();
    quiz.reset();
    getInfo().then((value) {
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return failure
        ? ErrorPage(
            text: 'Something Went Wrong!\nCheck Your Internet Connection',
          )
        : SafeArea(
            child: MyContainer(
              child: Scaffold(
                body: _isLoading
                    ? loading()
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child: Icon(
                                  Icons.close,
                                  size: 50,
                                ),
                                onTap: () => Navigator.pushReplacement(
                                    context,
                                    CustomRoute(
                                        child: QuizMe(),
                                        direction: AxisDirection.left)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 60,
                            child: Stack(
                              children: [
                                Center(
                                  child: Transform.scale(
                                    scale: 2.5,
                                    child: CircularProgressIndicator(
                                      value: seconds / 120,
                                      color: seconds < 30
                                          ? Colors.red
                                          : Colors.green,
                                      strokeWidth: 3,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    intToTimeLeft(seconds),
                                    style: kTimerStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      '${Quiz.current + 1} / $length',
                                      style: TextStyle(
                                        fontFeatures: [
                                          FontFeature.subscripts(),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 400,
                                      height: 100,
                                      child: Center(
                                        child: AnimatedSwitcher(
                                          duration:
                                              const Duration(milliseconds: 400),
                                          child: Text(
                                            quiz.getText(),
                                            style: kQuestion,
                                            textAlign: TextAlign.center,
                                            key: ValueKey(quiz.getText()),
                                          ),
                                        ),
                                      ),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Skip 🔥',
                                              style: kAnswerButtonStyle,
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
                                        color: Color(0xFF33277B),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          );
  }
}
