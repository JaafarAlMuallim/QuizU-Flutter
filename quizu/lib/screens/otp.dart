// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sharedColumn(
        OTPTextField(
          length: 4,
          width: MediaQuery.of(context).size.width,
          fieldWidth: 80,
          style: const TextStyle(fontSize: 17),
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldStyle: FieldStyle.underline,
          onChanged: (pin) {
            otp = pin;
          },
          onCompleted: (otp) {
            print('Completed: $otp');
          },
        ),
        GestureDetector(
          onTap: () {
            if (otp == '0000') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        NameEntry(mobileNum: widget.mobileNum, otp: otp)),
              );
            }
          },
          child: Container(
            margin: const EdgeInsets.all(margin),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: kInactiveContainer,
            ),
            child: Center(
              child: Text(
                'Check',
                style: kTextButtonStyle,
              ),
            ),
          ),
        ),
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