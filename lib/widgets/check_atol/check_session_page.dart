import 'package:atol_online_dart/atol_online_v1_4/atol_online_v4.dart';
import 'package:atol_online_dart/atol_online_v1_4/test_model/test_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_and_terminal_pay/check_service/atol/recipe/sss/atol_service.dart';
import 'package:web_and_terminal_pay/check_service/atol/recipe/sss/check_save_repository.dart';
import 'package:web_and_terminal_pay/widgets/action_button_with_state.dart';
import 'package:web_and_terminal_pay/widgets/check_atol/import_settings_page.dart';
import 'package:web_and_terminal_pay/widgets/main_pages/hitsory_transaction.dart';

final _checkRepository = CheckSaveRepository();

class CheckSettingsPage extends StatefulWidget {
  const CheckSettingsPage({super.key});

  @override
  State<CheckSettingsPage> createState() => _CheckSettingsPageState();
}

class _CheckSettingsPageState extends State<CheckSettingsPage> {
  static final _atolCheckService = AtolCheckService(
    _checkRepository,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Работа чеков'),
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
              initialText: 'Настройка через JSON / Авторизация',
              buttonText: 'Настройка через JSON / Авторизация',
              onPressed: () async {
                final checkModel = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ImportSettingsAtolPage(),
                  ),
                );
                if (checkModel != null && checkModel is ModelSettings) {
                  await _atolCheckService.auth(
                    shop: checkModel.cmsParams.shop.first,
                    modelSettings: checkModel,
                  );
                  return 'Успешно, Полученния настройки';
                } else {
                  return 'Отмена, Получения настроек';
                }
              },
            ),
            buildActionButtonWithLoading(
              isOptional: false,
              initialText: 'Выдать чек',
              buttonText: 'Выдать чек',
              onPressed: () async {
                final checkModel = ModelSS(
                  idempotenceKeyERN: 'sdfd2id02i3md02i332',
                  emailClient: 'test@test.com',
                  phoneClient: null,
                  items: [
                    ItemListModelSS(
                      name: 'Test product',
                      price: 5.0,
                      quantity: 1,
                    ),
                  ],
                );
                final result = await _atolCheckService.check(checkModel);
                if (!result) {
                  throw Exception('Ошибка выдачи чека');
                }
                showPaymentReceiptDialog(
                  context,
                  checkModel.toMap().toString(),
                );
                return 'Успешно, Выдан чек';
              },
            ),
            buildActionButtonWithLoading(
              isOptional: true,
              initialText: 'Выдать чек возврата',
              buttonText: 'Выдать чек возврата',
              onPressed: () async {
                final checkModel = ModelSS(
                  idempotenceKeyERN: 'sdfd2id02i3md02i332',
                  emailClient: 'test@test.com',
                  phoneClient: null,
                  items: [
                    ItemListModelSS(
                      name: 'Test product',
                      price: 5.0,
                      quantity: 1,
                    ),
                  ],
                );
                final result = await _atolCheckService.checkRefound(checkModel);
                if (!result) {
                  throw Exception('Ошибка выдачи чека');
                }
                showPaymentReceiptDialog(
                  context,
                  checkModel.toMap().toString(),
                );
                return 'Успешно, Выдан чек возврата';
              },
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
