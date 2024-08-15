import 'package:flutter/material.dart';
import 'package:web_and_terminal_pay/widgets/main_pages/terminal_pay.dart';
import 'package:web_and_terminal_pay/widgets/main_pages/web_pay.dart';

class SinglePaymentPage extends StatefulWidget {
  @override
  _SinglePaymentPageState createState() => _SinglePaymentPageState();
}

class _SinglePaymentPageState extends State<SinglePaymentPage> {
  String? selectedPaymentType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Выбор одиночной оплаты'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              hint: Text('Выберите тип оплаты'),
              value: selectedPaymentType,
              onChanged: (String? newValue) {
                setState(() {
                  selectedPaymentType = newValue;
                });
              },
              items: <String>['Web', 'Terminal']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if ('Terminal' == selectedPaymentType) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TerminalPaymentPage(),
                    ),
                  );
                }
                if ('Web' == selectedPaymentType) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebPaymentPage(),
                    ),
                  );
                }
              },
              child: Text('Выбрать'),
            ),
          ],
        ),
      ),
    );
  }
}
