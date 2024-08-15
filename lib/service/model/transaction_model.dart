// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:pos_payment_terminal/src/domain/models/response_models/response_operation_payment_model.dart';

import 'package:web_and_terminal_pay/service/entity/transaction_history.dart';
import 'package:web_and_terminal_pay/pos/model/pay/send/send_pos_payment_model.dart';

class TransactionTerminal implements Transaction {
  SendPosPaymentModel request;
  ResponseOperationPaymentModel result;

  @override
  bool checkCalled;
  @override
  String? checkCheckSystem;
  @override
  String? checkPaySystem;
  @override
  DateTime createAtUTC;
  @override
  int? idTransactionInt;
  @override
  String idTransactionString;
  @override
  bool payCalled;
  @override
  bool refundCalled;
  @override
  double sumFull;
  @override
  TransactionType transactionType;

  TransactionTerminal({
    required this.request,
    required this.result,
    required this.checkCalled,
    this.checkCheckSystem,
    this.checkPaySystem,
    required this.createAtUTC,
    this.idTransactionInt,
    required this.idTransactionString,
    required this.payCalled,
    required this.refundCalled,
    required this.sumFull,
    required this.transactionType,
  });

  TransactionTerminal copyWith({
    SendPosPaymentModel? request,
    ResponseOperationPaymentModel? result,
    bool? checkCalled,
    String? checkCheckSystem,
    String? checkPaySystem,
    DateTime? createAtUTC,
    int? idTransactionInt,
    String? idTransactionString,
    bool? payCalled,
    bool? refundCalled,
    double? sumFull,
    TransactionType? transactionType,
  }) {
    return TransactionTerminal(
      request: request ?? this.request,
      result: result ?? this.result,
      checkCalled: checkCalled ?? this.checkCalled,
      checkCheckSystem: checkCheckSystem ?? this.checkCheckSystem,
      checkPaySystem: checkPaySystem ?? this.checkPaySystem,
      createAtUTC: createAtUTC ?? this.createAtUTC,
      idTransactionInt: idTransactionInt ?? this.idTransactionInt,
      idTransactionString: idTransactionString ?? this.idTransactionString,
      payCalled: payCalled ?? this.payCalled,
      refundCalled: refundCalled ?? this.refundCalled,
      sumFull: sumFull ?? this.sumFull,
      transactionType: transactionType ?? this.transactionType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'request': request.toMap(),
      'result': result.toMap(),
      'checkCalled': checkCalled,
      'checkCheckSystem': checkCheckSystem,
      'checkPaySystem': checkPaySystem,
      'createAtUTC': createAtUTC.millisecondsSinceEpoch,
      'idTransactionInt': idTransactionInt,
      'idTransactionString': idTransactionString,
      'payCalled': payCalled,
      'refundCalled': refundCalled,
      'sumFull': sumFull,
      'transactionType': transactionType.toString(),
    };
  }

  factory TransactionTerminal.fromMap(Map<String, dynamic> map) {
    return TransactionTerminal(
      request:
          SendPosPaymentModel.fromMap(map['request'] as Map<String, dynamic>),
      result: ResponseOperationPaymentModel.fromMap(
          map['result'] as Map<String, dynamic>),
      checkCalled: map['checkCalled'] as bool,
      checkCheckSystem: map['checkCheckSystem'] != null
          ? map['checkCheckSystem'] as String
          : null,
      checkPaySystem: map['checkPaySystem'] != null
          ? map['checkPaySystem'] as String
          : null,
      createAtUTC:
          DateTime.fromMillisecondsSinceEpoch(map['createAtUTC'] as int),
      idTransactionInt: map['idTransactionInt'] != null
          ? map['idTransactionInt'] as int
          : null,
      idTransactionString: map['idTransactionString'] as String,
      payCalled: map['payCalled'] as bool,
      refundCalled: map['refundCalled'] as bool,
      sumFull: map['sumFull'] as double,
      transactionType: TransactionType.paySuccessAfterCheck,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionTerminal.fromJson(String source) =>
      TransactionTerminal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TransactionTerminal(request: $request, result: $result, checkCalled: $checkCalled, checkCheckSystem: $checkCheckSystem, checkPaySystem: $checkPaySystem, createAtUTC: $createAtUTC, idTransactionInt: $idTransactionInt, idTransactionString: $idTransactionString, payCalled: $payCalled, refundCalled: $refundCalled, sumFull: $sumFull, transactionType: $transactionType)';
  }

  @override
  bool operator ==(covariant TransactionTerminal other) {
    if (identical(this, other)) return true;

    return other.request == request &&
        other.result == result &&
        other.checkCalled == checkCalled &&
        other.checkCheckSystem == checkCheckSystem &&
        other.checkPaySystem == checkPaySystem &&
        other.createAtUTC == createAtUTC &&
        other.idTransactionInt == idTransactionInt &&
        other.idTransactionString == idTransactionString &&
        other.payCalled == payCalled &&
        other.refundCalled == refundCalled &&
        other.sumFull == sumFull &&
        other.transactionType == transactionType;
  }

  @override
  int get hashCode {
    return request.hashCode ^
        result.hashCode ^
        checkCalled.hashCode ^
        checkCheckSystem.hashCode ^
        checkPaySystem.hashCode ^
        createAtUTC.hashCode ^
        idTransactionInt.hashCode ^
        idTransactionString.hashCode ^
        payCalled.hashCode ^
        refundCalled.hashCode ^
        sumFull.hashCode ^
        transactionType.hashCode;
  }
}

class TransactionTerminalMain {
  //value
  TransactionTerminal transactionTerminal;

  ///key
  String id;
  TransactionTerminalMain({
    required this.transactionTerminal,
    required this.id,
  });
}
