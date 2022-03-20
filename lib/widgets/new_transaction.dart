import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({required this.addNewtransaction, Key? key}) : super(key: key);

  final Function addNewtransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final String enteredTitle = titleController.text;
    final double enteredAmount = amountController.text.isNotEmpty
        ? double.parse(amountController.text)
        : 0;

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addNewtransaction(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 15),
                primary: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
