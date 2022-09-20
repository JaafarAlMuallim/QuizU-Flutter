import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/screens/mobile_entry.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        backgroundColor: kActiveContainer,
        scaffoldBackgroundColor: kActiveContainer,
        appBarTheme: const AppBarTheme(backgroundColor: kActiveContainer),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page\u{23F3}'),
      home: const MobileEntry(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int seconds = 120;
  String result = '';
  late Timer _timer;

  String intToTimeLeft(int seconds) {
    int min = seconds ~/ 60;

    int second = seconds - (min * 60);
    if (min == 0) {
      return '$second';
    }
    return '${min > 0 ? "0$min:" : ''}${second < 10 ? 0 : second}';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: kAppBarStyle,
        ),
        centerTitle: true,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'PUSHED',
                style: kNumberStyle,
              ),
            ),
            Text(
              intToTimeLeft(seconds),
              style: kNumberStyle,
            ),
          ],
        ),
      ),
    );
  }
}