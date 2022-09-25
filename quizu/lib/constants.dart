// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

const kHourglass = 'QuizU ⏳';

const kBackgroundColor = Color(0xFF2E1F46);
const kButtonColor = Color(0xFF19104E);
const kAppBarColor = Color(0xFF190E2B);
const kBottomAppBar = Color(0xFF6436AE);
const kActivated = Color(0xFF5E6AD9);
const kInActivated = Color(0xFF636365);
const kAppBarStyle = TextStyle(
  fontSize: 32.0,
  fontFamily: 'TitilliumWeb',
);
var kHintStyle = TextStyle(
  fontSize: 22,
  color: Colors.black45,
  fontFamily: 'TitilliumWeb',
);
var kButtonStyle = TextButton.styleFrom(
  backgroundColor: Color.fromARGB(255, 40, 46, 137),
);

const kTextButtonStyle = TextStyle(
  color: Colors.white,
  fontSize: 26,
  fontFamily: 'TitilliumWeb',
);
const kTextInputStyle = TextStyle(
  color: Colors.black,
  fontSize: 26,
  fontFamily: 'TitilliumWeb',
);
const kTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 36,
  fontFamily: 'TitilliumWeb',
);
const kInfoStyle = TextStyle(
  color: Colors.white,
  fontSize: 30,
  fontFamily: 'TitilliumWeb',
);
const kChallenge = TextStyle(
  fontSize: 32,
  fontFamily: 'TitilliumWeb',
);

const kNumberStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
  fontFamily: 'TitilliumWeb',
);

const kQuestion = TextStyle(
  fontSize: 32.0,
  color: Colors.white,
  fontFamily: 'TitilliumWeb',
);

const kTitleStyle = TextStyle(
  fontSize: 58.0,
  fontFamily: 'TitilliumWeb',
);
const kSubtitleStyle = TextStyle(
  fontSize: 32.0,
  fontFamily: 'TitilliumWeb',
);
const kBodyStyle = TextStyle(
  fontSize: 22.0,
  fontFamily: 'TitilliumWeb',
);
const kInputStyle = TextStyle(
  fontSize: 22.0,
  fontFamily: 'TitilliumWeb',
  color: Colors.black,
);

const kMyInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  prefixIconConstraints: BoxConstraints(minWidth: 20, maxWidth: 30),
  hintText: 'Mohammad Al Ali',
  hintStyle: TextStyle(
    color: Colors.grey,
    fontFamily: 'TitilliumWeb',
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      borderSide: BorderSide.none),
);
