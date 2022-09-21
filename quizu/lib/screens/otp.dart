// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizu/Components/detector.dart';
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
void check() {
  print(otp);
}

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            title(),
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
            Container(
              margin: EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [otpField(), otpField(), otpField(), otpField()],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: MyContainer(
                    color: kRoundButtonColor,
                    containerContent: Center(
                        child: Text(
                      'Check',
                      style: kTextButtonStyle2,
                    )),
                    onPress: () {
                      if (otp == '0000') {
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
              ),
            )
            // GestureDetector(
            //   onTap: () {
            //     if (otp == '0000') {
            //       Navigator.pushReplacement(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) =>
            //                 NameEntry(mobileNum: widget.mobileNum, otp: otp)),
            //       );
            //     }
            //   },
            //   child: Container(
            //     margin: const EdgeInsets.all(margin),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(borderRadius),
            //       color: kInactiveContainer,
            //     ),
            //     child: Center(
            //       child: Text(
            //         'Check',
            //         style: kTextButtonStyle,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
        // OTPTextField(
        //   length: 4,
        //   width: MediaQuery.of(context).size.width,
        //   fieldWidth: 80,
        //   style: const TextStyle(fontSize: 17),
        //   textFieldAlignment: MainAxisAlignment.spaceAround,
        //   fieldStyle: FieldStyle.underline,
        //   onChanged: (pin) {
        //     otp = pin;
        //   },
        //   onCompleted: (otp) {
        //     print('Completed: $otp');
        //   },
        // ),
      ),
    );
  }
}

//  TextButton(
//           style: kButtonStyle,
//           child: const Text(
//             'check',
//             style: kTextButtonStyle,
//           ),
//           onPressed: () {
//             if (otp == '0000') {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) =>
//                         NameEntry(mobileNum: widget.mobileNum, otp: otp)),
//               );
//             }
//           },
//         ),