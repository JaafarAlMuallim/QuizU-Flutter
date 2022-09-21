// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_number/phone_number.dart';
import 'package:quizu/Components/detector.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/Components/shared.dart';
import 'package:quizu/screens/error.dart';
import 'package:quizu/screens/otp.dart';

class MobileEntry extends StatefulWidget {
  const MobileEntry({super.key});

  @override
  State<MobileEntry> createState() => MobileEntryState();
}

class MobileEntryState extends State<MobileEntry> {
  String mobileNum = '';
  String countryValue = 'Saudi Arabia';
  String countryCode = '966';
  String countryPrefix = 'SA';
  bool isValid = false;
  RegionInfo region =
      RegionInfo(name: 'Saudi Arabial', code: 'SA', prefix: 966);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Expanded(flex: 2, child: quizuLogo()),
            title(),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  style: kTextButtonStyle,
                  autofocus: true,
                  decoration: InputDecoration(
                    prefix: CountryListPick(
                      useSafeArea: true,
                      theme: CountryTheme(
                          isShowFlag: true,
                          isShowTitle: false,
                          isShowCode: false),
                      initialSelection: 'SA',
                      onChanged: ((value) {
                        countryCode = value.toString();
                        print(value);
                      }),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(55),
                child: MyContainer(
                  color: kRoundButtonColor,
                  containerContent: Center(
                    child: Text(
                      'Start',
                      style: kTextButtonStyle2,
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
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
