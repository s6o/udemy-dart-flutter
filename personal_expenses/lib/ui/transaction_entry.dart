import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './../models/transaction.dart';

typedef EntryHandler = void Function(Transaction);

class TransactionEntry extends StatefulWidget {
  final EntryHandler entryHandler;

  TransactionEntry(this.entryHandler);

  @override
  _TransactionEntryState createState() => _TransactionEntryState();
}

class _TransactionEntryState extends State<TransactionEntry> {
  final titleInput = TextEditingController();

  final amountInput = TextEditingController();

  void _createTransaction() {
    String title = titleInput.text;
    String amount = amountInput.text;

    if (title.isNotEmpty && amount.isNotEmpty) {
      try {
        var parsedAmount = Money.fromString(amount, Currency('EUR'));
        if (parsedAmount.amount > 0) {
          var tx = Transaction(title: title, amount: parsedAmount);
          this.widget.entryHandler(tx);
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text('Close'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                RaisedButton(
                  child: Text('Add Transaction'),
                  onPressed: () => _createTransaction(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
