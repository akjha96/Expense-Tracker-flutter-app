import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({required this.addNewtransaction, Key? key}) : super(key: key);

  final Function addNewtransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
            ),
            TextButton(
              onPressed: () {
                print(titleController.text);
                print(amountController.text);
                addNewtransaction(
                    titleController.text, double.parse(amountController.text));
              },
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
