import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;

  TransactionList(this.userTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: userTransaction.isEmpty
          ? Column(
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
                  height: 200,
                  child: Image.asset(
                    'assets/images/empty.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userTransaction[index].title,
                              style: TextStyle(
                                color: Theme.of(context).primaryColorDark,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Architects Daughter',
                                letterSpacing: 1.5,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMd()
                                  .add_jm()
                                  .format(userTransaction[index].date),
                              style: TextStyle(
                                fontSize: 17.0,
                                fontFamily: 'Cookie',
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          '\$${userTransaction[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            // fontFamily: 'Architects Daughter',
                            // letterSpacing: 1.5,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: userTransaction.length,
            ),
    );
  }
}
