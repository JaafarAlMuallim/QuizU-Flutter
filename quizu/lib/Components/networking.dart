// ignore_for_file: avoid_print, control_flow_in_finally

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

  Future<dynamic> start() async {
    bool success = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    myToken = prefs.getString('token');
    if (myToken != null) {
      try {
        http.Response res = await http
            .get(Uri.parse(verifyUrl), headers: {'Authorization': myToken});
        if (res.statusCode >= 200 || res.statusCode < 400) {
          dynamic data = await jsonDecode(res.body);
          success = data['success'];
          return success;
        }
        return res.statusCode;
      } catch (e) {
        return false;
      }
    }
    return success;
  }

  Future<dynamic> login(String otp, String mobile) async {
    try {
      http.Response res = await http
          .post(Uri.parse(loginUrl), body: {'OTP': otp, 'mobile': mobile});
      if (res.statusCode >= 200 || res.statusCode < 400) {
        dynamic data = await jsonDecode(res.body);
        myToken = data['token'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', myToken);
        return jsonDecode(res.body);
      }
      return res.statusCode;
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> registerName(String name) async {
    try {
      http.Response res = await http.post(Uri.parse(nameUrl),
          body: {'name': name}, headers: {'Authorization': myToken});
      if (res.statusCode >= 200 || res.statusCode < 400) {
        return jsonDecode(res.body);
      }
      return res.statusCode;
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> getTopTen() async {
    try {
      http.Response res = await http
          .get(Uri.parse(boardUrl), headers: {'Authorization': myToken});
      if (res.statusCode >= 200 || res.statusCode < 400) {
        return jsonDecode(res.body);
      }
      return res.statusCode;
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> getUserInfo() async {
    try {
      http.Response res = await http
          .get(Uri.parse(infoUrl), headers: {'Authorization': myToken});
      if (res.statusCode >= 200 || res.statusCode < 400) {
        return jsonDecode(res.body);
      }
      return res.statusCode;
    } catch (e) {
      return false;
    }
  }

  dynamic getQuestions() async {
    List<Question> questions = [];
    try {
      http.Response res = await http
          .get(Uri.parse(questionsUrl), headers: {'Authorization': myToken});
      if (res.statusCode >= 200 || res.statusCode < 400) {
        dynamic dataParsed = await jsonDecode(res.body);
        for (dynamic item in dataParsed) {
          Question question = Question.fromJson(item);
          questions.add(question);
        }
        return questions;
      }
      return res.statusCode;
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> sendScore(int score) async {
    try {
      http.Response res = await http.post(Uri.parse(sendScoreUrl),
          body: {'score': score.toString()},
          headers: {'Authorization': myToken});
      if (res.statusCode >= 400) {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
