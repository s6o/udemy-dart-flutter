import 'package:flutter/material.dart';

import 'models/transaction.dart';
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
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showTransactionEntry(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('chart'),
              ),
            ),
            TransactionList(transactions),
          ],
        ),
      ),
    );
  }
}
