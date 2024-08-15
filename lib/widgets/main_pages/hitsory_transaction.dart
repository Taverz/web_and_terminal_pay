import 'package:flutter/material.dart';

class TransactionHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('История транзакции'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('История упавших транзакции'),
            Text('История успешных транзакции'),
            Text('История чеков'),
            Text('История оплат'),
          ],
        ),
      ),
    );
  }
}
