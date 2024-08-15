import 'package:flutter/material.dart';
import 'package:web_and_terminal_pay/widgets/check_atol/check_session_page.dart';
import 'package:web_and_terminal_pay/widgets/main_pages/hitsory_transaction.dart';
import 'package:web_and_terminal_pay/widgets/main_pages/select_pay_type.dart';

class WebPaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Оплата WEB'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TransactionHistoryPage()),
              ),
              child: Text('История транзакций'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentMethodsPage()),
              ),
              child: Text('Способы оплаты'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckSettingsPage()),
              ),
              child: Text('Работа чеков'),
            ),
          ],
        ),
      ),
    );
  }
}
