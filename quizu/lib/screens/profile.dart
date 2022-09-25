// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizu/Components/bottom_navbar.dart';
import 'package:quizu/Components/networking.dart';
import 'package:quizu/Components/spin_kit.dart';
import 'package:quizu/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowProfile extends StatefulWidget {
  const ShowProfile({super.key});

  @override
  State<ShowProfile> createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  String? name;
  String mobile = '';
  bool _isLoading = false;
  List<String> scores = [];

  void getInfo() async {
    _isLoading = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    scores = prefs.getStringList('scores')!;
    NetworkingHelper helper = NetworkingHelper();
    dynamic data = await helper.getUserInfo();
    name = data['name'];
    mobile = data['mobile'];
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            kHourglass,
            style: kAppBarStyle,
          ),
          centerTitle: true,
        ),
        body: _isLoading
            ? loading()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Icon(Icons.logout, size: 75)],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Name: $name',
                          style: kTextStyle,
                        ),
                        Text(
                          'Mobile: +966$mobile',
                          style: kTextStyle,
                        ),
                        Column(
                          children: scores
                              .map((e) => Text(e, style: kNumberStyle))
                              .toList(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
