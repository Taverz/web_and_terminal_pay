import 'package:flutter/material.dart';

class PaymentMethodsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Способы оплаты'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            const ListTile(
              title: Text('Способ оплаты 1'),
            ),
            const ListTile(
              title: Text('Способ оплаты 2'),
            ),
          ],
        ),
      ),
    );
  }
}
