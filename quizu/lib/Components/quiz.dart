import 'question.dart';

int _current = 0;

class Quiz {
  static List<Question> _allQuestions = [];
  static int current = 0;
  static int length = 0;
  createQuiz(List<Question> questions) {
    _allQuestions = questions;
    _current = 0;
    length = questions.length;
  }

  void nextQuestion() {
    if (_current < _allQuestions.length - 1) {
      _current++;
      current++;
    }
  }

  String getText() {
    return _allQuestions[_current].text;
  }

  String getAnswerText(String answers) {
    if (answers == 'a') {
      return _allQuestions[_current].a;
    }
    if (answers == 'b') {
      return _allQuestions[_current].b;
    }
    if (answers == 'c') {
      return _allQuestions[_current].c;
    } else {
      return _allQuestions[_current].d;
    }
  }

  String getFinalAnswer() {
    return _allQuestions[_current].correctAnswer;
  }

  bool isFinshed() {
    if (_current >= _allQuestions.length - 1) {
      return true;
    }
    return false;
  }

  void reset() {
    _current = 0;
    current = 0;
    length = 0;
    return;
  }
}
