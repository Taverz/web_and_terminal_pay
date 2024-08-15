import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_and_terminal_pay/file_sistem_picker.dart';
import 'package:web_and_terminal_pay/service/model/pos_settings_model.dart';

class ImportSettingsPage extends StatefulWidget {
  const ImportSettingsPage({Key? key}) : super(key: key);

  @override
  _ImportSettingsPageState createState() => _ImportSettingsPageState();
}

class _ImportSettingsPageState extends State<ImportSettingsPage> {
  final TextEditingController _ipController = TextEditingController();
  final TextEditingController _portController = TextEditingController();

  Future<PosSettingsModel?> importSettings(BuildContext context) async {
    try {
      final path = await pickFileTXT(context);
      final value = await _logExportToFile(context, path);
      if (value != null) {
        final Map<String, dynamic> json = jsonDecode(value);
        final settingsModel = PosSettingsModel.fromJson(json);
        return settingsModel;
      }
    } catch (e) {
      print('Ошибка импорта настроек: $e');
    }
    return null;
  }

  Future<String?> _logExportToFile(BuildContext context, String? path) async {
    if (context.mounted && path != null) {
      final dataFile = await File(path).readAsString();
      return dataFile;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Импорт настроек')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                PosSettingsModel? settingsModel = await importSettings(context);
                if (settingsModel != null) {
                  Navigator.pop(context, settingsModel);
                }
              },
              child: const Text('Импортировать настройки из файла'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _ipController,
              decoration: const InputDecoration(labelText: 'IP Адрес'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _portController,
              decoration: const InputDecoration(labelText: 'Порт'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                try {
                  final ip = _ipController.text;
                  final port = int.tryParse(_portController.text);
                  if (ip.isNotEmpty && port != null) {
                    PosSettingsModel settingsModel = PosSettingsModel(
                      terminalIP: ip,
                      terminalPort: port,
                    );
                    Navigator.pop(context, settingsModel);
                  }
                } catch (e) {}
              },
              child: const Text('Применить настройки'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ipController.dispose();
    _portController.dispose();
    super.dispose();
  }
}
