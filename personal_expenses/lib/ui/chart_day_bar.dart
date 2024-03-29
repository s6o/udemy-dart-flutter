import 'package:flutter/material.dart';

import './../models/transaction.dart';

class ChartDayBar extends StatelessWidget {
  final Transaction dayTotal;
  final double fillPrecentage;

  ChartDayBar(this.dayTotal, this.fillPrecentage);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 15,
          child: FittedBox(
            child: Text(dayTotal.amountText,
                style: Theme.of(context).textTheme.subtitle),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: this.fillPrecentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 15,
          child: FittedBox(
            child: Text(dayTotal.title.substring(0, 2)),
          ),
        ),
      ],
    );
  }
}
