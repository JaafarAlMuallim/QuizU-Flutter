// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quizu/Components/question.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String loginUrl = 'https://quizu.okoul.com/Login';
const String nameUrl = 'https://quizu.okoul.com/Name';
const String boardUrl = 'https://quizu.okoul.com/TopScores';
const String infoUrl = 'https://quizu.okoul.com/UserInfo';
const String questionsUrl = 'https://quizu.okoul.com/Questions';
// const token =
// 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjYyLCJpYXQiOjE2NjM2OTk0Mzh9.5qDAy5Zpj1XZfnh9amp0bLisIabChQhx8u13ZAr9hk4';

// fetchToken() async {
//   dynamic tokenFuture = await SharedPrefUtils.readPrefStr('token');
//   return tokenFuture;
// }

class NetworkingHelper {
  static dynamic myToken;

  Future<dynamic> login(String otp, String mobile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response res = await http
        .post(Uri.parse(loginUrl), body: {'OTP': '0000', 'mobile': '09'});
    if (res.statusCode >= 200 || res.statusCode < 400) {
      print(res.body);
      dynamic data = await jsonDecode(res.body);
      String token = data['token'];
      print(token);
      await prefs.setString('token', token);
      myToken = prefs.getString('token');
      return jsonDecode(res.body);
    }
  }

  Future<dynamic> registerName(String name) async {
    http.Response res = await http.post(Uri.parse(nameUrl),
        body: {'name': 'foo'}, headers: {'Authorization': myToken});
    if (res.statusCode >= 200 || res.statusCode < 400) {
      print(res.body);
      return jsonDecode(res.body);
    }
  }

  Future<dynamic> getTopTen() async {
    http.Response res = await http
        .get(Uri.parse(boardUrl), headers: {'Authorization': myToken});
    if (res.statusCode >= 200 || res.statusCode < 400) {
      print(res.body);
      return jsonDecode(res.body);
    }
  }

  Future<dynamic> getUserInfo() async {
    http.Response res =
        await http.get(Uri.parse(infoUrl), headers: {'Authorization': myToken});
    if (res.statusCode >= 200 || res.statusCode < 400) {
      print(res.body.isNotEmpty);
      return jsonDecode(res.body);
    } else {
      print(res.statusCode);
    }
  }

  Future<dynamic> getQuestions() async {
    int index = 0;
    List<Question> questions = [];
    http.Response res = await http
        .get(Uri.parse(questionsUrl), headers: {'Authorization': myToken});
    if (res.statusCode >= 200 || res.statusCode < 400) {
      print(res.body);
      dynamic dataParsed = await jsonDecode(res.body);
      for (dynamic item in dataParsed) {
        Question question = Question.fromJson(dataParsed[index]);
        questions.add(question);
        index++;
      }
      print('First Element');
      print(dataParsed[0]);
      // List<Question> questions = http.fromJson(data);
    } else {
      print(res.statusCode);
    }
  }
}
