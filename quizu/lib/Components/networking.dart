// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

const String loginUrl = 'https://quizu.okoul.com/Login';
const String nameUrl = 'https://quizu.okoul.com/Name';
const String boardUrl = 'https://quizu.okoul.com/TopScores';
const token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjYyLCJpYXQiOjE2NjM2OTk0Mzh9.5qDAy5Zpj1XZfnh9amp0bLisIabChQhx8u13ZAr9hk4';

class NetworkingHelper {
  NetworkingHelper({required this.mobileNum, required this.otp});
  final String otp;
  final String mobileNum;

  Future<dynamic> login() async {
    http.Response res = await http
        .post(Uri.parse(loginUrl), body: {'OTP': otp, 'mobile': '09'});
    if (res.statusCode >= 200 || res.statusCode < 400) {
      print(res.body);
      return jsonDecode(res.body);
    }
  }

  Future<dynamic> registerName(String name) async {
    http.Response res = await http.post(Uri.parse(nameUrl),
        body: {'name': 'foo'}, headers: {'Authorization': token});
    if (res.statusCode >= 200 || res.statusCode < 400) {
      print(res.body);
      return jsonDecode(res.body);
    }
  }

  Future<dynamic> getTopTen() async {
    http.Response res =
        await http.get(Uri.parse(boardUrl), headers: {'Authorization': token});
    if (res.statusCode >= 200 || res.statusCode < 400) {
      print(res.body);
      return jsonDecode(res.body);
    }
  }
}
