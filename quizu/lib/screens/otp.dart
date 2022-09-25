// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizu/Components/new_button.dart';
import 'package:quizu/Components/shared.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/screens/name_entry.dart';

class OTPShow extends StatefulWidget {
  const OTPShow({super.key, required this.mobileNum});
  final String mobileNum;
  @override
  State<OTPShow> createState() => _OTPShowState();
}

String otp = '';

class _OTPShowState extends State<OTPShow> {
  SizedBox otpField() {
    return SizedBox(
      height: 70,
      width: 70,
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            otp += value;
            FocusScope.of(context).nextFocus();
          }
        },
        style: kBodyStyle,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  title(),
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        'Please Enter the OTP Sent to your mobile',
                        style: kSubtitleStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        otpField(),
                        otpField(),
                        otpField(),
                        otpField()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                      containerContent: Center(
                        child: Text(
                          'Check',
                          style: kTextButtonStyle,
                        ),
                      ),
                      onPress: () {
                        if (otp == '0000') {
                          otp = '';
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NameEntry(
                                    mobileNum: widget.mobileNum, otp: otp)),
                          );
                        } else {
                          otp = '';
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
