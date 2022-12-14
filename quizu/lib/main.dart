// ignore_for_file: prefer_const_constructors, unused_local_variable, depend_on_referenced_packages

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:quizu/Components/my_container.dart';
import 'package:quizu/Components/networking.dart';
import 'package:quizu/Components/spin_kit.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/screens/error.dart';
import 'package:quizu/screens/mobile_entry.dart';
import 'package:quizu/screens/quiz_me.dart';
import 'package:page_transition/page_transition.dart' show PageTransitionType;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const SplashScreen());
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
        // scaffoldBackgroundColor: kBackgroundColor,
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(backgroundColor: kAppBarColor),
        canvasColor: kAppBarColor,
      ),
      home: FutureBuilder<dynamic>(
        future: helper.start(),
        builder: (buildContext, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null && snapshot.data == true) {
              return QuizMe();
            } else if (snapshot.data != null && snapshot is int) {
              return ErrorPage(text: 'Something Went Wrong!');
            }
            return MobileEntry();
          } else {
            return MyContainer(child: Center(child: loading()));
          }
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyContainer(
        child: Scaffold(
          body: AnimatedSplashScreen(
            splash: Lottie.asset('animations/Welcome.json'),
            backgroundColor: kBackgroundColor,
            splashIconSize: 1200,
            duration: 1500,
            splashTransition: SplashTransition.fadeTransition,
            nextScreen: MyApp(),
            pageTransitionType: PageTransitionType.rightToLeft,
            animationDuration: Duration(milliseconds: 1300),
          ),
        ),
      ),
    );
  }
}
