import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';

class UserTransactions extends StatefulWidget {
  UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addNewtransaction: _addNewtransaction),
        TransactionList(userTransactions: _userTransactions),
      ],
    );
  }
}
