import 'package:expenses_app/widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'widgets/chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo),
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontFamily: 'OpenSans')),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              fontFamily: 'Quicksand'),
          titleLarge: TextStyle(
              fontSize: 28,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontFamily: 'Quicksand'),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

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

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(_addNewTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
        shape: CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
