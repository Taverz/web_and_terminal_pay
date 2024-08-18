import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_and_terminal_pay/crud/sharedpreference/crud_shared_preference.dart';
import 'package:web_and_terminal_pay/pos/data/pos_local_db_impl.dart';
import 'package:web_and_terminal_pay/pos/pay_terminal.dart';
import 'package:web_and_terminal_pay/pos/sber_termianl_kozen_p12/payment_sber_terminal_kozen_p12.dart';
import 'package:web_and_terminal_pay/service/model/organization_pos_terminal_model.dart';
import 'package:web_and_terminal_pay/pos/model/pay/get/get_pos_payment_model.dart';
import 'package:web_and_terminal_pay/pos/model/pay/send/send_pos_payment_model.dart';
import 'package:web_and_terminal_pay/service/model/pos_settings_model.dart';
import 'package:web_and_terminal_pay/widgets/action_button_with_state.dart';
import 'package:web_and_terminal_pay/widgets/common/title_page.dart';
import 'package:web_and_terminal_pay/widgets/pay_sber_pos_terminal/data_pay_page.dart';
import 'package:web_and_terminal_pay/widgets/pay_sber_pos_terminal/import_settings_page.dart';
import 'package:web_and_terminal_pay/widgets/pay_sber_pos_terminal/organization_add_page.dart';
import 'package:web_and_terminal_pay/widgets/pay_sber_pos_terminal/organization_select_page.dart';

class PayPageSberTestExample extends StatefulWidget {
  const PayPageSberTestExample({super.key});

  @override
  State<PayPageSberTestExample> createState() => _PayPageSberTestExampleState();
}

class _PayPageSberTestExampleState extends State<PayPageSberTestExample> {
  final PayTerminal payTerminal = PaymentSberTerminalKozenP12(
    sberLocalDB: SberLocalDB(
      SharedPreferencesCRUD(),
      SharedPreferencesCRUD(),
      SharedPreferencesCRUD(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              const TitlePage(title: 'Сбер терминал KozenP12 по сети'),
              const SizedBox(height: 25),
              buildActionButtonWithLoading(
                isOptional: true,
                initialText: 'Сбросить все настройки',
                buttonText: 'Сбросить все настройки',
                onPressed: () async {
                  await payTerminal.resetSettings();
                  return 'Успешно, Сброс настроек';
                },
              ),
              buildSettingsActionButton(),
              buildActionButtonWithLoading(
                isOptional: false,
                initialText: 'Инициализация',
                buttonText: '2 Инициализация',
                onPressed: () async {
                  await payTerminal.init();
                  return 'Успешно, Инициализация';
                },
              ),
              buildActionButtonWithLoading(
                isOptional: false,
                initialText: 'Соединение',
                buttonText: '3 Соединение',
                onPressed: () async {
                  await payTerminal.connect();
                  return 'Успешно, Соединение';
                },
              ),
              buildActionButtonWithLoading(
                isOptional: true,
                initialText: 'Отсоединится',
                buttonText: 'Отсоединится',
                onPressed: () async {
                  await payTerminal.disconnect();
                  return 'Успешно, Отсоединится';
                },
              ),
              buildOrganizationActionButton(
                initialText: 'Добавление организации, если несколько юр лиц',
                buttonText: 'Добавление организации, если несколько юр лиц',
                pageBuilder: (context, organizations) => OrganizationAddPage(
                  initialOrganizations: organizations,
                ),
                action: (organization) =>
                    payTerminal.addOrganization(organization),
                successMessage: 'Успешно, Добавлена организация',
                failureMessage: 'Отмена, добавления организации',
              ),
              buildOrganizationActionButton(
                initialText: 'Выбор организации, если несколько юр лиц',
                buttonText: 'Выбор организации, если несколько юр лиц',
                pageBuilder: (context, organizations) => OrganizationSelectPage(
                  organizations: organizations,
                ),
                action: (organization) =>
                    payTerminal.selectOrganization(organization),
                successMessage: 'Успешно, Выбор организации',
                failureMessage: 'Отмена, получения настроек',
              ),
              buildPaymentActionButton(),
              buildActionButtonWithLoading(
                isOptional: true,
                initialText: 'Отмена оплаты',
                buttonText: 'Отмена оплаты',
                onPressed: () async {
                  await payTerminal.abortPay();
                  return 'Успешно, Отмена оплаты';
                },
              ),
              buildReconciliationActionButton(),
              buildMenuActionButton(),
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
                  await payTerminal.refoundPay();
                  return 'Успешно, Возврат';
                },
              ),
              buildActionButtonWithLoading(
                isOptional: true,
                initialText: 'Сбросить сессию',
                buttonText: 'Сбросить сессию',
                onPressed: () async {
                  await payTerminal.clearSession();
                  return 'Успешно, Сбросить сессию';
                },
              ),
              const SizedBox(height: 130),
            ],
          ),
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

  Widget buildSettingsActionButton() {
    return FutureBuilder(
      future: payTerminal.getSettings(),
      builder: (context, snapshot) {
        final value = snapshot.data as PosSettingsModel?;
        final ip = value?.terminalIP ?? '';
        final port = value?.terminalPort ?? '';
        return buildActionButtonWithLoading(
          isOptional: true,
          initialText: 'Настройка через JSON / $ip / $port',
          buttonText: '1 Настройка через JSON / $ip / $port',
          onPressed: () async {
            final settingsModel = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ImportSettingsPage(),
              ),
            );
            if (settingsModel != null && settingsModel is PosSettingsModel) {
              await payTerminal.setSettingsObject(settingsModel);
              return 'Успешно, Полученные настройки: ${settingsModel.terminalIP}, ${settingsModel.terminalPort}';
            } else {
              return 'Отмена, Получения настроек';
            }
          },
        );
      },
    );
  }

  Widget buildOrganizationActionButton({
    required String initialText,
    required String buttonText,
    required Widget Function(BuildContext, List<OrganizationPosTerminalSber>?)
        pageBuilder,
    required Future<void> Function(OrganizationPosTerminalSber) action,
    required String successMessage,
    required String failureMessage,
  }) {
    return FutureBuilder(
      future: payTerminal.getAllOrganization(),
      builder: (context, snapshot) {
        return buildActionButtonWithLoading(
          isOptional: true,
          initialText: '$initialText ${snapshot.data ?? ''}',
          buttonText: buttonText,
          onPressed: () async {
            final organizations =
                snapshot.data as List<OrganizationPosTerminalSber>?;
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => pageBuilder(context, organizations),
              ),
            );
            if (result != null && result is List<OrganizationPosTerminalSber>) {
              for (final organization in result) {
                await action(organization);
              }
              setState(() {});
              return successMessage;
            } else {
              setState(() {});
              return failureMessage;
            }
          },
        );
      },
    );
  }

  Widget buildPaymentActionButton() {
    return buildActionButtonWithLoading(
      isOptional: false,
      initialText: 'Создание оплаты',
      buttonText: '4 Создание оплаты',
      onPressed: () async {
        final payModel = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DataPayPage(),
          ),
        );
        if (payModel != null && payModel is SendPosPaymentModel) {
          setState(() {});
          final result = await payTerminal.createPay(payModel);
          final contentText = (result as GetPosPaymentModel).receipt;
          showPaymentReceiptDialog(context, contentText);
          return 'Успешно, Создание оплаты';
        } else {
          setState(() {});
          return 'Отмена создания оплаты';
        }
      },
      onCancel: () async {
        await payTerminal.abortPay();
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

  void showStatusDialog(BuildContext context, String? contentText) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Статус операции'),
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

  Widget buildReconciliationActionButton() {
    return buildActionButtonWithLoading(
      isOptional: false,
      initialText: 'Сверка итогов',
      buttonText: 'Сверка итогов',
      onPressed: () async {
        final result = await payTerminal.reconciliationOfResults();
        final contentText = result as String?;
        showReconciliationDialog(context, contentText);
        return 'Успешно, Сверка итогов';
      },
      onCancel: () async {
        await payTerminal.disconnect();
        return 'Отмена, Сверка итогов';
      },
    );
  }

  void showReconciliationDialog(BuildContext context, String? contentText) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Сверка итогов'),
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

  Widget buildMenuActionButton() {
    return buildActionButtonWithLoading(
      isOptional: true,
      initialText: 'Меню, если сверка итогов не вызывается',
      buttonText: 'Меню',
      onPressed: () async {
        await payTerminal.menuCall();
        return 'Успешно, Обращение в Меню';
      },
      onCancel: () async {
        await payTerminal.disconnect();
        return 'Отмена, Меню';
      },
    );
  }

  Widget buildCheckStatusActionButton() {
    return buildActionButtonWithLoading(
      isOptional: false,
      initialText: 'Проверка статуса текущей операции',
      buttonText: 'Проверка статуса текущей операции',
      onPressed: () async {
        setState(() {});
        final result = await payTerminal.checkStatusCurrentOperation();
        final contentText = (result as String?);
        showStatusDialog(context, contentText);
        return 'Успешно, Проверка статуса';
      },
      onCancel: () async {
        await payTerminal.abortPay();
        return 'Успешно, Отмена статуса';
      },
    );
  }
}
