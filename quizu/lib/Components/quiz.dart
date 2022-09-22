import 'question.dart';

int _current = 0;

class Quiz {
  final List<Question> _questions = [
    Question('Who Created Ruby on Rails?', 'Paul Graham', 'DHH', 'Bill Gates',
        'Tom Watson', 'b'),
    Question('What is Albania\'s capital?', 'Shvana', 'Dublin', 'Sokdre',
        'Tirana', 'd'),
    Question('What company created Kotlin?', 'Github', 'JetBrains', 'Google',
        'Facebook', 'b'),
    Question('Who founded HungerStation?', 'Ahmad Al-Ghamdi',
        'Ghassab Al-Mandil', 'Ibrahim Al-Jassem', 'Ahmad Al-Zaini', 'c'),
  ];

  void nextQuestion() {
    if (_current < _questions.length - 1) {
      _current++;
    }
  }

  String getText() {
    return _questions[_current].text;
  }

  String getAnswerText(String answers) {
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

  String getFinalAnswer() {
    return _questions[_current].correctAnswer;
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
