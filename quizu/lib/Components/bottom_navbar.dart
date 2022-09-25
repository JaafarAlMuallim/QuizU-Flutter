// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:quizu/Components/custom_route.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/screens/leaderboard.dart';
import 'package:quizu/screens/profile.dart';
import 'package:quizu/screens/quiz_me.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  static int _selectedIndex = 0;
  static reset() {
    _selectedIndex = 0;
  }

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = BottomNavBar._selectedIndex;
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
                selected: BottomNavBar._selectedIndex == 0,
                onPressed: () {
                  setState(
                    () {
                      if (_currentIndex != 0) {
                        Navigator.pushReplacement(
                            context,
                            CustomRoute(
                                child: QuizMe(),
                                direction: AxisDirection.right));
                        BottomNavBar._selectedIndex = 0;
                      }
                    },
                  );
                },
              ),
              IconBottomBar(
                  icon: Icons.leaderboard,
                  selected: _currentIndex == 1,
                  onPressed: () {
                    setState(() {
                      if (_currentIndex != 1) {
                        Navigator.pushReplacement(
                            context,
                            CustomRoute(
                                child: LeaderBoard(),
                                direction: _currentIndex <= 1
                                    ? AxisDirection.left
                                    : AxisDirection.right));
                        BottomNavBar._selectedIndex = 1;
                      }
                    });
                  }),
              IconBottomBar(
                icon: Icons.account_circle,
                selected: _currentIndex == 2,
                onPressed: () {
                  setState(
                    () {
                      if (_currentIndex != 2) {
                        Navigator.pushReplacement(
                            context,
                            CustomRoute(
                                child: ShowProfile(),
                                direction: AxisDirection.left));
                        BottomNavBar._selectedIndex = 2;
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
