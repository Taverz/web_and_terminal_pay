import 'dart:async';

import 'package:web_and_terminal_pay/pos/mappers/date_pos_mapper.dart';
import 'package:web_and_terminal_pay/pos/model/pay/get/get_pos_payment_model.dart';
import 'package:web_and_terminal_pay/pos/model/pay/send/send_pos_payment_model.dart';
import 'package:web_and_terminal_pay/pos/model/refund/get/get_pos_refund_model.dart';
import 'package:web_and_terminal_pay/pos/model/refund/send/send_pos_refund_model.dart';
import 'package:web_and_terminal_pay/pos/model/service/get/get_pos_service_model.dart';
import 'package:web_and_terminal_pay/pos/model/service/send/send_pos_service_model.dart';
import 'package:pos_payment_terminal/pos_payment_terminal.dart';

class PosPaymentService {
  late final PosMapper mapper;
  late final POSPaymentModule posModule;
  final String ip;
  final int port;
  PosPaymentService({
    required this.ip,
    required this.port,
  }) {
    posModule = POSPaymentModule(ip: ip, port: port);
    mapper = PosMapper();
  }
  Future<GetPosPaymentModel> pay(SendPosPaymentModel paymentModel) async {
    await posModule.connect();
    final ss = await posModule.createPayment(
      amount: paymentModel.amount,
      clientId: paymentModel.clientId,
      idempotenceKeyERN: paymentModel.idempotenceKeyERN,
      organizationCode: null,
    );
    await posModule.disconnect();
    return GetPosPaymentModel(
      statusText: ss.statusText,
      clientId: ss.clientId,
      idempotenceKeyERN: ss.idempotenceKeyERN,
      success: ss.success,
      receipt: ss.receipt,
      amount: ss.amount,
      rrn: ss.retrievalReferenceNumber,
      dateTime: mapper.convertPosToDateTime(date: ss.date, time: ss.time),
    );
  }

  Future<GetPosRefundModel> refund(SendPosRefundModel refundModel) async {
    await posModule.connect();
    final ss = await posModule.createRefund(
      amount: refundModel.amount,
      clientId: refundModel.clientId,
      retrievalReferenceNumber: refundModel.rrn,
      idempotenceKeyERN: refundModel.idempotenceKeyERN,
      organizationCode: null,
    );
    await posModule.disconnect();
    return GetPosRefundModel(
      clientId: ss.clientId,
      idempotenceKeyERN: ss.idempotenceKeyERN,
      success: ss.success,
      receipt: ss.receipt,
      amount: ss.amount,
      dateTime: mapper.convertPosToDateTime(date: ss.date, time: ss.time),
    );
  }

  Future<GetPosServiceModel> serviceOperation(
    SendPosServiceModel serviceModel,
  ) async {
    await posModule.connect();
    final ss = await posModule.createService(
      clientId: serviceModel.clientId,
      organizationCode: null,
      idempotenceKeyERN: serviceModel.idempotenceKeyERN,
      operationServiceType: OperationServiceType.values.firstWhere(
          (element) => element.value == serviceModel.serviceType.value),
    );
    await posModule.disconnect();
    return GetPosServiceModel(
      clientId: ss.clientId,
      idempotenceKeyERN: ss.idempotenceKeyERN,
      success: ss.success,
      receipt: ss.receipt,
      dateTime: mapper.convertPosToDateTime(date: ss.date, time: ss.time),
    );
  }

  bool abortOperation(SendPosServiceModel serviceModel) {
    final ss = posModule.createAbort(
      clientId: serviceModel.clientId,
      idempotenceKeyERN: serviceModel.idempotenceKeyERN,
      organizationCode: null,
    );
    return ss;
  }
}
