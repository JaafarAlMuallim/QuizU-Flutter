// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quizu/Components/my_container.dart';
import 'package:quizu/Components/new_button.dart';
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
    return MyContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Warning',
            style: kAppBarStyle,
          ),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    margin: EdgeInsets.all(30),
                    child: Lottie.asset(
                      'animations/Error.json',
                      height: 170,
                      width: 175,
                    )),
                Container(
                  margin: EdgeInsets.all(30),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(widget.text,
                        textAlign: TextAlign.center, style: kTextStyle),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(65),
                  child: CustomButton(
                    containerContent: Center(
                      child: Text(
                        'Start Again',
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
        ),
      ),
    );
  }
}
