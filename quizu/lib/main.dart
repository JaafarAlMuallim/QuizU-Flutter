// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:quizu/Components/networking.dart';
import 'package:quizu/Components/spin_kit.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/screens/mobile_entry.dart';
import 'package:quizu/screens/quiz_me.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void checker() async {
    NetworkingHelper helper = NetworkingHelper();
  }

  @override
  void initState() {
    super.initState();
    checker();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        backgroundColor: kBackgroundColor,
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: const AppBarTheme(backgroundColor: kAppBarColor),
        canvasColor: kAppBarColor,
      ),
      home: FutureBuilder<bool>(
        future: helper.start(),
        builder: (buildContext, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null && snapshot.data == true) {
              return MobileEntry();
            }
            return QuizMe();
          } else {
            return Center(child: loading());
          }
        },
      ),
    );
  }
}
// Widget build(BuildContext context) {
  //   return MaterialApp(
  //       title: 'Flutter Demo',
  //       theme: ThemeData.dark().copyWith(
  //         backgroundColor: kBackgroundColor,
  //         scaffoldBackgroundColor: kBackgroundColor,
  //         appBarTheme: const AppBarTheme(backgroundColor: kAppBarColor),
  //         canvasColor: kAppBarColor,
  //       ),
  //       home: token != null ? QuizMe() : MobileEntry());
  // }