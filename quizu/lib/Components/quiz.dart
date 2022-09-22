import 'question.dart';

int _current = 0;

class Quiz {
  static List<Question> _allQuestions = [];

  createQuiz(List<Question> questions) {
    _allQuestions = questions;
  }

  void nextQuestion() {
    if (_current < _allQuestions.length - 1) {
      _current++;
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
    return;
  }
}
