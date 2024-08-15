import 'package:flutter/material.dart';
import 'package:web_and_terminal_pay/widgets/main_pages/multi_pay.dart';
import 'package:web_and_terminal_pay/widgets/main_pages/select_type_pay.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Главная страница',
        ),
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
                MaterialPageRoute(builder: (context) => MultiPaymentPage()),
              ),
              child: Text('Мульти оплата'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SinglePaymentPage()),
              ),
              child: Text('Одиночная оплата'),
            ),
          ],
        ),
      ),
    );
  }
}
