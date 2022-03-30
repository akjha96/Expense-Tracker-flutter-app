import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  Transaction transaction;

  final Function deleteTransaction;

  TransactionCard(
      {required this.transaction, required this.deleteTransaction, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('₹ ${transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('dd/MM/yyyy').format(transaction.date),
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: IconButton(
          onPressed: () => deleteTransaction(transaction.id),
          icon: Icon(Icons.delete),
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }
}
