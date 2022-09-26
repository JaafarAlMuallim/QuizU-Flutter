// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quizu/Components/question.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String verifyUrl = 'https://quizu.okoul.com/Token';
const String loginUrl = 'https://quizu.okoul.com/Login';
const String nameUrl = 'https://quizu.okoul.com/Name';
const String boardUrl = 'https://quizu.okoul.com/TopScores';
const String infoUrl = 'https://quizu.okoul.com/UserInfo';
const String questionsUrl = 'https://quizu.okoul.com/Questions';
const String sendScoreUrl = 'https://quizu.okoul.com/Score';

class NetworkingHelper {
  static dynamic myToken;

  Future<bool> start() async {
    bool success = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    myToken = prefs.getString('token');
    http.Response res = await http
        .get(Uri.parse(verifyUrl), headers: {'Authorization': myToken});
    if (res.statusCode >= 200 || res.statusCode < 400) {
      dynamic data = await jsonDecode(res.body);
      success = data['success'];
    }
    return success;
  }

  Future<dynamic> login(String otp, String mobile) async {
    print(mobile);
    print(otp);
    http.Response res = await http
        .post(Uri.parse(loginUrl), body: {'OTP': otp, 'mobile': '0$mobile'});
    // .post(Uri.parse(loginUrl), body: {'OTP': '0000', 'mobile': '09'});
    if (res.statusCode >= 200 || res.statusCode < 400) {
      dynamic data = await jsonDecode(res.body);
      print(data);
      myToken = data['token'];
      print(myToken);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', myToken);
      return jsonDecode(res.body);
    }
  }

  Future<dynamic> registerName(String name) async {
    http.Response res = await http.post(Uri.parse(nameUrl),
        body: {'name': name}, headers: {'Authorization': myToken});
    if (res.statusCode >= 200 || res.statusCode < 400) {
      return jsonDecode(res.body);
    }
  }

  Future<dynamic> getTopTen() async {
    http.Response res = await http
        .get(Uri.parse(boardUrl), headers: {'Authorization': myToken});
    if (res.statusCode >= 200 || res.statusCode < 400) {
      return jsonDecode(res.body);
    }
  }

  Future<dynamic> getUserInfo() async {
    http.Response res =
        await http.get(Uri.parse(infoUrl), headers: {'Authorization': myToken});
    if (res.statusCode >= 200 || res.statusCode < 400) {
      return jsonDecode(res.body);
    } else {
      print(res.statusCode);
    }
  }

  dynamic getQuestions() async {
    List<Question> questions = [];
    http.Response res = await http
        .get(Uri.parse(questionsUrl), headers: {'Authorization': myToken});
    if (res.statusCode >= 200 || res.statusCode < 400) {
      dynamic dataParsed = await jsonDecode(res.body);
      for (dynamic item in dataParsed) {
        Question question = Question.fromJson(item);
        questions.add(question);
      }
      return questions;
    } else {
      print(res.statusCode);
    }
  }

  void sendScore(int score) async {
    http.Response res = await http.post(Uri.parse(sendScoreUrl),
        body: {'score': score.toString()}, headers: {'Authorization': myToken});
    if (res.statusCode >= 200 || res.statusCode < 400) {
    } else {
      print(res.statusCode);
    }
  }
}
