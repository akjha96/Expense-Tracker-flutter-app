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

  void _submitData() {
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

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now());
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
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => _submitData(),
              focusNode: _focusNode,
            ),
            Container(
              height: 80,
              child: Row(
                children: [
                  Text('No Date Chosen!'),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: Text(
                'Add Transaction',
              ),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).colorScheme.primary,
                onPrimary: Theme.of(context).textTheme.button!.color,
                textStyle: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
