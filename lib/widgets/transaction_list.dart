import '../models/transaction.dart';
import 'package:flutter/material.dart';

import 'TransactionCard.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> userTransactions;

  TransactionList({required this.userTransactions, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView(
        children: userTransactions.map((transaction) {
          return TransactionCard(transaction: transaction);
        }).toList(),
      ),
    );
  }
}
