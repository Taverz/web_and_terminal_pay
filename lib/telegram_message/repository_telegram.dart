import 'package:web_and_terminal_pay/telegram_message/api_telegram.dart';

class RepositoryTelegram {
  const RepositoryTelegram(this._apiTelegram);
  final ApiTelegram _apiTelegram;
  static String? CHAT_ID;

  void initChatId(String CHAT_ID){
    CHAT_ID = CHAT_ID;
  }

  Future<void> sendMessage(String message) async{
    if(CHAT_ID == null){
      throw Exception('No init Chat, add Chat ID');
    }
    await _apiTelegram.sendMessage(message, CHAT_ID!);
  }

}
