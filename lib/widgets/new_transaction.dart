import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  late final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void submitTransaction() {
    final enteredTitle = titleController.text;
    final eneteredAmount = double.tryParse(amountController.text);
    if (eneteredAmount != null &&
        (enteredTitle.isEmpty || eneteredAmount <= 0)) {
      return;
    } else
      addTx(enteredTitle, eneteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitTransaction()),
            TextButton(
              onPressed: submitTransaction,
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
