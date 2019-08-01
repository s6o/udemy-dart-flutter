import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import './../models/transaction.dart';

typedef EntryHandler = void Function(Transaction);

class TransactionEntry extends StatefulWidget {
  final EntryHandler entryHandler;

  TransactionEntry(this.entryHandler);

  @override
  _TransactionEntryState createState() => _TransactionEntryState();
}

class _TransactionEntryState extends State<TransactionEntry> {
  final _titleInput = TextEditingController();
  final _amountInput = TextEditingController();
  TextEditingController _dateInput;
  TextEditingController _timeInput;
  final String dateFormat = 'yyyy-MM-dd';
  final String timeFormat = 'HH:mm';

  @override
  void initState() {
    super.initState();
    var currentTs = DateTime.now();
    this._dateInput =
        TextEditingController(text: DateFormat(dateFormat).format(currentTs));
    this._timeInput =
        TextEditingController(text: DateFormat(timeFormat).format(currentTs));
  }

  void _createTransaction() {
    String title = _titleInput.text;
    String amount = _amountInput.text;

    if (title.isNotEmpty && amount.isNotEmpty) {
      try {
        var parsedAmount = Money.fromString(amount, Currency('EUR'));
        if (parsedAmount.amount > 0) {
          var txNow = DateTime.now();
          String txSecs = DateFormat('ss').format(txNow);
          String txDate = _dateInput.text.isNotEmpty
              ? _dateInput.text
              : DateFormat(dateFormat).format(txNow);
          String txTime = _timeInput.text.isNotEmpty
              ? '${_timeInput.text}:$txSecs'
              : DateFormat('HH:mm:ss').format(txNow);

          try {
            var txDateTime = DateTime.parse('$txDate $txTime');
            var tx = Transaction.withTimestamp(
                timestamp: txDateTime, title: title, amount: parsedAmount);
            this.widget.entryHandler(tx);
          } catch (e) {
            print(
                'Invalid (custom) Date/Time entry: $txDate $txTime | Exception: ${e.runtimeType}');
            var tx = Transaction(title: title, amount: parsedAmount);
            this.widget.entryHandler(tx);
          }
        }
      } catch (e) {
        print('Invalid amount: $amount | Exception: ${e.runtimeType}');
      }
    }
  }

  void _selectDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((DateTime date) {
      if (date != null) {
        setState(() {
          this._dateInput.text = DateFormat(dateFormat).format(date);
        });
      }
    });
  }

  void _selectTime() {
    showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext bctx, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(bctx).copyWith(alwaysUse24HourFormat: true),
            child: child,
          );
        }).then((TimeOfDay time) {
      if (time != null) {
        setState(() {
          this._timeInput.text = MaterialLocalizations.of(context)
              .formatTimeOfDay(time, alwaysUse24HourFormat: true);
        });
      }
    });
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
              controller: _titleInput,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountInput,
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Date',
                      helperText: 'YYYY-MM-DD',
                    ),
                    controller: _dateInput,
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.date_range),
                  onPressed: _selectDate,
                ),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Time',
                      helperText: 'HH24:MI',
                    ),
                    controller: _timeInput,
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.access_time),
                  onPressed: _selectTime,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text('Close'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  RaisedButton(
                    child: Text('Add Transaction'),
                    onPressed: () {
                      _createTransaction();
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
