import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;

  TransactionList(List<Transaction> this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  border: Border.all(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  '${_userTransactions[index].amount} PLN',
                  style: const TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _userTransactions[index].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                      DateFormat.MMMMEEEEd()
                          .format(_userTransactions[index].date),
                      style: const TextStyle(color: Colors.grey)),
                ],
              )
            ]),
          );
        },
        itemCount: _userTransactions.length,
      ),
    );
  }
}
