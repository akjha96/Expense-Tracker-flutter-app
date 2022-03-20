import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction({required this.addNewtransaction, Key? key}) : super(key: key);

  final Function addNewtransaction;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  void submitData() {
    final String enteredTitle = titleController.text;
    final double enteredAmount = amountController.text.isNotEmpty
        ? double.parse(amountController.text)
        : 0;

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addNewtransaction(enteredTitle, enteredAmount);
    _focusNode.unfocus();
    Navigator.of(context).pop();
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
              focusNode: _focusNode,
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
