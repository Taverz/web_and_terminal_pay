import 'package:web_and_terminal_pay/service/entity/transaction_history.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/yookassa_payment_model.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/refund/get/yookassa_refund_get_model.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/refund/post/yookassa_refund_post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YookassaSaveRepository {
  YookassaSaveRepository();

  final _keyCheckShared = 'yookassa_shared';

  SharedPreferences? sharedInit;

  Future<void> init() async {
    final shared = await SharedPreferences.getInstance();
    sharedInit = shared;
  }

  saveTransactionPay(YookassaPaymentModel yookassaPaymentModel) {}

  saveTransactionRefund(
    YookassaRefundPostModel yookassaRefundPostModel,
    YookassaRefundGetModel yookassaRefundGetModel,
  ) {}

  saveTransactionCheck(dynamic check) {}

  List<Transaction> getTransactions() {
    return [];
  }

  saveInfoAccount(dynamic check) {}

  updateInfoAccount(dynamic check) {}

  dynamic getInfoAccount() {}
  List<String> getPaymentMethods() {
    return [];
  }

  clearAllTransaction() {}

  // Future<bool> saveOneCheck({
  //   required Map<String, dynamic> mapCurrentCheck,
  //   required String idCheck,
  // }) async {
  //   final allCheck = await getAllChecks();
  //   allCheck[idCheck] = mapCurrentCheck;
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   await sharedPreferences.setString(_keyCheckShared, jsonEncode(allCheck));
  //   return true;
  // }

  // Future<Map> getIdCheck({required String idCheck}) async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   final data = sharedPreferences.getString(_keyCheckShared);
  //   if (data == null) {
  //     throw Exception('Empty');
  //   }
  //   final map = (jsonDecode(data) as Map);
  //   return map.values.firstWhere((element) => element['id'] == idCheck);
  // }

  // Future<Map> deleteItem({required String idCheck}) async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   final data = sharedPreferences.getString(_keyCheckShared);
  //   if (data == null) {
  //     throw Exception('Empty');
  //   }
  //   final map = (jsonDecode(data) as Map);
  //   map.removeWhere((key, value) => value['id'] == idCheck);
  //   await sharedPreferences.setString(_keyCheckShared, jsonEncode(map));
  //   return map;
  // }

  // Future<Map<String, dynamic>> getAllChecks() async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   final data = sharedPreferences.getString(_keyCheckShared);
  //   if (data == null) {
  //     return {};
  //   }
  //   final map = (jsonDecode(data) as Map<String, dynamic>);
  //   return map;
  // }

  // Future<bool> clearAllCheck() async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   await sharedPreferences.setString(_keyCheckShared, jsonEncode({}));
  //   return true;
  // }
}
