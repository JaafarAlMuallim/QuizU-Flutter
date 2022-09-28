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
      ),
      child: child,
    );
  }
}
