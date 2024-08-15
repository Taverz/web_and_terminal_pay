import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_and_terminal_pay/service/model/operation_pay_state.dart';
import 'dart:async';
import 'package:web_and_terminal_pay/service/operation_system.dart';

class ActionButtonWithLoading extends StatefulWidget {
  final String initialText;
  final String buttonText;
  final Future<String?> Function() onPressed;
  final Future<String?> Function()? onCancel;
  final bool isOptional;

  const ActionButtonWithLoading({
    required this.initialText,
    required this.buttonText,
    required this.onPressed,
    this.onCancel,
    this.isOptional = false,
    super.key,
  });

  @override
  createState() => _ActionButtonWithLoadingState();
}

class _ActionButtonWithLoadingState extends State<ActionButtonWithLoading> {
  late OperationPay operationPay;

  @override
  void initState() {
    super.initState();
    operationPay = OperationPay(
      initialText: widget.initialText,
      onPressed: widget.onPressed,
      onCancel: widget.onCancel,
    );
  }

  @override
  void dispose() {
    operationPay.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OperationPayState>(
      stream: operationPay.stateStream,
      initialData: operationPay.initialState,
      builder: (context, snapshot) {
        final state = snapshot.data!;
        return Column(
          children: [
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state.isLoading)
                  Text(
                      'Загрузка... ${operationPay.formatDuration(state.elapsed)}')
                else if (state.errorMessage != null)
                  Column(
                    children: [
                      SizedBox(
                        height: 250,
                        width: 300,
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 30),
                                Text(
                                  'Ошибка: ${state.errorMessage}\nВремя: ${operationPay.formatDuration(state.elapsed)}',
                                  style: const TextStyle(color: Colors.red),
                                ),
                                const SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy),
                        onPressed: () {
                          if (state.errorMessage == null) return;
                          Clipboard.setData(
                              ClipboardData(text: state.errorMessage!));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Ошибка скопирована')),
                          );
                        },
                      ),
                    ],
                  )
                else if (state.hasStarted)
                  Text(
                    '${state.text}\nВремя: ${operationPay.formatDuration(state.elapsed)}',
                    style: TextStyle(
                      color: state.isSuccess
                          ? const Color.fromARGB(255, 12, 155, 17)
                          : Colors.black,
                    ),
                  )
                else
                  Text(
                    state.text,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                if (state.isLoading) const SizedBox(width: 10),
                if (state.isLoading) const CupertinoActivityIndicator(),
              ],
            ),
            if (state.isLoading)
              ElevatedButton(
                onPressed: () async {
                  await operationPay.cancelOperation();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.withOpacity(0.6),
                ),
                child: const Text(
                  'Отмена',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            else
              ElevatedButton(
                onPressed: () async {
                  await operationPay.startOperation();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.isOptional
                      ? Colors.grey
                      : Theme.of(context).primaryColor.withOpacity(0.6),
                ),
                child: Text(
                  widget.buttonText,
                  style: TextStyle(
                    color: widget.isOptional ? Colors.black : Colors.white,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
