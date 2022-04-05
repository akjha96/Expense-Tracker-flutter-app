import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/transaction.dart';
import 'transactionCard.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> userTransactions;

  final Function deleteTransaction;

  TransactionList({
    Key? key,
    required this.userTransactions,
    required this.deleteTransaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) => Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          )
        : ListView(
            children: userTransactions
                .map((userTransaction) => TransactionCard(
                    key: ValueKey(userTransaction.id),
                    transaction: userTransaction,
                    deleteTransaction: deleteTransaction))
                .toList(),
            // physics: const BouncingScrollPhysics(),
          );
  }
}
