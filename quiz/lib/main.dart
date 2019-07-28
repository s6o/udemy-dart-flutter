import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';
import 'quiz.dart';
import 'quiz_results.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<QuizApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  List<Question> _questions = [
    Question('What is your favorite color?', [
      Answer('Black', 10),
      Answer('Red', 5),
      Answer('Green', 3),
      Answer('White', 1),
    ]),
    Question('What is your favorite animal?', [
      Answer('Rabbit', 3),
      Answer('Snake', 11),
      Answer('Elephant', 5),
      Answer('Lion', 9),
    ]),
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex < _questions.length
          ? _questionIndex + 1
          : _questionIndex;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: _questionIndex == _questions.length
            ? QuizResults(_totalScore, _resetQuiz)
            : Quiz(_questions[_questionIndex], _answerQuestion),
      ),
    );
  }
}
