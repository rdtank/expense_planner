import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../Models/transaction.dart';

class ManageTransaction extends StatefulWidget {
  @override
  _ManageTransactionState createState() => _ManageTransactionState();
}

class _ManageTransactionState extends State<ManageTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Keyboard',
      amount: 45.15,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Bag',
      amount: 15.35,
      date: DateTime.now(),
    ),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addTx),
        TransactionList(_userTransactions),
      ],
    );
  }
}
