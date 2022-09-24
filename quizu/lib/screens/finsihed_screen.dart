// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:quizu/Components/bottom_navbar.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/screens/quiz_me.dart';
import 'package:url_launcher/url_launcher.dart';

class FinishedScreen extends StatefulWidget {
  const FinishedScreen({super.key, required this.score});

  final int score;

  @override
  State<FinishedScreen> createState() => _FinishedScreenState();
}

class _FinishedScreenState extends State<FinishedScreen> {
  late String checkAnswer;
  void checkScore() {
    if (widget.score >= 25) {
      checkAnswer = 'Gold.json';
    } else if (widget.score >= 20) {
      checkAnswer = 'Silver.json';
    } else if (widget.score >= 15) {
      checkAnswer = 'Bronze.json';
    } else {
      checkAnswer = 'Flags.json';
    }
  }

  @override
  void initState() {
    checkScore();
    super.initState();
  }

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
                    color: Colors.white,
                    size: 60,
                  ),
                ),
                onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => QuizMe()))),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.all(30),
                    child: Lottie.asset(
                      'animations/$checkAnswer',
                      height: 170,
                      width: 175,
                    )),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'You Have Finished\n',
                        style: kSubtitleStyle,
                        children: [
                          TextSpan(
                              text: '${widget.score}\n', style: kNumberStyle),
                          TextSpan(
                              text:
                                  'Correct Answers!\n Share your score others!',
                              style: kSubtitleStyle),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (() async {
                        String text =
                            'I have Finished The Quiz With ${widget.score} Correct Answer! You Can Also Try it in QuizU!';
                        await launchUrl(
                          Uri.parse(
                              'https://twitter.com/intent/tweet?text=$text'),
                        );
                      }),
                      child: Icon(
                        FontAwesomeIcons.twitter,
                        color: Colors.blue,
                        size: 70,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    GestureDetector(
                      onTap: ((() async {
                        String text =
                            'I have Finished The Quiz With ${widget.score} Correct Answer! You Can Also Try it in QuizU!';
                        await launchUrl(
                          Uri.parse('https://api.whatsapp.com/send?text=$text'),
                        );
                      })),
                      child: Icon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.green,
                        size: 70,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
