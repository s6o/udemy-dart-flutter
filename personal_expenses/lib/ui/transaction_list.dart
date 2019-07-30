import 'package:flutter/material.dart';

import './../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return _TransactionItem(transactions[index]);
        },
        itemCount: transactions.length,
      ),
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final Transaction tx;

  _TransactionItem(this.tx);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          _TxItemAmount(tx),
          _TxItemTitleTimestamp(tx),
        ],
      ),
    );
  }
}

class _TxItemAmount extends StatelessWidget {
  final Transaction tx;

  _TxItemAmount(this.tx);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.purple,
          width: 2,
        ),
      ),
      padding: EdgeInsets.all(10),
      child: Text(
        tx.amountText,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.purple,
        ),
      ),
    );
  }
}

class _TxItemTitleTimestamp extends StatelessWidget {
  final Transaction tx;

  _TxItemTitleTimestamp(this.tx);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          tx.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          tx.timestampText,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
