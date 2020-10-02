import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;
  final Function deleteTx;

  TransactionList(this.userTransaction, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return userTransaction.isEmpty
        ? LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "You have not added anything yet !",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      fontFamily: 'Caveat',
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.65,
                    child: Image.asset(
                      'assets/images/empty.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5.0,
                margin: EdgeInsets.symmetric(vertical: 7.0, horizontal: 5.0),
                child: ListTile(
                  trailing: CircleAvatar(
                    radius: 30.0,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: Text(
                            '\$${userTransaction[index].amount.toStringAsFixed(2)}'),
                      ),
                    ),
                  ),
                  title: Text(
                    userTransaction[index].title,
                    style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Architects Daughter',
                      letterSpacing: 1.5,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd()
                        .add_jm()
                        .format(userTransaction[index].date),
                  ),
                  leading: IconButton(
                    color: Theme.of(context).errorColor,
                    icon: Icon(Icons.delete),
                    onPressed: () => deleteTx(userTransaction[index].id),
                  ),
                ),
              );
            },
            itemCount: userTransaction.length,
          );
  }
}
