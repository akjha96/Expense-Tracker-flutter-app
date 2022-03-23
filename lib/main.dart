import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/transaction_list.dart';
import 'widgets/new_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.orange,
        ).copyWith(
          secondary: Colors.amber,
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Grapes',
      amount: 92.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Milk',
      amount: 61.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Bread',
      amount: 44.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Butter',
      amount: 5.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Oranges',
      amount: 90.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Grapes',
      amount: 46.00,
      date: DateTime.now(),
    ),
  ];

  void _addNewtransaction(String title, double amount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(addNewtransaction: _addNewtransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expense Tracker'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 28.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            tooltip: 'Open shopping cart',
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: const Card(
                color: Colors.blue,
                child: Text('Chart'),
                elevation: 5,
              ),
            ),
            TransactionList(userTransactions: _userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
