import 'package:flutter/material.dart';
import 'dart:math';

import 'package:web_and_terminal_pay/pos/model/pay/send/send_pos_payment_model.dart';

class DataPayPage extends StatefulWidget {
  @override
  _DataPayPageState createState() => _DataPayPageState();
}

class _DataPayPageState extends State<DataPayPage> {
  late TextEditingController _clientIdController;
  late TextEditingController _idempotenceKeyERNController;
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();

    // Генерация случайных строк для clientId и idempotenceKeyERN
    _clientIdController =
        TextEditingController(text: _generateRandomString(10));
    _idempotenceKeyERNController =
        TextEditingController(text: _generateRandomString(10));
    _amountController = TextEditingController(text: '6.0');
  }

  String _generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final rnd = Random();
    return String.fromCharCodes(Iterable.generate(
      length,
      (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
    ));
  }

  void _accept() {
    final model = SendPosPaymentModel(
      clientId: _clientIdController.text,
      idempotenceKeyERN: _idempotenceKeyERNController.text,
      amount: double.tryParse(_amountController.text) ?? 6.0,
    );
    Navigator.pop(context, model);
  }

  @override
  void dispose() {
    _clientIdController.dispose();
    _idempotenceKeyERNController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Send POS Payment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _clientIdController,
              decoration: InputDecoration(labelText: 'Client ID'),
            ),
            TextField(
              controller: _idempotenceKeyERNController,
              decoration: InputDecoration(labelText: 'Idempotence Key ERN'),
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _accept,
              child: Text('Принять'),
            ),
          ],
        ),
      ),
    );
  }
}
