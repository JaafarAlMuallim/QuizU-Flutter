// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

const kHourglass = 'QuizU ⏳';

// const kBackgroundColor = Color(0xFF2E1F46);
// const kBackgroundColor = Color(0xFF3C096C);
// const kBackgroundColor = Color(0xFF421869);
const kBackgroundColor = Color(0xFF32004f);
const kButtonColor = Color(0xFF19104E);
// const kButtonColor = Color(0xFF4e2c70);
// const kButtonColor = Color(0xFF522882);
// const kButtonColor = Color(0xFF6818a5);
const kAppBarColor = Color(0xFF240046);
// 511f73
// const kAppBarColor = Color(0xFF431259);
// const kAppBarColor = Color(0xFF310055);
// const kAppBarColor = Color(0xFF190028);
const kBottomAppBar = Color(0xFF6436AE);
// const kActivated = Color(0xFF5E6AD9);
const kActivated = Color(0xFF9f21e3);
const kInActivated = Color(0xFF636365);

const kAppBarStyle = TextStyle(
  fontSize: 28.0,
  fontFamily: 'SourceSans',
);
var kHintStyle = TextStyle(
  fontSize: 20,
  color: Colors.black45,
  fontFamily: 'SourceSans',
);
var kButtonStyle = TextButton.styleFrom(
  backgroundColor: Color.fromARGB(255, 40, 46, 137),
);
const kTextButtonStyle = TextStyle(
  color: Colors.white,
  fontSize: 24,
  fontFamily: 'SourceSans',
);
const kAnswerButtonStyle = TextStyle(
  color: Colors.white,
  fontSize: 22,
  fontFamily: 'SourceSans',
);
const kTextInputStyle = TextStyle(
  color: Colors.black,
  fontSize: 22,
  fontFamily: 'SourceSans',
);
const kTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 30,
  fontFamily: 'SourceSans',
);
const kInfoStyle = TextStyle(
  color: Colors.white,
  fontSize: 28,
  fontFamily: 'SourceSans',
);
const kChallenge = TextStyle(
  fontSize: 28,
  fontFamily: 'SourceSans',
);

const kNumberStyle = TextStyle(
  fontSize: 48.0,
  fontWeight: FontWeight.w900,
  fontFamily: 'SourceSans',
);
const kTimerStyle = TextStyle(
  fontSize: 28.0,
  fontFamily: 'SourceSans',
);

const kQuestion = TextStyle(
  fontSize: 30.0,
  color: Colors.white,
  fontFamily: 'SourceSans',
);

const kTitleStyle = TextStyle(
  fontSize: 50.0,
  fontFamily: 'SourceSans',
);
const kSubtitleStyle = TextStyle(
  fontSize: 28.0,
  fontFamily: 'SourceSans',
);
const kBodyStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'SourceSans',
);
const kInputStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'SourceSans',
  color: Colors.black,
);

const kMyInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  prefixIconConstraints: BoxConstraints(minWidth: 20, maxWidth: 30),
  hintText: 'Mohammad Al Ali',
  hintStyle: TextStyle(
    color: Colors.grey,
    fontFamily: 'SourceSans',
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      borderSide: BorderSide.none),
);
