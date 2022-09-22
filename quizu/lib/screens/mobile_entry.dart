// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_number/phone_number.dart';
import 'package:quizu/Components/new_button.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/Components/shared.dart';
import 'package:quizu/screens/error.dart';
import 'package:quizu/screens/otp.dart';
import 'package:quizu/screens/quiz_me.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MobileEntry extends StatefulWidget {
  const MobileEntry({super.key});

  @override
  State<MobileEntry> createState() => MobileEntryState();
}

class MobileEntryState extends State<MobileEntry> {
  String? token;
  String mobileNum = '';
  String countryValue = 'Saudi Arabia';
  String countryCode = '966';
  String countryPrefix = 'SA';
  bool isValid = false;
  RegionInfo region =
      RegionInfo(name: 'Saudi Arabial', code: 'SA', prefix: 966);

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    print(token);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: token != null
          ? QuizMe()
          : SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Expanded(flex: 2, child: quizuLogo()),
                      title(),
                      SizedBox(height: 120),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: kTextInputStyle,
                          autofocus: true,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'images/flag.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Image.asset(
                                    'images/buttonlist.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            hintText: '53 000 0000',
                            hintStyle: kHintStyle,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          maxLength: 9,
                          onChanged: (value) {
                            mobileNum = value;
                            print(mobileNum);
                          },
                        ),
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
                            isValid = await PhoneNumberUtil()
                                .validate(mobileNum, regionCode: region.code);
                            print(isValid);
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
                          }),

                      // Expanded(
                      //   flex: 1,
                      //   child: Padding(
                      //     padding: EdgeInsets.all(55),
                      //     child: MyContainer(
                      //       color: kRoundButtonColor,
                      //       containerContent: Center(
                      //         child: Text(
                      //           'Start',
                      //           style: kTextButtonStyle2,
                      //         ),
                      //       ),
                      //       onPress: () async {
                      //         isValid = await PhoneNumberUtil()
                      //             .validate(mobileNum, regionCode: region.code);
                      //         print(isValid);
                      //         if (isValid) {
                      //           Navigator.pushReplacement(
                      //             context,
                      //             MaterialPageRoute(
                      //               builder: (context) => OTPShow(
                      //                 mobileNum: mobileNum,
                      //               ),
                      //             ),
                      //           );
                      //         } else {
                      //           Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //               builder: (context) => ErrorPage(
                      //                 text: 'Check Your Phone Number',
                      //               ),
                      //             ),
                      //           );
                      //         }
                      //       },
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
