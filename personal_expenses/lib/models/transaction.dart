import 'package:meta/meta.dart';
import 'package:intl/intl.dart';
import 'package:money/money.dart';

export 'package:money/money.dart';

class Transaction {
  DateTime timestamp;
  String title;
  Money amount;

  String get amountText {
    var symbol = this.amount.currency.code;
    switch (this.amount.currency.code) {
      case 'EUR':
        symbol = '€';
        break;

      case 'GBP':
        symbol = '£';
        break;

      case 'JPY':
        symbol = '¥';
        break;

      case 'USD':
        symbol = '\$';
        break;
    }
    return '$symbol ' +
        (this.amount.amount / this.amount.currency.subUnit)
            .toStringAsFixed(this.amount.currency.defaultFractionDigits);
  }

  String get timestampText {
    return DateFormat('EEE, d MMM y H:m:s').format(this.timestamp.toLocal());
  }

  Transaction({@required this.title, @required this.amount})
      : timestamp = DateTime.now().toUtc();
  Transaction.withTimestamp(
      {@required this.timestamp, @required this.title, @required this.amount}) {
    if (!this.timestamp.isUtc) {
      this.timestamp = this.timestamp.toUtc();
    }
  }
}
