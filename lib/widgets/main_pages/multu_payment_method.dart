import 'package:flutter/material.dart';
import 'package:web_and_terminal_pay/widgets/check_atol/check_session_page.dart';
import 'package:web_and_terminal_pay/widgets/main_pages/select_pay_type.dart';

class MultiPaymentMethodsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Оплата Мульти'),
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
                MaterialPageRoute(builder: (context) => CheckSettingsPage()),
              ),
              child: Text('Работа чеков'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentMethodsPage()),
              ),
              child: Text('Способы оплаты'),
            ),
          ],
        ),
      ),
    );
  }
}
