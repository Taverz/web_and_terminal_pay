import 'package:web_and_terminal_pay/service/crud/crud.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/yookassa_payment_model.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/refund/get/yookassa_refund_get_model.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/refund/post/yookassa_refund_post_model.dart';

class TransactionSaveRepository {
  // = SharedPreferencesCRUD()
  TransactionSaveRepository(this._sharedInit);

  final _keyCheckSharedPay = 'yookassa_shared_pay';
  // final _keyCheckSharedRefund = 'yookassa_shared_refund';
  // final _keyCheckSharedCheck = 'yookassa_shared_check';

  final CRUDInterface _sharedInit;

  Future<void> init() async {
    await _sharedInit.init(_keyCheckSharedPay);
  }

  Future<void> saveTransactionPay(
      YookassaPaymentModel yookassaPaymentModel) async {
    await _sharedInit.putMap(yookassaPaymentModel.toJson());
  }

  Future<void> saveTransactionRefund(
    YookassaRefundPostModel yookassaRefundPostModel,
    YookassaRefundGetModel yookassaRefundGetModel,
  ) async {
    await _sharedInit.putMap({
      'request': yookassaRefundPostModel.toJson(),
      'requesresultt': yookassaRefundGetModel.toJson()
    });
  }

  Future<void> saveTransactionCheck(dynamic check) async {}

  List<dynamic> getTransactions() {
    return [];
  }

  Future<void> clearAllTransaction() async {}
}
