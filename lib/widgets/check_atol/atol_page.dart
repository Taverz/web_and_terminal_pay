import 'package:flutter/material.dart';
import 'package:web_and_terminal_pay/widgets/common/title_page.dart';

class AtolPage extends StatefulWidget {
  const AtolPage({super.key});

  @override
  State<AtolPage> createState() => _AtolPageState();
}

class _AtolPageState extends State<AtolPage> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            const TitlePage(title: 'АТОЛ Онлайн, чеки'),
            const SizedBox(height: 25),
            Text('Empty'),
            const SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}
