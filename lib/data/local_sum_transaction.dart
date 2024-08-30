import 'package:web_and_terminal_pay/crud/crud.dart';

class TransactionsSumSaveRepository {
  // = SharedPreferencesCRUD()
  TransactionsSumSaveRepository(this._sharedInit);

  final _keyCheckSharedPay = 'sum_transactions_shared_pay';

  final CRUDInterface _sharedInit;

  Future<void> init() async {
    await _sharedInit.init(_keyCheckSharedPay);
  }

  Future<void> plusSumTransactionPay(double plusSum) async {
    final fullSum = await _sharedInit.getParameter();
    await _sharedInit.setParameter(fullSum + plusSum);
  }

  Future<void> minusSumTransactionPay(double minusSum) async {
    final fullSum = await _sharedInit.getParameter();
    await _sharedInit.setParameter(fullSum - minusSum);
  }

  Future<double> getTransactionsSum() async {
    return await _sharedInit.getParameter();
  }
}
