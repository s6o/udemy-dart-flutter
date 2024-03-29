import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'ui/chart.dart';
import 'ui/transaction_entry.dart';
import 'ui/transaction_list.dart';

void main() => runApp(PersonalExpenseApp());

class PersonalExpenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              subtitle: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
              subhead: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.green,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                ),
              ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final List<Transaction> transactions = [
    Transaction.withTimestamp(
      timestamp: DateTime.now(),
      title: 'Groceries',
      amount: Money(2000, Currency('EUR')),
    ),
    Transaction.withTimestamp(
      timestamp: DateTime.now().subtract(Duration(days: 1)),
      title: 'Groceries',
      amount: Money(2000, Currency('EUR')),
    ),
    Transaction.withTimestamp(
      timestamp: DateTime.now().subtract(Duration(days: 1)),
      title: 'Launch with Family',
      amount: Money(1000, Currency('EUR')),
    ),
    Transaction.withTimestamp(
      timestamp: DateTime.now().subtract(Duration(days: 2)),
      title: 'Household items:',
      amount: Money(4000, Currency('EUR')),
    ),
    Transaction.withTimestamp(
      timestamp: DateTime.now().subtract(Duration(days: 3)),
      title: 'Breakfast',
      amount: Money(500, Currency('EUR')),
    ),
    Transaction.withTimestamp(
      timestamp: DateTime.now().subtract(Duration(days: 3)),
      title: 'Launch',
      amount: Money(1000, Currency('EUR')),
    ),
    Transaction.withTimestamp(
      timestamp: DateTime.now().subtract(Duration(days: 3)),
      title: 'Groceries',
      amount: Money(3500, Currency('EUR')),
    ),
    Transaction.withTimestamp(
      timestamp: DateTime.now().subtract(Duration(days: 4)),
      title: 'Adidas sneakers',
      amount: Money(6000, Currency('EUR')),
    ),
    Transaction.withTimestamp(
      timestamp: DateTime.now().subtract(Duration(days: 5)),
      title: 'Tank of diesel',
      amount: Money(7000, Currency('EUR')),
    ),
    Transaction.withTimestamp(
      timestamp: DateTime.now().subtract(Duration(days: 6)),
      title: 'Weekly groceries',
      amount: Money(8000, Currency('EUR')),
    ),
    Transaction.withTimestamp(
      timestamp: DateTime.now().subtract(Duration(days: 7)),
      title: 'Breakfast',
      amount: Money(5050, Currency('EUR')),
    ),
    Transaction.withTimestamp(
      timestamp: DateTime.now().subtract(Duration(days: 7)),
      title: 'Launch',
      amount: Money(6050, Currency('EUR')),
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  //AppLifecycleState _notification;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //setState(() { _notification = state; });
  }

  List<Transaction> _filterCurrentSevenDays() {
    var cutOffTs = DateTime.now().toUtc().subtract(Duration(days: 7));
    return this.transactions.where((tx) {
      return tx.timestamp.isAfter(cutOffTs);
    }).toList();
  }

  void _newTransaction(Transaction tx) {
    setState(() {
      transactions.add(tx);
    });
  }

  void _showTransactionEntry(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: TransactionEntry(_newTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final AppBar appBar =
        MediaQuery.of(context).orientation == Orientation.portrait
            ? AppBar(
                title: Text('Personal Expenses'),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => _showTransactionEntry(context),
                  ),
                ],
              )
            : AppBar(
                title: Text('Personal Expenses'),
              );

    return Scaffold(
      appBar: appBar,
      body: OrientationBuilder(
        builder: (bctx, orientation) {
          var remainHeight = MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top;

          if (orientation == Orientation.portrait) {
            return _portaitBuilder(remainHeight);
          } else {
            return _landscapeBuilder(remainHeight);
          }
        },
      ),
    );
  }

  Widget _portaitBuilder(double remainHeight) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: remainHeight * 0.25,
            child: Chart(_filterCurrentSevenDays()),
          ),
          Container(
              height: remainHeight * 0.75,
              child: TransactionList(transactions)),
        ],
      ),
    );
  }

  Widget _landscapeBuilder(double remainHeight) {
    return Container(
      height: remainHeight,
      child: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          TransactionList(transactions),
          TransactionEntry.withoutClose(_newTransaction),
        ],
      ),
    );
  }
}
