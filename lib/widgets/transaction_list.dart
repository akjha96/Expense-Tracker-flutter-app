import 'package:flutter/material.dart';

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
              physics: const BouncingScrollPhysics(),
              itemBuilder: (ctx, index) {
                return TransactionCard(
                    transaction: userTransactions[index],
                    deleteTransaction: deleteTransaction);
              },
              itemCount: userTransactions.length,
            ),
    );
  }
}
