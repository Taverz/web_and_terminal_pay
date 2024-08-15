import 'package:flutter/material.dart';
import 'package:web_and_terminal_pay/widgets/main_pages/main_pages.dart';
import 'package:web_and_terminal_pay/widgets/pay_sber_pos_terminal/page_sber.dart';

void main() {
  // PayPageSberTestExample
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Тестирование модуля оплаты'),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                ),
                child: const Text('Home'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SSPAGE()),
                ),
                child: const Text('Sber'),
              ),
            ],
          ),
        ),
      );
}

class SSPAGE extends StatefulWidget {
  const SSPAGE({super.key});

  @override
  State<SSPAGE> createState() => _SSPAGEState();
}

class _SSPAGEState extends State<SSPAGE> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Сбер'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: const Center(
          child: PayPageSberTestExample(),
        ),
      );
}
