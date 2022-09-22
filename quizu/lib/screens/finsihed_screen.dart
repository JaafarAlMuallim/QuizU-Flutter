// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizu/Components/bottom_navbar.dart';
import 'package:quizu/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class FinishedScreen extends StatefulWidget {
  const FinishedScreen({super.key, required this.score});

  final int score;

  @override
  State<FinishedScreen> createState() => _FinishedScreenState();
}

class _FinishedScreenState extends State<FinishedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: Image.asset(
              'images/FinishLine.png',
              width: 175,
              height: 170,
            ),
          ),
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
                    TextSpan(text: '${widget.score}\n', style: kNumberStyle),
                    TextSpan(
                        text: 'Correct Answers!\n Share your score others!',
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
                    Uri.parse('https://twitter.com/intent/tweet?text=$text'),
                  );
                }),
                child: Icon(
                  FontAwesomeIcons.twitter,
                  color: Colors.blue,
                  size: 70,
                ),
                //
                //
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
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
