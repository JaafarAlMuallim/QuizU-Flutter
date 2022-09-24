// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizu/Components/bottom_navbar.dart';
import 'package:quizu/Components/networking.dart';
import 'package:quizu/Components/spin_kit.dart';
import 'package:quizu/constants.dart';

class ShowProfile extends StatefulWidget {
  const ShowProfile({super.key});

  @override
  State<ShowProfile> createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  String? name;
  String mobile = '';
  bool _isLoading = false;

  void getInfo() async {
    _isLoading = true;
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
            : Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Name: $name',
                          style: kTextStyle,
                        ),
                        Text(
                          'Mobile: +966$mobile',
                          style: kTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
