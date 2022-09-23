import 'package:flutter/cupertino.dart';
import 'package:quizu/Components/new_button.dart';
import 'package:quizu/constants.dart';

Widget answer(String text, VoidCallback onPress) {
  return CustomButton(
      containerContent: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          child: Text(
            text,
            style: kTextButtonStyle,
            key: ValueKey(text),
          ),
        ),
      ),
      onPress: onPress);
}
