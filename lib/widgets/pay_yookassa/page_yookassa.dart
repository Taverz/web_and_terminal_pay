import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_and_terminal_pay/widgets/common/title_page.dart';

///
/// 1 выбрать способ, перейти на страницу выбора
/// - вернутся на страницу
/// Вы выбрали способ:
/// 2 заполнить информацию о чеке
/// - ернутся на страницу
/// Вы ввнесли информацию для чека:
/// 3 Оплатить , показать оплату
/// - вернутся на страницу
/// Статус платежа:
///
class PageYookassa extends StatefulWidget {
  const PageYookassa({super.key});

  @override
  State<PageYookassa> createState() => _PageYookassaState();
}

class _PageYookassaState extends State<PageYookassa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yookassa pay'),
      ),
      body: const SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                const TitlePage(title: 'Yookassa, web оплата'),
                const SizedBox(height: 25),
                Text('Empty'),
                const SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
