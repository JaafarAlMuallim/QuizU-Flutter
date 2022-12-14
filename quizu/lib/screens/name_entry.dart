// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizu/Components/my_container.dart';
import 'package:quizu/Components/networking.dart';
import 'package:quizu/Components/new_button.dart';
import 'package:quizu/Components/shared.dart';
import 'package:quizu/Components/spin_kit.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/screens/error.dart';
import 'package:quizu/screens/quiz_me.dart';

NetworkingHelper helper = NetworkingHelper();

class NameEntry extends StatefulWidget {
  const NameEntry({super.key, required this.mobileNum, required this.otp});
  final String mobileNum;
  final String otp;

  @override
  State<NameEntry> createState() => _NameEntryState();
}

class _NameEntryState extends State<NameEntry> {
  String name = '';
  dynamic token = '';
  bool _isLoading = false;
  bool _newUser = false;
  bool failure = false;

  void getToken() async {
    _isLoading = true;
    dynamic data = await helper.login(widget.otp, widget.mobileNum);
    failure = data == false;
    if (!failure) {
      token = data['token'];
      _newUser = data['message'] == 'user created!';
    }
    setState(() {
      _isLoading = false;
    });
  }

  nextPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => QuizMe()),
    );
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return failure
        ? ErrorPage(
            text: 'Something Went Wrong!\nCheck Your Internet Connection',
          )
        : MyContainer(
            child: Scaffold(
              body: _isLoading
                  ? loading()
                  : SafeArea(
                      child: !_newUser
                          ? QuizMe()
                          : Center(
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    title(),
                                    SizedBox(height: 120),
                                    Text(
                                      "What's your name?",
                                      style: kTextStyle,
                                    ),
                                    SizedBox(height: 50),
                                    Container(
                                      padding: EdgeInsets.all(20.0),
                                      child: TextField(
                                          onChanged: (value) {
                                            name = value;
                                          },
                                          style: kInputStyle,
                                          decoration: kMyInputDecoration),
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    CustomButton(
                                      containerContent: Center(
                                          child: Text(
                                        'Done',
                                        style: kTextButtonStyle,
                                      )),
                                      onPress: () async {
                                        NetworkingHelper helper =
                                            NetworkingHelper();
                                        if (name.isNotEmpty) {
                                          await helper.registerName(name);
                                          nextPage();
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ErrorPage(
                                                text:
                                                    'Your Name Should Not Be Empty!',
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ),
            ),
          );
  }
}
