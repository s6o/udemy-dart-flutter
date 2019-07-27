import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  final String question;

  QuestionText(this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(question, style: TextStyle(fontSize: 20)),
    );
  }
}
