import 'package:flutter/material.dart';

import './../models/transaction.dart';
import './../ui/transaction_entry.dart';
import './../ui/transaction_list.dart';

class TransactionLog extends StatefulWidget {
  @override
  _TransactionLogState createState() => _TransactionLogState();
}

class _TransactionLogState extends State<TransactionLog> {
  final List<Transaction> transactions = [
    Transaction(
      title: 'New Shoes',
      amount: Money(6999, Currency('EUR')),
    ),
    Transaction(
      title: 'Weekly Groceries',
      amount: Money(10025, Currency('EUR')),
    ),
  ];

  void _newTransaction(Transaction tx) {
    setState(() {
      transactions.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionEntry(_newTransaction),
        TransactionList(transactions),
      ],
    );
  }
}
