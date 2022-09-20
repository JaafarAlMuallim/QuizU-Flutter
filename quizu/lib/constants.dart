// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

// const kHourglass = '\u{23F3}';
const kHourglass = 'QuizU ⏳';
const kBottomContainerHeight = 80.0;
const margin = 15.0;
const borderRadius = 10.0;
const iconSize = 75.0;
const kBoxHeight = 10.0;

const kMinSlider = 120.0;
const kMaxSlider = 240.0;
const kInactiveSlider = Color(0xFF8D8E98);
const kOverlayColor = Color(0x29EB1555);

const kActiveContainer = Color(0xFF131E33);
const kInactiveContainer = Color(0xFF111328);

const backgroundColor = Color(0xFF0A0E21);

const kBottomContainerColor = Color(0xFFEB1555);

const kRoundButtonColor = Color(0xFF4C4F5E);

const kNumberStyle = TextStyle(
  fontSize: 45.0,
  fontWeight: FontWeight.w900,
);
const kLabelStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const kLargeButtonStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);
const kQuestion = TextStyle(
  fontSize: 22.0,
  color: Color(0xFF8D8E98),
);
const kResultText = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);
const kAppBarStyle = TextStyle(
  fontSize: 24.0,
);
const kTitleStyle = TextStyle(
  fontSize: 58.0,
);
const kBodyStyle = TextStyle(
  fontSize: 22.0,
);

const kInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  prefixIcon: Icon(Icons.flag),
  prefixIconConstraints: BoxConstraints(minWidth: 20, maxWidth: 30),
  hintText: '53 000 0000',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      borderSide: BorderSide.none),
);
const kMyInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  prefixIconConstraints: BoxConstraints(minWidth: 20, maxWidth: 30),
  hintText: 'Mohammad Al Ali',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      borderSide: BorderSide.none),
);
const kHintStyle = TextStyle(
  fontSize: 16,
);
var kButtonStyle = TextButton.styleFrom(
  backgroundColor: Color.fromARGB(255, 40, 46, 137),
);
const kTextButtonStyle = TextStyle(
  color: Colors.white,
  fontSize: 20,
);
const kChallenge = TextStyle(fontSize: 32);
