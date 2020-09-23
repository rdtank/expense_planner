import 'package:flutter/material.dart';

import './Widget/new_transaction.dart';
import './Widget/transaction_list.dart';
import './Models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expence Manager',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.amber,
        // fontFamily: '',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'Keyboard',
    //   amount: 45.15,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Bag',
    //   amount: 15.35,
    //   date: DateTime.now(),
    // ),
  ];

  void _addTx(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(_addTx),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense Manager',
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontFamily: 'PressStart2P',
            fontSize: 16.0,
          ),
        ),
        actions: [
          IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.add),
            onPressed: () => _startNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blueAccent[100],
                child: Text('CHART'),
                elevation: 5.0,
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startNewTransaction(context),
      ),
    );
  }
}
