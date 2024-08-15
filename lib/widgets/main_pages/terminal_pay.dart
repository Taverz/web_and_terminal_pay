import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_and_terminal_pay/widgets/check_atol/check_session_page.dart';
import 'package:web_and_terminal_pay/widgets/main_pages/hitsory_transaction.dart';

class TerminalPaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Оплата Терминал'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TransactionHistoryPage()),
            ),
            child: Text('История транзакций'),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckSettingsPage()),
              ),
              child: Text('Работа чеков'),
            ),
          ),
        ],
      ),
    );
  }
}
