// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  MyContainer({super.key, required this.child});
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'images/Background.png',
            ),
            fit: BoxFit.cover),
        // gradient: LinearGradient(
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        //   colors: [Color(0xFF411152), Color.fromARGB(255, 99, 21, 116)],
        // colors: [Color(0xFF321457), Color(0xFF4C2083), Color(0xFF5F28A4)],
        // ),
      ),
      child: child,
    );
  }
}
