import 'question.dart';

int _current = 0;

class Quiz {
  final List<Question> _questions = [
    Question('Who Created Ruby on Rails?', 'Paul Graham', 'DHH', 'Bill Gates',
        'Tom Watson', 'b'),
  ];

  void nextQuestion() {
    if (_current < _questions.length - 1) {
      _current++;
    }
  }

  String getText() {
    return _questions[_current].text;
  }

  String getAnswer(String answers) {
    if (answers == 'a') {
      return _questions[_current].a;
    }
    if (answers == 'b') {
      return _questions[_current].b;
    }
    if (answers == 'c') {
      return _questions[_current].c;
    } else {
      return _questions[_current].d;
    }
  }

  bool isFinshed() {
    if (_current >= _questions.length - 1) {
      return true;
    }
    return false;
  }

  void reset() {
    _current = 0;
    return;
  }
}
