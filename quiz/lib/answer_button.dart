import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String label;
  final Function pressHandler;

  AnswerButton(this.label, this.pressHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text(label),
        onPressed: pressHandler,
      ),
    );
  }
}
