import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './../models/transaction.dart';
import './chart_day_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> lastSevenDays;

  Chart(this.lastSevenDays);

  List<Transaction> get groupTxPerDay {
    Map<String, Transaction> results = {};
    this.lastSevenDays.forEach((tx) {
      var key = DateFormat('E, yMd').format(tx.timestamp);
      if (results.containsKey(key)) {
        results[key].amount += tx.amount;
      } else {
        var dayStart = DateFormat('y-MM-d 00:00:00').format(tx.timestamp);
        var ts = DateTime.parse(dayStart);
        results[key] = Transaction.withTimestamp(
          timestamp: ts,
          title: key,
          amount: Money(tx.amount.amount, Currency(tx.amount.currency.code)),
        );
      }
    });

    var txTotals = results.values.toList();
    txTotals.sort((txl, txr) {
      return txl.timestamp.compareTo(txr.timestamp);
    });

    return txTotals;
  }

  Money get maxSevenDaySpend {
    return groupTxPerDay.fold(Money(0, Currency('EUR')), (sum, item) {
      return sum + item.amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      margin: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                child: Text('Last Seven Days'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupTxPerDay.map((tx) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartDayBar(
                    tx,
                    maxSevenDaySpend.amount == 0
                        ? 0.0
                        : (tx.amount.amount.toDouble() /
                            maxSevenDaySpend.amount.toDouble())),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
