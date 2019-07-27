import 'package:flutter/material.dart';

class QuizResults extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;

  QuizResults(this.totalScore, this.resetHandler);

  String get resultPhrase {
    if (totalScore <= 8) {
      return 'You are awesome and innocent!';
    } else if (totalScore <= 12) {
      return 'Pretty likeable!';
    } else if (totalScore <= 16) {
      return 'You are ... strange?!';
    } else {
      return 'You are so bad...';
    }
  }

  @override
  Widget build(BuildContext context) {
    print(totalScore);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz'),
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
