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
      child: _userTransactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('No transactions added yet',
                    style: Theme.of(context).textTheme.bodyMedium),
                Image.asset('assets/images/waiting.png'),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        border: null,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                          '${_userTransactions[index].amount.toStringAsFixed(2)} PLN',
                          style: Theme.of(context).textTheme.bodyMedium),
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
                            style: Theme.of(context).textTheme.bodySmall),
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
