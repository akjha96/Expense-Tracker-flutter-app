import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key, required this.recentTransactions}) : super(key: key);

  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupeTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (var recentTransaction in recentTransactions) {
        if (recentTransaction.date.day == weekDay.day &&
            recentTransaction.date.month == weekDay.month &&
            recentTransaction.date.year == weekDay.year) {
          totalSum += recentTransaction.amount;
        }
      }
      print(DateFormat.E().format(weekDay).substring(0, 2));
      print(totalSum);
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalSum
      };
    });
  }

  double get totalSpending => groupeTransactionValues.fold(
      0.0, (sum, item) => sum + (item['amount'] as double));

  @override
  Widget build(BuildContext context) {
    print(groupeTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupeTransactionValues.map((data) {
          return ChartBar(
              label: data['day'] as String,
              spendingAmount: data['amount'] as double,
              spendingPctOfTotal: totalSpending == 0
                  ? 0.0
                  : (data['amount'] as double) / totalSpending);
        }).toList(),
      ),
    );
  }
}
