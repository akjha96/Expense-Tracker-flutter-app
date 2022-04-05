import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionCard extends StatefulWidget {
  final Transaction transaction;

  final Function deleteTransaction;

  const TransactionCard(
      {required this.transaction, required this.deleteTransaction, Key? key})
      : super(key: key);

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  Color _bgColor = Colors.grey;
  @override
  void initState() {
    super.initState();
    const availableColors = [
      Colors.amber,
      Colors.blue,
      Colors.green,
      Colors.brown
    ];
    _bgColor = availableColors[Random().nextInt(4)];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          foregroundColor: Colors.white,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('₹ ${widget.transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('dd/MM/yyyy').format(widget.transaction.date),
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: mediaQuery.size.width > 360
            ? TextButton.icon(
                onPressed: () =>
                    widget.deleteTransaction(widget.transaction.id),
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.error),
                ),
              )
            : IconButton(
                onPressed: () =>
                    widget.deleteTransaction(widget.transaction.id),
                icon: const Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
              ),
      ),
    );
  }
}
