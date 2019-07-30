import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './../models/transaction.dart';

typedef EntryHandler = void Function(Transaction);

class TransactionEntry extends StatelessWidget {
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();
  final EntryHandler entryHandler;

  TransactionEntry(this.entryHandler);

  void _createTransaction() {
    String title = titleInput.text;
    String amount = amountInput.text;

    if (title.isNotEmpty && amount.isNotEmpty) {
      try {
        var parsedAmount = Money.fromString(amount, Currency('EUR'));
        if (parsedAmount.amount > 0) {
          var tx = Transaction(title: title, amount: parsedAmount);
          this.entryHandler(tx);
        }
      } catch (e) {
        print('Invalid amount: $amount | Exception: ${e.runtimeType}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleInput,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountInput,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _createTransaction(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () => _createTransaction(),
            )
          ],
        ),
      ),
    );
  }
}
