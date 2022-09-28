// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:phone_number/phone_number.dart' as number;
import 'package:quizu/Components/my_container.dart';
import 'package:quizu/Components/new_button.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/Components/shared.dart';
import 'package:quizu/screens/error.dart';
import 'package:quizu/screens/otp.dart';
import 'package:quizu/screens/quiz_me.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class MobileEntry extends StatefulWidget {
  const MobileEntry({super.key});

  @override
  State<MobileEntry> createState() => MobileEntryState();
}

class MobileEntryState extends State<MobileEntry> {
  String? token;
  String mobileNum = '';
  String countryCode = '966';
  bool isValid = false;
  number.RegionInfo region =
      number.RegionInfo(name: 'Saudi Arabia', code: 'SA', prefix: 966);

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      child: Scaffold(
        body: token != null
            ? QuizMe()
            : SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        title(),
                        SizedBox(height: 120),
                        InternationalPhoneNumberInput(
                          hintText: '53 000 0000',
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SourceSans',
                              fontSize: 20),
                          selectorTextStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SourceSans',
                            fontSize: 20,
                          ),
                          initialValue: PhoneNumber(isoCode: 'SA'),
                          autoFocus: true,
                          maxLength: 11,
                          onInputChanged: (value) {
                            mobileNum = value.phoneNumber!;
                            // print(mobileNum);
                          },
                        ),
                        SizedBox(height: 60),
                        CustomButton(
                            containerContent: Center(
                              child: Text(
                                'Start',
                                style: kTextButtonStyle,
                              ),
                            ),
                            onPress: () async {
                              if (mobileNum.length > 9) {
                                isValid = await number.PhoneNumberUtil()
                                    .validate(mobileNum);
                                if (isValid) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OTPShow(
                                        mobileNum: mobileNum,
                                      ),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ErrorPage(
                                        text: 'Check Your Phone Number',
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ErrorPage(
                                      text: 'Check Your Phone Number',
                                    ),
                                  ),
                                );
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
