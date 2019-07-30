import 'package:flutter/material.dart';

import './../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? _NoItems()
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return _TransactionItem(transactions[index]);
              },
              itemCount: transactions.length,
            ),
    );
  }
}

class _NoItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'No transactions yet.',
          style: Theme.of(context).textTheme.title,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 200,
          child: Image.asset(
            'assets/images/waiting.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
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
          color: Theme.of(context).accentColor,
          width: 2,
        ),
      ),
      padding: EdgeInsets.all(10),
      child: Text(
        tx.amountText,
        style: Theme.of(context).textTheme.subhead,
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
          style: Theme.of(context).textTheme.title,
        ),
        Text(
          tx.timestampText,
          style: Theme.of(context).textTheme.subtitle,
        ),
      ],
    );
  }
}
