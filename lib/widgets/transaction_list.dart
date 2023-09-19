import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  final Function deleteTransaction;

  TransactionList(
    List<Transaction> this._userTransactions,
    this.deleteTransaction,
  );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return _userTransactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'No transactions added yet',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  'assets/images/waiting.png',
                  height: constraints.maxHeight * 0.3,
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 50,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: FittedBox(
                          child:
                              Text('${_userTransactions[index].amount} PLN')),
                    ),
                  ),
                  title: Text(
                    _userTransactions[index].title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMd().format(_userTransactions[index].date),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  trailing: mediaQuery.size.width > 400
                      ? TextButton.icon(
                          icon: const Icon(Icons.delete),
                          label: Text('Delete'),
                          onPressed: () =>
                              deleteTransaction(_userTransactions[index].id),
                          style: ButtonStyle(
                            foregroundColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    Theme.of(context).colorScheme.error),
                          ),
                        )
                      : IconButton(
                          icon: const Icon(Icons.delete),
                          color: Theme.of(context).colorScheme.error,
                          onPressed: () =>
                              deleteTransaction(_userTransactions[index].id),
                        ),
                ),
              );
            },
            itemCount: _userTransactions.length,
          );
  }
}
