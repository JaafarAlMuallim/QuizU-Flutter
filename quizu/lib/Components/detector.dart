// ignore_for_file: prefer_if_null_operators

import 'package:quizu/constants.dart';
import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer(
      {super.key, required this.color, this.containerContent, this.onPress});
  final Color color;
  final Widget? containerContent;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(margin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,
        ),
        child: containerContent,
      ),
    );
  }
}