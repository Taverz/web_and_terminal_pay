import 'package:dio/dio.dart';

// chat": {
//     "id": -45222,
//     "title": "SSS",
//     "type": "group",
//     "all_members_are_administrators": true
// },
class ApiTelegram {
  static final String TOKEN_Telegram = '75_yfU';
  // static String CHAT_ID_Telegram = '';
  // String createUrlMessagePUT(String textMessage) =>
  //     'https://api.telegram.org/bot$TOKEN_Telegram/sendMessage?chat_id=$CHAT_ID_Telegram&text=$textMessage';

  const ApiTelegram(this._dio);
  final Dio _dio;

  Future<void> sendMessage(String message, String YOUR_CHAT_ID) async {
    final String token = TOKEN_Telegram; //'YOUR_BOT_TOKEN';
    final String chatId = YOUR_CHAT_ID; //'YOUR_CHAT_ID';
    final String url = 'https://api.telegram.org/bot$token/sendMessage';

    final response = await _dio.post(
      url,
      data: {
        'chat_id': chatId,
        'text': message,
      },
    );

    if (response.statusCode == 200) {
      print('Message sent successfully');
    } else {
      print('Failed to send message: ${response.data}');
    }
  }
}
