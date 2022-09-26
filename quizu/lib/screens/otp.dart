// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizu/Components/my_container.dart';
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

final otp1 = TextEditingController();
final otp2 = TextEditingController();
final otp3 = TextEditingController();
final otp4 = TextEditingController();
String otp = '';

class _OTPShowState extends State<OTPShow> {
  SizedBox otpField(bool last) {
    return SizedBox(
      height: 70,
      width: 70,
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            otp += value;
            !last ? FocusScope.of(context).nextFocus() : checkOTP(otp);
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

  void checkOTP(passedOtp) {
    if (passedOtp == '0000') {
      otp = '';
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                NameEntry(mobileNum: widget.mobileNum, otp: passedOtp)),
      );
    } else {
      otp1.clear();
      otp2.clear();
      otp3.clear();
      otp4.clear();
      otp = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MyContainer(
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
                          otpField(false),
                          otpField(false),
                          otpField(false),
                          otpField(true)
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
                          checkOTP(otp);
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
