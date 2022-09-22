// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/screens/leaderboard.dart';
import 'package:quizu/screens/profile.dart';
import 'package:quizu/screens/quiz_me.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  static int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: kAppBarColor,
      elevation: 0,
      child: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBottomBar(
                icon: Icons.home,
                selected: _selectedIndex == 0,
                onPressed: () {
                  setState(
                    () {
                      if (_selectedIndex != 0) {
                        _selectedIndex = 0;
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => QuizMe())));
                      }
                    },
                  );
                },
              ),
              IconBottomBar(
                icon: Icons.leaderboard,
                selected: _selectedIndex == 1,
                onPressed: () {
                  setState(
                    () {
                      if (_selectedIndex != 1) {
                        _selectedIndex = 1;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => LeaderBoard()),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
              IconBottomBar(
                icon: Icons.account_circle,
                selected: _selectedIndex == 2,
                onPressed: () {
                  setState(
                    () {
                      if (_selectedIndex != 2) {
                        _selectedIndex = 2;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => ShowProfile()),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {super.key,
      required this.icon,
      required this.selected,
      required this.onPressed});
  final IconData icon;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: onPressed,
          icon:
              Icon(icon, size: 40, color: selected ? kActivated : kInActivated),
        ),
      ],
    );
  }
}
