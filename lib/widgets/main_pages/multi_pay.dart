import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_and_terminal_pay/check_service/atol/recipe/atol_service.dart';
import 'package:web_and_terminal_pay/check_service/atol/recipe/check_save_repository.dart';
import 'package:web_and_terminal_pay/crud/sharedpreference/crud_shared_preference.dart';
import 'package:web_and_terminal_pay/data/local_sum_transaction.dart';
import 'package:web_and_terminal_pay/pos/data/pos_local_db_impl.dart';
import 'package:web_and_terminal_pay/service/entity/payment_status_operation_entity.dart';
import 'package:web_and_terminal_pay/service/model/pos_settings_model.dart';

import 'package:web_and_terminal_pay/service/payment_module_multi.dart';
import 'package:web_and_terminal_pay/service/entity/pay_entity.dart';
import 'package:web_and_terminal_pay/pos/sber_termianl_kozen_p12/payment_sber_terminal_kozen_p12.dart';
import 'package:web_and_terminal_pay/service/payment_module_multi_impl.dart';
import 'package:web_and_terminal_pay/telegram_message/api_telegram.dart';
import 'package:web_and_terminal_pay/telegram_message/repository_telegram.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/current_session_yookassa.dart';
import 'package:web_and_terminal_pay/web/yookassa/repository/yookassa_repository.dart';
import 'package:web_and_terminal_pay/web/yookassa/data/local_save_yookassa.dart';
import 'package:web_and_terminal_pay/web/yookassa/data/yookassa_api.dart';
import 'package:web_and_terminal_pay/widgets/action_button_with_state.dart';
import 'package:web_and_terminal_pay/widgets/check_atol/check_session_page.dart';
import 'package:web_and_terminal_pay/widgets/main_pages/hitsory_transaction.dart';
import 'package:web_and_terminal_pay/widgets/pay_sber_pos_terminal/data_pay_page.dart';

class MultiPaymentPage extends StatefulWidget {
  @override
  State<MultiPaymentPage> createState() => _MultiPaymentPageState();
}

class _MultiPaymentPageState extends State<MultiPaymentPage> {
  /// No real id
  final id = '123859';

  /// No real token
  final token = 'live_239dux823d23d023d283ujde';
  late final PaymentSystemMulti paymentSystemMulti;

  @override
  void initState() {
    final dio = Dio();
    paymentSystemMulti = PaySystemWebAndTerminal(
      payTerminal: PaymentSberTerminalKozenP12(
        posSettingsModel: PosSettingsModel(
          terminalIP: '198.165.0.100',
          terminalPort: 8888,
        ),
        sberLocalDB: SberLocalDB(
          SharedPreferencesCRUD(),
          SharedPreferencesCRUD(),
          SharedPreferencesCRUD(),
        ),
      ),
      payYookassa: YookassaRepository(
        YooKassaApi(
          dioW: dio,
        ),
        CurrentSessionYookassa(),
        YookassaSaveRepository(),
        [
          OrganizationYookassa(
            id: 1,
            name: 'ИП ААААА',
            id_api: '123412',
            token_api: 'live_d23d2d0jsa',
          ),
          OrganizationYookassa(
            id: 2,
            name: 'ООО ЮСС',
            id_api: '123412',
            token_api: 'live_d23d2d0jsa',
          ),
          OrganizationYookassa(
            id: 3,
            name: 'ИП МММММ',
            id_api: '123412',
            token_api: 'live_d23d2d0jsa',
          ),
        ],
      ),
      atolCheckService: AtolCheckService(
        CheckSaveRepository(),
      ),
      repositoryTelegram: RepositoryTelegram(
        ApiTelegram(dio, null),
      ),
      transactionsSumSaveRepository: TransactionsSumSaveRepository(
        SharedPreferencesCRUD(),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбор мульти оплаты'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildActionButtonWithLoading(
              isOptional: true,
              initialText: 'Инициализация',
              buttonText: 'Инициализация',
              onPressed: () async {
                await paymentSystemMulti.init();
                return 'Успешно, Инициализация';
              },
            ),
            buildPaymentActionButton(),
            buildActionButtonWithLoading(
              isOptional: true,
              initialText: 'Отмена оплаты',
              buttonText: 'Отмена оплаты',
              onPressed: () async {
                await paymentSystemMulti.abortPay();
                return 'Успешно, Отмена оплаты';
              },
            ),
            buildCheckStatusActionButton(),
            buildActionButtonWithLoading(
              isOptional: true,
              initialText: 'Список транзакций (для - Возврата)',
              buttonText: 'Список транзакций (для - Возврата)',
              onPressed: () async {
                //TODO: отобразить список, выбрать транзакцию
                return 'Успешно, получен список транзакций';
              },
            ),
            buildActionButtonWithLoading(
              isOptional: true,
              initialText: 'Возврат (сначало - Список транзакций)',
              buttonText: 'Возврат (сначало - Список транзакций)',
              onPressed: () async {
                await paymentSystemMulti.refound();
                return 'Успешно, Возврат';
              },
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CheckSettingsPage(),
                ),
              ),
              child: const Text('Работа чеков'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransactionHistoryPage(),
                ),
              ),
              child: const Text('История транзакции'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildActionButtonWithLoading({
    required String initialText,
    required String buttonText,
    required Future<String> Function() onPressed,
    Future<String?> Function()? onCancel,
    required bool isOptional,
  }) {
    return ActionButtonWithLoading(
      isOptional: isOptional,
      initialText: initialText,
      buttonText: buttonText,
      onPressed: onPressed,
      onCancel: onCancel,
    );
  }

  Widget buildCheckStatusActionButton() {
    return buildActionButtonWithLoading(
      isOptional: false,
      initialText: 'Проверка статуса текущей операции',
      buttonText: 'Проверка статуса текущей операции',
      onPressed: () async {
        setState(() {});
        final result = await paymentSystemMulti.statusPay();
        final statusss = (result as bool);
        if (!statusss) {
          throw Exception('Статуст не успешно');
        }
        return 'Успешно, Проверка статуса';
      },
      onCancel: () async {
        return 'Успешно, Отмена Проверка статуса';
      },
    );
  }

  Widget buildPaymentActionButton() {
    return buildActionButtonWithLoading(
      isOptional: false,
      initialText: 'Создание оплаты',
      buttonText: 'Создание оплаты',
      onPressed: () async {
        final payModel = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DataPayPage(),
          ),
        );
        if (payModel != null && payModel is PayEntity) {
          setState(() {});
          final result = await paymentSystemMulti.pay(payModel);
          if (!(result == PaymentStatusOperationEntity.success)) {
            throw Exception('Оплата прошла не успешно');
          }
          return 'Успешно, Создание оплаты';
        } else {
          setState(() {});
          return 'Отмена создания оплаты';
        }
      },
      onCancel: () async {
        await paymentSystemMulti.abortPay();
        return 'Успешно, Отмена оплаты';
      },
    );
  }

  void showPaymentReceiptDialog(BuildContext context, String? contentText) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Чек оплаты'),
          content: SizedBox(
            height: 450,
            width: 300,
            child: Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () {
                    if (contentText == null) return;
                    Clipboard.setData(
                      ClipboardData(
                        text: contentText,
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Текст скопирован'),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 350,
                  width: 300,
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(contentText ?? 'Пусто'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('ОК'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
