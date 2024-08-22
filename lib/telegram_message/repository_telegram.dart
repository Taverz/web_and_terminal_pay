import 'package:web_and_terminal_pay/telegram_message/api_telegram.dart';

class RepositoryTelegram {
  const RepositoryTelegram(this._apiTelegram);
  final ApiTelegram _apiTelegram;
  static String? CHAT_ID;
  bool get initChat => CHAT_ID != null;

  void initChatId(String? ID) {
    CHAT_ID = ID;
  }

  Future<void> sendMessage(String message) async {
    if (CHAT_ID == null) {
      print('No init Chat, add Chat ID / CHAT_ID / Telegram');
      return;
    }
    await _apiTelegram.sendMessage(message, CHAT_ID!);
  }
}
