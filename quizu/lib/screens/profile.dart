// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:quizu/Components/bottom_navbar.dart';
import 'package:quizu/Components/custom_route.dart';
import 'package:quizu/Components/my_container.dart';
import 'package:quizu/Components/networking.dart';
import 'package:quizu/Components/spin_kit.dart';
import 'package:quizu/constants.dart';
import 'package:quizu/screens/error.dart';
import 'package:quizu/screens/mobile_entry.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowProfile extends StatefulWidget {
  const ShowProfile({super.key});

  @override
  State<ShowProfile> createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  String? name;
  String mobile = '';
  bool _isLoading = true;
  List<String> scores = [];
  bool failure = false;
  void getInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('scores') == null) {
      await prefs.setStringList('scores', []);
    }
    scores = prefs.getStringList('scores')!;
    NetworkingHelper helper = NetworkingHelper();
    dynamic data = await helper.getUserInfo();
    failure = data is int;
    name = data['name'];
    mobile = data['mobile'];
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  logout() {
    BottomNavBar.reset();
    Navigator.pushReplacement(context,
        CustomRoute(child: MobileEntry(), direction: AxisDirection.left));
  }

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return failure
        ? ErrorPage(
            text: 'Something Went Wrong!',
          )
        : SafeArea(
            child: MyContainer(
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
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                    splashColor: Colors.purple,
                                    borderRadius: BorderRadius.circular(25),
                                    onTap: () async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.clear();
                                      logout();
                                    },
                                    child: Icon(Icons.logout, size: 50))
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Profile',
                                  style: kTitleStyle,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Name: $name',
                                  style: kInfoStyle,
                                ),
                                Text(
                                  'Mobile: ${mobile.substring(0, 3)} ${mobile.substring(3, 6)} ${mobile.substring(6)}',
                                  style: kInfoStyle,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Divider(
                                  color: Colors.white,
                                  thickness: 4,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'My Scores',
                                  style: kTextStyle,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: scores.isEmpty
                                      ? [
                                          Center(
                                            child: Text(
                                              'Start a Quiz To Save Scores in This Session!',
                                              style: kInfoStyle,
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        ]
                                      : scores
                                          .map((e) => Text(
                                                e,
                                                style: kInfoStyle,
                                                textAlign: TextAlign.center,
                                              ))
                                          .toList(),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                bottomNavigationBar: BottomNavBar(),
              ),
            ),
          );
  }
}
