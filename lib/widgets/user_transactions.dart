import 'package:flutter/material.dart';
import './new_transaction.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(id: '1', title: 'Food', amount: 12.99, date: DateTime.now()),
    Transaction(id: '2', title: 'Games', amount: 200, date: DateTime.now()),
    Transaction(id: '3', title: 'Clothes', amount: 69.99, date: DateTime.now()),
  ];

  _addNewTransaction(String txTitle, double amount) {
    final Transaction newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: amount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
