// ignore_for_file: prefer_const_constructors

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/Components/shared.dart';
import 'package:quizu/screens/otp.dart';

class MobileEntry extends StatefulWidget {
  const MobileEntry({super.key});

  @override
  State<MobileEntry> createState() => MobileEntryState();
}

class MobileEntryState extends State<MobileEntry> {
  String mobileNum = '';
  String countryValue = 'Saudi Arabia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sharedColumn(
        Container(
          margin: EdgeInsets.all(10),
          child: TextField(
            autofocus: true,
            decoration: InputDecoration(
              prefix: CountryListPick(
                theme: CountryTheme(
                    isShowFlag: true, isShowTitle: false, isShowCode: false),
                initialSelection: 'SA',
                onChanged: ((value) => print(value)),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              hintText: '53 000 0000',
              hintStyle: kHintStyle,
              // border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            onChanged: (value) {
              mobileNum = value;
            },
          ),
        ),
        TextButton(
            style: kButtonStyle,
            child: Text(
              'Start',
              style: kTextButtonStyle,
            ),
            onPressed: () {
              if (mobileNum.length == 9) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OTPShow(
                      mobileNum: mobileNum,
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
