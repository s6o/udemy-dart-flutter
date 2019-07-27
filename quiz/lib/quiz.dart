import 'package:flutter/material.dart';

import 'answer_button.dart';
import 'question.dart';
import 'question_text.dart';

class Quiz extends StatelessWidget {
  final Question quiz;
  final Function answerHandler;

  Quiz(this.quiz, this.answerHandler);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          QuestionText(quiz.question),
          // 'collection for' usage, added in Dart 2.3
          for (var a in quiz.answers)
            AnswerButton(a.answer, () => answerHandler(a.score)),
        ],
      ),
    );
  }
}
