import 'package:flutter/material.dart';

import './../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (bctx, constraints) {
      return Container(
        height: constraints.maxHeight,
        child: transactions.isEmpty
            ? _NoItems()
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return _TransactionItem(transactions[index]);
                },
                itemCount: transactions.length,
              ),
      );
    });
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
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: FittedBox(
              child: Text(tx.amountText),
            ),
          ),
        ),
        title: Text(
          tx.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          tx.timestampText,
          style: Theme.of(context).textTheme.subtitle,
        ),
      ),
    );
  }
}
