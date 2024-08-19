// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:uuid/uuid.dart';
import 'package:web_and_terminal_pay/service/entity/transaction_history.dart';
import 'package:web_and_terminal_pay/web/yookassa/data/local_save_yookassa.dart';
import 'package:web_and_terminal_pay/web/yookassa/data/yookassa_api.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/amount/yookassa_amount_model.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/current_session_yookassa.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/enums/yookassa_currency_enum.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/refund/get/yookassa_refund_get_model.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/refund/post/yookassa_refund_post_model.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/yookassa_payment_model.dart';

class OrganizationYookassa {
  final int? id;
  final String? name;
  final String? id_api;
  final String? token_api;
  OrganizationYookassa({
    this.id,
    this.name,
    this.id_api,
    this.token_api,
  });
}

class YookassaRepository {
  final YooKassaApi _service;
  final YookassaSaveRepository yookassaSaveRepository;
  CurrentSessionYookassa _session;
  CurrentSessionYookassa get session => _session;
  List<OrganizationYookassa> organizations = [];

  YookassaRepository(
    this._service,
    this._session,
    this.yookassaSaveRepository,
    this.organizations,
  );

  Future<Map<String, dynamic>> getHostPayment() async {
    _checkNullPasswAndUsername(_session);
    final hostInfo = _service.getHostPayment(
      username: _session.username!,
      password: _session.password!,
    );
    await yookassaSaveRepository.saveInfoAccount(hostInfo);
    return hostInfo;
  }

  Future<List<String>> getMethodsPayment() async {
    final paymentMethods = await yookassaSaveRepository.getPaymentMethods();
    return paymentMethods;
  }

  void _checkNullPasswAndUsername(CurrentSessionYookassa session) {
    if (session.password == null) {
      throw Exception('null password');
    }
    if (session.username == null) {
      throw Exception('null username');
    }
  }

  Future<YookassaPaymentModel> createPayment({
    String? organizationsSelect,
    required YookassaPaymentModel paymentModel,
  }) async {
    OrganizationYookassa? selectOrganizationYookassa;
    if (organizationsSelect != null) {
      final selectOrganization = organizations
          .firstWhereOrNull((value) => value.name == organizationsSelect);
      if (selectOrganization != null) {
        selectOrganizationYookassa = selectOrganization;
      }
    }
    if (selectOrganizationYookassa == null) {
      final firstSelect = organizations.first;
      _service.setParams(
        username: firstSelect.id_api!,
        password: firstSelect.token_api!,
      );
    } else {
      _service.setParams(
        username: selectOrganizationYookassa.id_api!,
        password: selectOrganizationYookassa.token_api!,
      );
    }
    _checkNullPasswAndUsername(_session);
    final idempotenceKey = const Uuid().v1();
    _session = _session.copyWith(idempotenceKey: idempotenceKey);
    final result = await _service.createPayment(
      paymentModel: paymentModel,
      username: _session.username!,
      password: _session.password!,
      idempotenceKey: idempotenceKey,
    );
    final convert = YookassaPaymentModel.fromJson(result);
    _session = _session.copyWith(paymentId: convert.id);
    await yookassaSaveRepository.saveTransactionPay(convert);
    return convert;
  }

  /// Check status pay and info
  Future<bool> statusPayAfterCapture() async {
    _checkNullPasswAndUsername(_session);
    return _service.infoPaymentAfterCapture(
      paymentId: _session.paymentId!,
      username: _session.username!,
      password: _session.password!,
    );
  }

  Future<List<Transaction>> historyTransaction() async {
    return yookassaSaveRepository.getTransactions();
  }

  Future<YookassaRefundGetModel> refundPayment() async {
    _checkNullPasswAndUsername(_session);
    final refoundModel = YookassaRefundPostModel(
      paymentId: _session.paymentId!,
      amount: YookassaAmountModel(
        value: _session.amount!,
        currency: YookassaCurrencyEnum.rub,
      ),
    );
    final result = await _service.refundPayment(
      refundModel: refoundModel,
      username: _session.username!,
      password: _session.password!,
      idempotenceKey: _session.idempotenceKey!,
    );
    _session = _session.copyWith(
      idempotenceKey: null,
      paymentId: null,
      refundId: result.paymentId,
    );
    await yookassaSaveRepository.saveTransactionRefund(
      refoundModel,
      result,
    );
    return result;
  }

  Future<bool> refundCheckPayment() async {
    _checkNullPasswAndUsername(_session);
    final result = await _service.refundCheckPayment(
      refundId: _session.refundId!,
      username: _session.username!,
      password: _session.password!,
    );
    return result;
  }

  void clearSession() {
    _session = _session.copyWithClear();
  }
}
