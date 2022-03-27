import '../models/transaction.dart';
import 'package:flutter/material.dart';

import 'TransactionCard.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> userTransactions;

  TransactionList({required this.userTransactions, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      child: userTransactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transctions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionCard(transaction: userTransactions[index]);
              },
              itemCount: userTransactions.length,
            ),
    );
  }
}
