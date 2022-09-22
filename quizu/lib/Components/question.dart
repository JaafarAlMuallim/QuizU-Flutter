class Question {
  final String text;
  final String a;
  final String b;
  final String c;
  final String d;
  final String correctAnswer;
  Question(
      {required this.text,
      required this.a,
      required this.b,
      required this.c,
      required this.d,
      required this.correctAnswer});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      text: json['Question'] as String,
      a: json['a'] as String,
      b: json['b'] as String,
      c: json['c'] as String,
      d: json['d'] as String,
      correctAnswer: json['correct'] as String,
    );
  }
}
